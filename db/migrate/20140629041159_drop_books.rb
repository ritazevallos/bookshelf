class DropBooks < ActiveRecord::Migration
  def change
  	drop_table :books
    create_table :books do |t|
      t.string :link
      t.string :title
      t.text :description

	  t.references :category, index: true

      t.timestamps
  	end
	end
end
