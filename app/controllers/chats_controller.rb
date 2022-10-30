class ChatsController < ApplicationController
  after_action :authenticate_user!

  def index
    @chats = Chat.all
  end 

  def new 
  end

  def create 
  end
  
  def show 
    @current_user = current_user 
    @single_chat = Chat.find(params[:id])
    @chats = Chat.all
    @message = Message.new
    @messages = @single_chat.messages
    
    render :index 
  end
  
end
