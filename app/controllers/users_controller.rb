class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: [:new, :create, :like]
    before_action :set_user, only: [:show, :destroy]

    #CREATE
    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:messages] = @user.errors.full_messages
        redirect_to new_user_path
      end
    end

    #READ
    def index
      @users = User.all
    end

    def like
      user = User.find_by(id: session[:user_id])
      if !user
        return
      end

      if (params[:do_like])
        user.likes.create(monster_id: params[:id])
      else
        like = user.likes.find_by(monster_id: params[:id])
        like.destroy if like
      end
      
      redirect_to monster_path(params[:id])
    end

    def show
      @user = User.find(params[:id])
    end

    #DESTROY
    def destroy
      @user.destroy
      redirect_to users_path
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def like_params
      params.require(:like).permit(:user_id, :monster_id)
    end
  end
