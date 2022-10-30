class MessagesController < ApplicationController
  def create
    @current_user = current_user

    @message =
      @current_user.messages.create(
        content: msg_params[:content], chat_id: params[:chat_id]
      )
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
