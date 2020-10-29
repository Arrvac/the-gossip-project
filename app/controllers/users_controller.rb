class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.save(params[:first_name, :last_name, :email, :city, :age, :password])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
