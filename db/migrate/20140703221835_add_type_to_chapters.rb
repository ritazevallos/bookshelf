class AddTypeToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :type, :boolean
  end
end
