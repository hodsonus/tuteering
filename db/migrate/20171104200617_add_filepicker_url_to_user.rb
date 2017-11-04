class AddFilepickerUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :filepicker_url, :text
  end
end
