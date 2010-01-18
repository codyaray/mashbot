class ChangeEndDateToStringInCampaigns < ActiveRecord::Migration
  def self.up
    remove_column :campaigns, :start_date
    add_column :campaigns, :start_date, :string
    remove_column :campaigns, :end_date
    add_column :campaigns, :end_date, :string
  end

  def self.down
    remove_column :campaigns, :start_date
    add_column :campaigns, :start_date, :date
    remove_column :campaigns, :end_date
    add_column :campaigns, :end_date, :date
  end
end
