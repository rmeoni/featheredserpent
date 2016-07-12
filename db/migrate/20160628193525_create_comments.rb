class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content
    	t.string :user_id
    	t.references :user 
    t.timestamps null: false
    end
  end
end
