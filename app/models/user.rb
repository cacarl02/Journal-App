class User < ApplicationRecord
    include BCrypt 
    validates :email, uniqueness: true
    has_many :categories
    has_many :tasks, through: :categories
    after_create :generate_token

    def self.signup(user_params)
        password_hash = Password.create(user_params[:password])
        create(name: user_params[:name], email: user_params[:email], password: password_hash)
    end

    def self.signin(user_params)
        user = find_by(email: user_params[:email])

        if user.present?
            return user if Password.new(user.password) == user_params[:password]
        end
    end

    def generate_token
        self.token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join

        self.save
    end
end
