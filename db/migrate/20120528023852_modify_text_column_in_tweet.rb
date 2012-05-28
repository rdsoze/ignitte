class ModifyTextColumnInTweet < ActiveRecord::Migration
  def up
    change_column :tweets, :html, :text
  end

  def down
  end
end
