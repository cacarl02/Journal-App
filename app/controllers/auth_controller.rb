class AuthController < ApplicationController
    
    def signin
    end
    
    def signup
        
    end
    
    def new_session
        if user = User.signin(user_params)
            
            redirect_to categories_path
        else
            render json: { not_found: true }, status: 403 
        end    
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
        redirect_to signin_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def signup_params
        params.permit(:name, :email, :password, :password_confirmation)
    end

    def signin_params
        params.require(:user).permit(:email, :password)
    end
end