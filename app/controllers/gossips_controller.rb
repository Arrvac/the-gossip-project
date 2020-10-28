class GossipsController < ApplicationController
before_action :find_gossip, only: [:show, :edit, :update, :destroy]

  def index
    @gossip = Gossip.all
  end

  def show
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.first
    if @gossip.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @gossip, notice: "Bravo! You created a new message"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @gossip.update(gossip_params)
    redirect_to index_path
  end

  def destroy
    @gossip.destroy
    redirect_to index_path
  end

  private
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end

    def find_gossip
      @gossip = Gossip.find(params[:id])
    end
end