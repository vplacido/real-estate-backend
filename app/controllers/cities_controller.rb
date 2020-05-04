class CitiesController < ApplicationController
    def index
        city = City.all     
        render json: city
    end

    def new
        city = City.new
    end

    def create
        city = City.create(city_name: params[:city_name], state_name: params[:state_name], zipcode: params[:zipcode])
        render json: city 
    end

    def show
        city = City.find(params[:id])
        render json: city 
    end
end
