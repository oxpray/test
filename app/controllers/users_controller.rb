class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
  
     if @user.save_with_captcha
      flash[:notice] = "Registrazione Completata , il tuo account sara' attivato al piu' presto."
      redirect_to root_url
    else
      render :action => 'new'
    end
  
    
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
