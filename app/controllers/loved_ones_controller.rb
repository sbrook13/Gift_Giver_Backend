class LovedOnesController < ApplicationController
    def index
        @loved_ones = LovedOne.where(user_id: @user.id)
        render json: @loved_ones, include: [:interests, :present_ideas]
    end

    def show
        @loved_one = LovedOne.find(params[:id])
        render json: @loved_one, include: [:interests, :present_ideas]
    end
    
    def create
        @lovedOne = LovedOne.new({
            user_id: @user.id,
            name: params[:name],
            birthday: params[:birthday],
            gender: params[:gender],
            relationship: params[:relationship],
            mailing_address1: params[:mailing_address1],
            mailing_address2: params[:mailing_address2],
            mailing_city: params[:mailing_city],
            mailing_state: params[:mailing_state],
            mailing_zip: params[:mailing_zip]
        })

        if @lovedOne.valid?
            @lovedOne.save
            render json: {lovedOne: @lovedOne}, status: :created
        else
            render json: @lovedOne.errors.full_messages
        end
    end

    def update
        @loved_one = LovedOne.find(params[:id])
        @loved_one.update(lovedOne_params)
        render json: @loved_one
    end

    def destroy
        @lovedOne = LovedOne.find(params[:id])
        @lovedOne.destroy
        render json: {message: "Removed loved one from your list."}
    end

    private

    def lovedOne_params
        params.require(:loved_one).permit([:id, :name, :birthday, :gender, :image_url, :relationship, :mailing_address1, :mailing_address2, :mailing_city, :mailing_state, :mailing_zip])
    end
end
