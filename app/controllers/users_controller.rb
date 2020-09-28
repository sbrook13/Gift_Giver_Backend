class UsersController < ApplicationController
    def create
        @user = User.new({
            username: params[:username],
            name: params[:name],
            email: params[:email],
            password: params[:password]
        })
        if @user.valid?
            @user.save
            render json: {user: @user}, status: :created
        else
            render json: @user.errors.full_messages
        end
    end
end
