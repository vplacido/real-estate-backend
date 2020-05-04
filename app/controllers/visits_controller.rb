class VisitsController < ApplicationController
    def index
        visit = Visit.all     
        render json: visit
    end

    def new
        visit = Visit.new
    end

    def create
        visit = Visit.create(like_id: params[:like_id], buyer_id: params[:buyer_id], listing_id: params[:listing_id], realtor_id: params[:realtor_id], city_id: params[:city_id], review_id: params[:review_id])
        render json: visit
    end

    def show
        visit = Visit.find(params[:id])
        render json: visit
    end
end
