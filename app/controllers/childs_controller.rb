class ChildsController < ApplicationController
  expose :child
  expose :new_child do
    User.new
  end

  expose :child_profile do
    User.find(params[:id])
  end

  expose :learning_styles do
    [ ["Select a learning style", ""], "Visual", "Listening", "Hands On", "N/A"]
  end


  def index
  end

  def show
  end

  private
  def child_params
    params.require(:child).permit(
      :comments,
      :first_name,
      :last_name,
      :learning_style
    )
  end
end
