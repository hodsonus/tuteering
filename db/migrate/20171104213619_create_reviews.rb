class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :tutor_id
      t.integer :parent_id
      t.integer :rating
    end
  end
end
