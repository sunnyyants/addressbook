class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  before_action :get_friendships, only: [:show]

  before_action :return_current_users_friends, only: [:index,:show]

  before_filter :require_login, only: [:update, :edit,:index, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up successfully!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def index
    if params[:search]
      @users = User.where('name LIKE?', "%#{params[:search]}%").paginate(:per_page => 5, :page => params[:page])
    else
      @users = []
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params_without_password)
        format.html { redirect_to(@user) }
        format.json { respond_with_bip(@user) }
      else
        format.html { redirect_to(edit_user_path(@user), :notice => "Update Failed! Email Address or Phone number existed...") }
        format.json { respond_with_bip(@user) }
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def return_current_user
    @user = current_user
  end

  def return_current_users_friends
    @user = current_user
    @users_friends = []
    @user.friendships.each do |f|
      @users_friends.append(f.friend.id)
    end
    @users_friends_number = @users_friends.length
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone, :image)
  end

  def user_params_without_password
    params.require(:user).permit(:name,:email,:phone,:image)
  end

  def get_friendships
    if current_user
      @current_friendships = current_user.friendships.paginate(:per_page => 6, :page => params[:page])
    else
      redirect_to signin_path
    end
  end

end
