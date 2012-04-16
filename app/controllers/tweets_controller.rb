class TweetsController < ApplicationController
  def index
    @users = User.order('count desc').limit(10)
    @tweets = Tweet.order('id desc').limit(10)
  end

end
