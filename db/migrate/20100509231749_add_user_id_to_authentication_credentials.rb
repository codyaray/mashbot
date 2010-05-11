class AddUserIdToAuthenticationCredentials < ActiveRecord::Migration
  def self.up
    add_column :authentication_credentials, :user_id, :integer
  end

  def self.down
    remove_column :authentication_credentials, :user_id
  end
end
