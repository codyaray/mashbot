class AddSentAndGoLiveToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :go_live, :datetime
    add_column :photos, :sent, :boolean
  end

  def self.down
    remove_column :photos, :sent
    remove_column :photos, :go_live
  end
end
