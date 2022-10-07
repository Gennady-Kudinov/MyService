class AdminController < ApplicationController
  def index
   @total_cars = Car.count
   @total_clients = Client.count
  end

  def show
   
  end

  def search
    file = Dir.glob("**/*#{@search}*.*")
  end

  private

end
