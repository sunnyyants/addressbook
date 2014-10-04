class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  before_filter :require_login, only: [:update, :edit,:index,:update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def index
    @users = User.all
  end

  def update


    if @user.update_attributes(user_params_without_password)
      redirect_to @user, :notice => "Updated informations successfully!"
    else
      redirect_to edit_user_path(@user), :notice => "Update Failed! Email Address or Phone number existed..."
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :phone)
    end

    def user_params_without_password
      params.require(:user).permit(:name,:email,:phone)
    end
end
