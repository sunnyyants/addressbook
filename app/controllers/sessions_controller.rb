class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:name], params[:password], params[:remember_me])
    if user
      redirect_back_or_to current_user, :notice => "Logged in!"
    else
      flash.now.alert = "name or password was in valid"
      render :new
    end
  end


  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end
