class AddSentToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :sent, :boolean
  end

  def self.down
    remove_column :statuses, :sent
  end
end
