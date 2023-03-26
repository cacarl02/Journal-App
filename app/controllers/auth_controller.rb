class AuthController < ApplicationController
    
    def signin
        @user = User.new
    end

    def signup

    end

    def new_session
        
    end

    def new_account
        if (signup_params[:password] == signup_params[:password_confirmation])
            @user = User.signup(user_params)

            redirect_to signin_path
        else
            render :signup, status: :unprocessable_entity
        end
    end

    def logout

    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def signup_params
        params.permit(:name, :email, :password, :password_confirmation)
    end
end