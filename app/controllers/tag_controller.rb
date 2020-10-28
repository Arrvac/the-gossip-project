class TagsController < ApplicationController
      def new
        @tag = Tag.new
      end
    
      def create
        @tag = Tag.new(tag_params)
        @tag.user = User.first
        if @tag.save
          flash[:success] = "Welcome to the Sample App!"
          redirect_to gossips_path, notice: "Bravo! You created a new message"
        else
          render :new
        end
      end
    
      private
        def tag_params
          params.require(:tag).permit(:title)
        end
end