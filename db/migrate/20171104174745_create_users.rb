class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :bio
      t.string :kind
      t.string :email,                null: false
      t.string :password_digest,      null: false
      t.string :password_reset_token, null: false, limit: 60
      t.string :first_name
      t.string :last_name
      t.string :qualifications
      t.boolean :background_checked
      t.integer :age
      t.integer :grade
      t.integer :parent_id
      t.integer :zipcode
      t.string :languages, array: true, default: "{}"
      t.string :availibility, array: true, default: "{}"
      t.timestamps
    end
  end
end
