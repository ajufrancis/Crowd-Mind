require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test "daemon feeds parser" do
    feed = Feed.create(feed_url: "http://feeds.feedburner.com/PaulDixExplainsNothing")
    f = Feedzirra::Feed.fetch_and_parse(feed.feed_url)

    feed.initialize_by_feedzirra(f)
    assert_equal "http://www.pauldix.net/", feed.url
  end
end
