class AddCampaignIdToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :campaign_id, :integer
  end

  def self.down
    remove_column :photos, :campaign_id
  end
end
