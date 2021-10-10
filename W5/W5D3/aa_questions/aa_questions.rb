require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end


end

class User
    
    attr_accessor :id, :fname, :lname
    
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
    
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE id = #{id}")
        data.map{ |datum| User.new(datum) }[0]
    end
    
    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE fname = '#{fname}' AND lname = '#{lname}'")
        data.map{ |datum| User.new(datum) }[0]
    end

    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_user_id(id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(id)
    end

    def liked_questions 
        QuestionLikes.liked_questions_for_user_id(id)
    end

    def average_karma
        data = QuestionsDatabase.instance.execute(<<-SQL, @id)
            SELECT COUNT(user_id) / COUNT(DISTINCT(question_id)) AS avg_karma
            FROM questions
            LEFT OUTER JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            WHERE 
                questions.id = ?
        SQL
        data[0]['avg_karma']
    end
end

class Question 
    
    attr_accessor :id, :title, :body, :author_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
    
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE id = #{id}")
        data.map{ |datum| Question.new(datum) }[0]
    end
    
    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE author_id = #{author_id}")
        data.map{ |datum| Question.new(datum) }[0]
    end

    def author
        User.find_by_id(author_id)
    end

    def replies
        Reply.find_by_question_id(id)
    end

    def followers
        QuestionFollow.followers_for_question_id(id)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end
    
    def likers 
        QuestionFollow.likers_for_question_id(id)
    end

    def num_likes 
        QuestionFollow.num_likes_for_question_id(id)
    end

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end

end

class Reply

    attr_accessor :id, :question_id, :parent_id, :replier_id, :body

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @replier_id = options['replier_id']
        @body = options['body']
    end
    
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE id = #{id}")
        data.map{ |datum| Reply.new(datum) }[0]
    end
    
    def self.find_by_user_id(user_id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE replier_id = #{user_id}")
        data.map{ |datum| Reply.new(datum) }[0]
    end

    def self.find_by_question_id(question_id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE question_id = #{question_id}")
        data.map{ |datum| Reply.new(datum) }
    end

    def author
        User.find_by_id(replier_id)
    end

    def question
        Question.find_by_id(question_id)
    end

    def parent_reply
        return nil if parent_id.nil?
        Reply.find_by_id(parent_id)
    end

    def child_replies
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE parent_id = #{id}")
        data.map{ |datum| Reply.new(datum) }[0]
    end
end

class QuestionFollow
    
    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT user_id
            FROM question_follows
            WHERE question_id = ?
        SQL
        data.map { |datum| User.find_by_id(datum['user_id']) }
    end

    def self.followed_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT question_id
            FROM question_follows
            WHERE user_id = ?
        SQL
        data.map { |datum| Question.find_by_id(datum['question_id'])}
    end

    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT question_id
            FROM question_follows
            GROUP BY question_id
            ORDER BY COUNT(user_id) DESC
            LIMIT ?
        SQL
        data.map { |datum| Question.find_by_id(datum['question_id'])}
    end
end

class QuestionLike

    def self.likers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT user_id
            FROM question_likes
            WHERE question_id = ?
        SQL
        data.map { |datum| User.find_by_id(datum['user_id']) }
    end

    def self.num_likes_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT COUNT(user_id) AS like_count
            FROM question_likes
            WHERE question_id = ?
        SQL
        data[0]['like_count']
    end

    def self.liked_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT question_id
            FROM question_likes
            WHERE user_id = ?
        SQL
        data.map { |datum| Question.find_by_id(datum['question_id']) }
    end
    
    def self.most_liked_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT question_id
            FROM question_likes
            GROUP BY question_id
            ORDER BY COUNT(user_id) DESC
            LIMIT ?
        SQL
        data.map { |datum| Question.find_by_id(datum['question_id'])}
    end
end


if __FILE__ == $PROGRAM_NAME
    p User.find_by_id(6).average_karma
end