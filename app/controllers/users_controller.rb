class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user_id: user.id)
            render json: {
                status: :created,
                user: {
                    jwt: token
                }
            }
        else
            render json: {
                status: :not_acceptable
            }
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {message: "User deleted"}
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end
end
