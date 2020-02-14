class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      @user = User.find_by(email: user_login_params[:email])
      #User#authenticate comes from BCrypt
      if @user && @user.authenticate(user_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ user_id: @user.id })
        render json: { user: @user.email, jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    def show
      @user = current_user
      if logged_in?
        render json: @user
      else
        render json: {error: 'No user could be found'}, status: 401
      end
    end

    def destroy
      @user = current_user
      if logged_in?
        @user.destroy
        render json: {status: :deleted}
      else
        render json: {error: 'No user could be found'}, status: 401
      end
    end

    def edit
      @user = current_user
      if logged_in?
        @user.update(user_login_params)
        render json: @user
      else
        render json: {error: 'No user could be found'}, status: 401
      end
    end

    private
 
    def user_login_params
        params.require(:user).permit(:email, :password, :name)
    end
end
