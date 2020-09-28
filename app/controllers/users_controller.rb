class UsersController < ApplicationController    
    skip_before_action :authenticate, only: [:create]
    
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
