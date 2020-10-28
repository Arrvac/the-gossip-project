class TagsController < ApplicationController
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
    
      private
        def gossip_params
          params.require(:gossip).permit(:title, :content)
        end
end