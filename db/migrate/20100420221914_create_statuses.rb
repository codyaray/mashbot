class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :campaign_id
      t.string :message
      t.integer :creator_id
      t.datetime :go_live

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
