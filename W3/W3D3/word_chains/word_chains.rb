require "set"

class WordChainer

    def initialize(file)
        @dictionary = File.readlines(file).map(&:chomp).to_set
        
    end

    def adjacent_words(word)
        cur_word = word.dup
        alpha = ("a".."z").to_a
        adj_words = Set.new
        cur_word.each_char.with_index do |char, idx|
            alpha.each do |letter|
                if letter != char 
                    cur_word[idx] = letter 
                    adj_words.add(cur_word) if @dictionary.include?(cur_word)
                    cur_word = word.dup
                end
            end
        end
        adj_words
    end
    
    def run(source, target)
        @current_words = [source].to_set
        @all_seen_words = {source: nil}
        while !@current_words.empty?
            new_current_words = Set.new
            @current_words.each do |current_word|
                adjacent_words(current_word).each do |current_word_adj|
                    explore_current_words(current_word_adj, new_current_words, current_word)
                end
            end
            # print new_current_words
            @current_words = new_current_words
        end
    end

    def explore_current_words(current_word_adj, new_current_words, current_word)
        if !@all_seen_words.include?(current_word_adj)
            new_current_words.add(current_word_adj)
            @all_seen_words[current_word_adj] = current_word
        end
        puts "#{current_word} => #{current_word_adj}"
        new_current_words
    end


end

wc = WordChainer.new("dictionary.txt")

p wc.run("fun", "cat")