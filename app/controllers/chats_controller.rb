class ChatsController < ApplicationController
  after_action :authenticate_user!

  def index
    @chat = Chat.all
  end 

  def new 
  end

  def create 
  end
  
  def show 
  end
  
end
