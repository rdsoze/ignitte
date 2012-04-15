class AddTweetDateColumnToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_date, :datetime
  end
end
