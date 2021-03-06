class InterestsController < ApplicationController
    skip_before_action :authenticate
    def index
        @interests = Interest.all
        render json: @interests, include: [:loved_one]
    end    
    
    def create
        @interest = Interest.create({
            loved_one_id: params[:loved_one_id],
            interest: params[:interest]
        })
        
        render json: {interest: @interest}, status: :created
    end

    def destroy
        @interest = Interest.find(params[:id])
        @interest.destroy
        render json: {message: "Removed interest from your list."}
    end

end
