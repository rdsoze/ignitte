class User < ActiveRecord::Base
  has_many :tweets, :dependent => :destroy
  attr_accessible :id

  def self.populate
    @tweets = Twitter.search('#ignitte', rpp: 20, result_type: 'recent')
    @tweets.each do |tweet|
      user = User.find_or_create_by_id(tweet.attrs['from_user_id']){ |u| 
           u.name = tweet.attrs['from_user']
           u.image_url = tweet.attrs['profile_image_url']
          } 
      user.tweets << Tweet.new(id: tweet.attrs['id'], text: tweet.attrs['text'], tweet_date: tweet.attrs['created_at'])
      user.increment!(:count)
    end
  end

end
