class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :message
    	t.string :rating

    	t.integer :user_id
    	t.integer :palce_id

      t.timestamps
    end
    add_index :comments, [:user_id, :place_id]
    add_index :commnets, :place_id
  end
end
