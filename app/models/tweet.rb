class Tweet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :id, :tweet_date, :html


  class << self
  
    def check_for_new
      @tweets = Tweet.get_tweets 10
      @tweets.each do |tweet|
        break unless Tweet.where(id:tweet.attrs['id']).empty?
        user = User.get_user tweet
        Tweet.add_tweet(user,tweet)
      end
    end

    def add_tweet(user, tweet)
      user.tweets << Tweet.new(id: tweet.attrs['id'], html: Twitter::oembed(tweet.attrs['id'], { lang: 'en' })['html'], tweet_date: tweet.attrs['created_at'])
      user.increment!(:count)
      p "**Tweet Added** #{tweet.attrs['text']} by #{user['name']}"
    end
    
    def get_tweets number
      @tweets = Twitter.search('#ignitte', rpp: number, result_type: 'recent')
    end

  end
end
