class AdminController < ApplicationController
  def index
   @total_cars = Car.count
   @total_clients = Client.count
  end

  private

end
