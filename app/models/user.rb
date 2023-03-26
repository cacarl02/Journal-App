require 'bcrypt'

class User < ApplicationRecord 
    has_many :categories
    has_many :tasks, through: :categories
    after_create :generate_token

    def self.signup(user_params)
        password_hash = BCrypt::Password.create(user_params[:password])
        create(name: user_params[:name], email: user_params[:email], password: user_params[:password_hash])
    end

    def generate_token
        self.token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join

        self.save
    end
end
