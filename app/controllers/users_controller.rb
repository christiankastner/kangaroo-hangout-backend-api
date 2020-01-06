class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            render json: {
                message: "Creation Successful",
                user: {
                    email: user.email, id: user.id
                }
            }
        else
            render json: {
                message: "Failed Fetch",
            }
        end
    end

    def login
        user = User.find_by(user_params)
        if user
            render json: {
                message: "Login Successful",
                user: {
                    email: user.email, id: user.id
                }
            }
        else
            render json: {
                message: "Failed Fetch",
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
        params.require(:user).permit(:email, :name)
    end
end
