# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    
    
    validates :user_name, :password_digest, :session_token, presence: true
    validates :user_name, :session_token, uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true

    before_validation :ensure_session_token

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password) 
        #hashes password string as password_digest
        #.create is a BCrypt class method
        #Password is a class/namespace that inherits from BCrypt
        #password_digest is saved as a column and attribute for a model
        @password = password 
        #only maintains on user instance so you can call other methods (mainly validations)
        #that include it, but does not store on DB
        #Using @ so that this doesn't become recursive
    end

    attr_reader :password

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest) #password_object is an instance of BCrypt::Password
        password_object.is_password?(password) 
        #2nd '.is_password?' on password_digest object is a instance method of BCrypt::Password
    #PS - turns out BCrypt is a module that implements the BCrypt hashing function. BCrypt::Password is 
    #a class that includes access to the methods on the BCrypt module. 

    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        if user && user.is_password?(password)
          user
        else
          nil 
        end
    end
end
