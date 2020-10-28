class CitiesController < ApplicationController
before_action :find_city, only: [:show]
      def show
      end
    
      private
      def find_city
        @city = City.find(params[:id])
      end
end