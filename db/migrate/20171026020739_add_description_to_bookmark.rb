class AddDescriptionToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :description, :string
  end
end
