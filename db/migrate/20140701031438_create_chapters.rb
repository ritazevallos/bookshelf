class CreateChapters < ActiveRecord::Migration
  def change
  	drop_table :chapters
    create_table :chapters do |t|
      t.text :content
	  t.references :book, index: true
      t.timestamps
    end
  end
end
