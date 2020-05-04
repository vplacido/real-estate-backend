class TownsController < ApplicationController
    def index
        town = Town.all     
        render json: town
    end

    def new
        town = Town.new 
    end

    def create
        town = Town.create(name: params[:name], city_id: params[:city_id])
        render json: town
    end

    def show
        town = Town.find(params[:id])
        render json: town
    end
end
