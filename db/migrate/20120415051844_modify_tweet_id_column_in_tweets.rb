class ModifyTweetIdColumnInTweets < ActiveRecord::Migration
  def up
    change_column :tweets, :id, :bigint
  end

  def down
    change_column :tweets, :id, :integer
  end
end
