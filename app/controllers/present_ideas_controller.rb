class PresentIdeasController < ApplicationController
    def index
        @ideas = PresentIdea.all
        render json: @ideas, include: [:loved_one]
    end    
    
    def create
        @idea = PresentIdea.create({
            loved_one_id: params[:loved_one_id],
            title: params[:title],
            url: params[:url],
            description: params[:description],
            status: params[:status],
        })
        
        render json: {idea: @idea}, status: :created
    end
end
