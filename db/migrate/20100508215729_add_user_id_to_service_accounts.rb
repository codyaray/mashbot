class AddUserIdToServiceAccounts < ActiveRecord::Migration
  def self.up
    add_column :service_accounts, :user_id, :integer
  end

  def self.down
    remove_column :service_accounts, :user_id
  end
end
