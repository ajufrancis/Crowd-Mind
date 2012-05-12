#!/usr/bin/env ruby



require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "config", "environment"))

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  Rails.logger.auto_flushing = true
  Rails.logger.info "This daemon is still running at #{Time.now}.\n"

  @feeds ||= []

  # Gets the list of feeds urls
  Feed.all.find_each do |f|
    i = @feeds.index { |x| x.feed_url==f.feed_url }

    if i
      updated_feed = Feedzirra::Feed.update(@feeds[i])
      f.update_by_feedzirra(updated_feed)
    else
      @feeds << Feedzirra::Feed.fetch_and_parse(f.feed_url)
      f.initialize_by_feedzirra(@feeds.last)
    end
  end

  sleep 10
end
