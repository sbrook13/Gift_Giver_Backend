class UsersController < ApplicationController    
    skip_before_action :authenticate, only: [:create, :update, :index]
    def index
        @users = User.all
        render json: @users
    end

    def profile
        render json: @user, include: [:loved_ones, :present_ideas, :interests]
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            payload ={ user_id: @user.id }
            secret = Rails.application.secret_key_base
            token = JWT.encode payload,secret

            render json: {token: token, user: @user}, status: :created
        else
            render json: @user.errors.full_messages
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update({
            password: params[:password]
        })
        render json: @user
    end

    private

    def user_params
        params.require(:user).permit([:name, :email, :username, :password])
    end
end
