require 'twitter'

config = {
    consumer_key: "wUVKXrHLOk6cPNpmSyCp6qDyP",
    consumer_secret: "SMYDt5QtbhXzwkIhuXQhXc13tTrJps2kAmMN7RIHLyNJ1xU0yP",
    access_token: "989727026184536064-TC1RgXwhPCHHDZiTuYEJ9M84eawNlGI",
    access_token_secret: "z5nsk6a69QvcQkiL53WhR19kBq4nR5FpE26NVKYALyiYK",
}

@restClient = Twitter::REST::Client.new(config)
@streamingClient = Twitter::Streaming::Client.new(config)