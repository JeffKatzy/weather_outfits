# why are there two files called twitter_connection?
module Adapters
  class TwitterConnection

    attr_reader :client

    def initialize(user)
      @user = user
      @client = create_client
    end

    def create_client
      keys = YAML.load_file('config/application.yml')
      Twitter::REST::Client.new do |config|
        config.consumer_key = keys['CONSUMER_KEY']
        config.consumer_secret = keys['CONSUMER_SECRET']
        config.access_token = keys['ACCESS_TOKEN']
        config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
      end
    end

    def query(search = {})
      results = connection.get("https://api.twitter.com/1.1/search/tweets.json?q=%23ootd&src=typd", {search: search})
      search_results = RecursiveOpenStruct.new(results, :recurse_over_arrays => true)
    end

  end
end