class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => 'Signed up!'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(current_user)
  end

  def set_name
    @user = User.find(current_user)
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'Name was successfully updated. Check it out.'
    else
      render action: 'show'
    end
  end
end
