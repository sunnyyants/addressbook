class SessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:name], params[:password], params[:remember_me])
    respond_to do |format|
      if @user
        format.html { redirect_back_or_to current_user }
      else
        flash.now.alert = "name or password was in valid"
        format.html { render :new }
      end
    end
  end
  def destroy
    logout
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out successfully!"}
    end
  end
end
