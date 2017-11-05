class ChildsController < ApplicationController
  expose :child
  expose :new_child do
    User.new
  end

  def index
  end

  def show
  end
end
