class StaticPagesController < ApplicationController
  def home
    @name = params['first_name']
    puts @name
  end

  def contact
  end

  def index
    @goss = Gossip.all
  end

  def team
  end

  def show
    @goss_id = Gossip.find(params['id'])
  end
end