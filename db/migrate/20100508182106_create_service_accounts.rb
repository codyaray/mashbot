class CreateServiceAccounts < ActiveRecord::Migration
  def self.up
    create_table :service_accounts do |t|
      t.string :service
      t.string :login
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :service_accounts
  end
end
