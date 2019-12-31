class UsersController < ApplicationController

    def create
        byebug()
        User.create(user_params)
        
    end


    private

    def user_params
        params.require(:user).permit(:email, :name)
    end
end
