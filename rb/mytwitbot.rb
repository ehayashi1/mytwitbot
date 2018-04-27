require 'twitter'
require './config'

ENV['TZ'] = 'JST-9'
username = "USERNAME"

@streamingClient.user do |tweet|
    if tweet.class == Twitter::Tweet && tweet.text.include?("@#{username}") && !tweet.in_reply_to_status_id
        puts "Found tweet: #{tweet}"
        if tweet.text.include?("何時")
            now = Time.now
            @restClient.update("@#{tweet.user.screen_name} 今は#{now.hour}時#{now.min}分#{now.sec}秒です。", in_reply_to_status_id: tweet.id)
        end
        if tweet.text.include?("今日")
            today = Time.now
            @restClient.update("@#{tweet.user.screen_name} 今日は#{today.year}年#{today.month}月#{today.day}日です。", in_reply_to_status_id: tweet.id)
        end
        if tweet.text.include?("明日")
            tomorrow = Time.now + (60*60*24)
            @restClient.update("@#{tweet.user.screen_name} 明日は#{tomorrow.year}年#{tomorrow.month}月#{tomorrow.day}日です。", in_reply_to_status_id: tweet.id)
        end
    end
end