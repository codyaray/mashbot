class CreateAuthenticationCredentials < ActiveRecord::Migration
  def self.up
    create_table :authentication_credentials do |t|
      t.string :service, :null => false
      t.string :details, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :authentication_credentials
  end
end
