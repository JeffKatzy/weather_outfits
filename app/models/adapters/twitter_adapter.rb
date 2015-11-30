# remove file
# module Adapters
#   class TwitterAdapter

#     require 'tweetstream'

#     TweetStream.configure do |config|
#       config.consumer_key       = ENV['TWITTER_KEY']
#       config.consumer_secret    = ENV['TWITTER_SECRET']
#       config.oauth_token        = ENV['OAUTH_TOKEN']
#       config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
#       config.auth_method        = :oauth
#     end

#     def connection
#       @connection = Adapters::TwitterConnection.new
#     end

#   end
# end