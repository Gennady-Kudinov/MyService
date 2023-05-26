class ChatsController < ApplicationController
  after_action :authenticate_user!

  def index 
    @chats = Chat.all
  end 

  def new 
    @chat = Chat.new 
  end

  def create 
    @chat = Chat.new chat_params 

    if @chat.save 
      redirect_to chat_path @chat 
    else 
      render :new 
    end 
  end
  
  def show 
    @current_user = current_user 
    @single_chat = Chat.find(params[:id])
    @chats = Chat.all
    @message = Message.new
    @messages = @single_chat.messages
  
    render :index
  end

  private 

  def chat_params 
    params.require(:chat).permit(:name, messages_attributes: [:id, :content, :_destroy])
  end
  
end
