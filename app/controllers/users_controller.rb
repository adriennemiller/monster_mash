class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: [:new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    #CREATE
    def new
      @user = User.new
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

    def show
      @user = User.find(params[:id])
    end

    #UPDATE
    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
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
  end
