class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :go_live
      t.integer :creator_id
      t.integer :campaign_id
      t.boolean :sent
      t.string :tags
      t.boolean :private

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
