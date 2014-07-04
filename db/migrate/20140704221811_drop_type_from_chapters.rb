class DropTypeFromChapters < ActiveRecord::Migration
  def change
  	rename_column :chapters, :type, :isLink
  end
end
