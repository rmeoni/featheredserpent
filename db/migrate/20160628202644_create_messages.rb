class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.text :content
    	t.string :user_id
    	t.string :destination_id
    	t.references :user
    	t.references :destination  

      t.timestamps null: false
    end
  end
end
