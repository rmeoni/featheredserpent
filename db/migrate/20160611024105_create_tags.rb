class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
	t.string :title
	t.string :image
	t.references :country
      t.timestamps null: false
    end
  end
end
