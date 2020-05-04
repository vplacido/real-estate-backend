class ReviewsController < ApplicationController
    # def index
    #     review = Review.all     
    #     render json: review
    # end

    # def new
    #     review = Review.find(params[:id])
    # end

    # def create
    #     review = Review.create(stars: params[:stars], description: params[:description], like_id: params[:like_id], buyer_id: params[:buyer_id], listing_id: params[:listing_id], realtor_id: params[:realtor_id])
    #     render json: review
    # end

    # def show
    #     review = Review.find(params[:id])
    #     render json: review
    # end

    # def edit
    #     review = Review.find(params[:id])
    # end

    # def update
    #     review = Review.find(params[:id])
    #     # fix to update
    # end

    # def destroy
    #     review = Review.find(params[:id])
    #     review.destroy
    # end

    def index
        @reviews = listing_id ? Review.get_by_listing_id(listing_id) : Review.all
        render :index
      end
    
      private
    
      def listing_id
        params[:listing_id]
      end
    
end
