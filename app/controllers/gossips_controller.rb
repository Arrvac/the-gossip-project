class GossipsController < ApplicationController

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    @gossip = Gossip.find(params[:id])
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
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to index_path
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    redirect_to index_path
  end

  private
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end