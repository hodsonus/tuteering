class AddLearningStyleAndCommentsToUser < ActiveRecord::Migration
  def change
    add_column :users, :learning_style, :string
    add_column :users, :comments, :text
  end
end
