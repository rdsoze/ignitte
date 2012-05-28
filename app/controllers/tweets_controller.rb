class TweetsController < ApplicationController
  def index
    @users = User.order('count desc').limit(10)
    @tweets = Tweet.order('id desc').limit(10)
    #@embed = Twitter::oembed(206708958612832257)
  end

end
