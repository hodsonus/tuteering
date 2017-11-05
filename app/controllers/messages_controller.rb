class MessagesController < ApplicationController
  expose :tutor do
    User.find(params[:tutor_id])
  end

  expose :new_message do
    Message.new
  end

  def index
  end

  def create
    message = Message.new(message_params)
    tutor_id = params[:message][:tutor_id]
    if message.save
      redirect_to message_path(message.id, tutor_id: tutor_id)
    else
      redirect_to new_messages_path(tutor_id: tutor_id)
    end
  end

  private
  def message_params
    params.require(:message).permit(
      :tutor_id,
      :parent_id,
      :body,
      :from_id
    )
  end

end
