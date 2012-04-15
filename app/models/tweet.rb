class Tweet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :id, :text, :tweet_date

  def self.check_for_new
    @tweets = Twitter.search('#ignitte', rpp: 10, result_type: 'recent')
    @tweets.each do |tweet|
      break unless Tweet.where(id:tweet.attrs['id']).empty?
      user = User.find_or_create_by_id(tweet.attrs['from_user_id']){ |u| 
           u.name = tweet.attrs['from_user']
           u.image_url = tweet.attrs['profile_image_url']
          } 
      user.tweets << Tweet.new(id: tweet.attrs['id'], text: tweet.attrs['text'], tweet_date: tweet.attrs['created_at'])
      user.increment!(:count)
    end
  end
end
