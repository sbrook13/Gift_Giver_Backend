class AuthenticationController < ApplicationController
    skip_before_action :authenticate, only: [:login]
    
    def login
        @user = User.find_by username: params[:username]

        if !@user
            render json: {error: "Username does not exist"}, status: :unauthorized
        else
            if !@user.authenticate params[:password]
                render json: {error: "Incorrect Password"}, status: :unauthorized
            else
                payload ={ user_id: @user.id }
                secret = Rails.application.secret_key_base
                token = JWT.encode payload,secret
                
                render json: {token: token}, status: :created
            end
        end
    end
end
