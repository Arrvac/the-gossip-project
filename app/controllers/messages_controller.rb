class MessagesController < ApplicationController
    before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @message = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = User.first
    if @message.save
      redirect_to gossip_path(@message.gossip), notice: "Bravo! You created a new message"
    else
      render :new
    end
  end

  def edit
    find_message
  end

  def update
    @message.update(message_params)
    redirect_to gossip_path(@message.gossip)
  end

  def destroy
    save_id = @message.gossip
    @message = find_message
    @message.delete
    redirect_to gossip_path(save_id)
  end

  private
    def message_params
      params.require(:message).permit(:title, :content, :tag)
    end

    def find_message
      @message = Message.find(params[:id])
    end
end
