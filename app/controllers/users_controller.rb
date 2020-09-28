class UsersController < ApplicationController    
    skip_before_action :authenticate, only: [:create]

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            render json: {user: @user}, status: :created
        else
            render json: @user.errors.full_messages
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    private

    def user_params
        params.require(:user).permit([:name, :email, :username, :password])
    end
end
