class User < ActiveRecord::Base
  has_many :tweets, :dependent => :destroy
  attr_accessible :id

  class << self

    def populate
      @tweets = Tweet.get_tweets 50
      @tweets.each do |tweet|
        user = User.get_user tweet 
        Tweet.add_tweet(user,tweet)
      end
    end

    def get_user tweet
      user = User.find_or_create_by_id(tweet.attrs['from_user_id']){ |u| 
             u.name = tweet.attrs['from_user']
             u.image_url = tweet.attrs['profile_image_url']
            } 
    end

  end
end
