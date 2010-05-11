class AddTitleToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :title, :string
  end

  def self.down
    remove_column :photos, :title
  end
end
