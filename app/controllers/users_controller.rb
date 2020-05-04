class UsersController < ApplicationController
  # skip_before_action :require_login, only: [:create]
    # def index
    #     user = User.all     
    #     render json: user
    # end
    
    # def new
    #   user = User.new
    #   render json: user
    # end

    # def create
    #   user = User.create(user_params) 
    #   if user.valid?
    #       payload = {user_id: user.id}
    #       token = encode_token(payload)
    #       puts token
    #       render json: {user: user, jwt: token}
    #   else
    #       render json: {errors: user.errors.full_messages}, status: :not_acceptable
    #   end
    # end

    # def show
    #   user = User.find(params[:id])
    #   render json: user
    # end

    # def edit
    #   user = User.find(params[:id])
    # end

    # def update
    #   user = User.find(params[:id])
    #   user.update(params.require(:user).permit(:name, :username))
    #   # fix later
    # end

    # def destroy
    #   user = User.find(params[:id])
    #   user.delete
    # end
  
    # private 
    # def user_params
    #   params.permit(:username, :password)
    # end
    def index
      @users = host_id ? [User.with_attached_photo.find_by(id: host_id)] : User.with_attached_photo.all
      render :index
    end
    
    def create
      @user = User.new(user_params)
  
      if @user.save
        login!(@user)
        render :show
      else
        render json: @user.errors.full_messages, status: 401
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:firstname, :username, :password, :bio, :joined_date, :photo)
    end
  
    def host_id
      params[:host_id]
    end
end
