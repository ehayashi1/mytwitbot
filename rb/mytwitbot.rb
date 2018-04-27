require 'twitter'
require './config'

ENV['TZ'] = 'JST-9'
username = "USERNAME"

@streamingClient.user do |tweet|
    if tweet.class == Twitter::Tweet && tweet.text.include?("@#{username}") && !tweet.in_reply_to_status_id
        puts "Found tweet: #{tweet}"
        if tweet.text.include?("����")
            now = Time.now
            @restClient.update("@#{tweet.user.screen_name} ����#{now.hour}��#{now.min}��#{now.sec}�b�ł��B", in_reply_to_status_id: tweet.id)
        end
        if tweet.text.include?("����")
            today = Time.now
            @restClient.update("@#{tweet.user.screen_name} ������#{today.year}�N#{today.month}��#{today.day}���ł��B", in_reply_to_status_id: tweet.id)
        end
        if tweet.text.include?("����")
            tomorrow = Time.now + (60*60*24)
            @restClient.update("@#{tweet.user.screen_name} ������#{tomorrow.year}�N#{tomorrow.month}��#{tomorrow.day}���ł��B", in_reply_to_status_id: tweet.id)
        end
    end
end