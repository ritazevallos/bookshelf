class AddLinkToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :link, :string
  end
end
