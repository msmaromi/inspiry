require 'httparty'
require 'json'
require 'date'

def get_quote
  author = "Quran Reminder"
  quote = ENV["QUOTES"].sample
  post_message(author, quote)
end

def post_message author, quote
  puts "Transferring the vibe through Slack!"
  img = ENV["IMAGE_URL"] || "https://libcom.org/files/images/library/fist.jpg"
  HTTParty.post SLACK_WEBHOOK, body: {"text" => quote, "username" => author, "icon_url" => img}.to_json, headers: {'content-type' => 'application/json'}
  puts "Posted a message. Hope they'd like it."
end

unless ['Saturday', 'Sunday'].include? Date.today.strftime('%A')
  SLACK_WEBHOOK = ENV["SLACK_WEBHOOK"]

  puts "Off to Work.."
  get_quote
  puts "All done for the day."
end
