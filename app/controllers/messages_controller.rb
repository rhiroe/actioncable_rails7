class MessagesController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    room.messages.create!(**message_params, user: current_user)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to room }
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
