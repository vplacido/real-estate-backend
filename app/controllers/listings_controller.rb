class ListingsController < ApplicationController
    # def index
    #     listing = Listing.all     
    #     render json: listing
    # end

    # def new
    #     listing = Listing.new
    # end

    # def create
    #     listing = Listing.create(title: params[:title], description: params[:description], address: params[:address], listing_type: params[:listing_type], price: params[:price], town_id: params[:town_id])
    #     render json: listing
    # end

    # def show
    #     listing = Listing.find(params[:id])
    #     render json: listing
    # end

    # def edit
    #     listing = Listing.find(params[:id])
    # end

    # def update
    #     listing = Listing.find(params[:id])
    #     # listing.update()
    #     # fix
    #     render json: listing
    # end

    # def destroy
    #     listing = Listing.find(params[:id])
    #     listing.delete
    # end

    def index    
        @listings = bounds ? Listing.in_bounds(bounds).with_attached_thumbnails.with_attached_photos.includes(:reviews) : Listing.all.with_attached_thumbnails.with_attached_photos.includes(:reviews)
        
        if @listings
          render :index  
        else
          render json: ["Listings not found!"], status: 422
        end
      end
    
      def show
        @listing = Listing.with_attached_thumbnails.with_attached_photos.includes(:reviews).includes(:reviewers).find_by(id: params[:id])
    
        if @listing
          render :show
        else
          render json: ["Listing not found!"], status: 422
        end
      end
      
      private
    
      def listing_params
        params.require(:listing).permit(:title, :description, :listing_type, :price, :latitude, :longitude, :realtor_id, photos: [], thumbnails: [])
      end
    
      def bounds
        params[:bounds]
      end
    
      def user_id
        params[:user_id]
      end
end
