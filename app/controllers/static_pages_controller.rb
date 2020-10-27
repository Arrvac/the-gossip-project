class StaticPagesController < ApplicationController
  def home
    @name = params[:first_name]
    puts @name
  end

  def contact
  end

  def team
  end

  def show
    @goss_id = Gossip.find(params[:id])
  end

  def user_show
    @usr = User.find(params[:id])
  end
  
end
