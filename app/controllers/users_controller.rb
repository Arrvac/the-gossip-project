class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :age, :password))
    @user.city = City.first
    if @user.save
      redirect_to login_path, notice: "Bravo! You created a new message"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
