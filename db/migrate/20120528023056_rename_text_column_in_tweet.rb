class RenameTextColumnInTweet < ActiveRecord::Migration
  def change
    rename_column :tweets, :text, :html
  end
end
