class LikesController < ApplicationController
    def index
        like = Like.all     
        render json: like
    end

    def new
        like = Like.new
    end

    def create
        like = Like.create(buyer_id: params[:buyer_id], listing_id: params[:listing_id])
        if like.valid?
            render json: like 
        else
            flash[:errors] = like.errors.full_messages
        end
    end

    def show
        like = Like.find(params[:id])
        render json: like
    end

    def destroy
        like = Like.find(params[:id])
        like.delete
    end
end
