class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :caption
      t.string :tags
      t.string :permissions
      t.string :optional_fields

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
