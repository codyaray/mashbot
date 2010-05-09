class SetSentFalseByDefaultOnStatusPhotoAndPost < ActiveRecord::Migration
  def self.up
    change_column_default :statuses, :sent, false
    change_column_default :photos, :sent, false
    change_column_default :posts, :sent, false
  end

  def self.down
    
  end
end
