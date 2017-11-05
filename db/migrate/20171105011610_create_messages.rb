class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :tutor_id
      t.integer :parent_id
      t.text :body
      t.integer :from_id
      t.timestamps
    end
  end
end
