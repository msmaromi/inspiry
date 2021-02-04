require 'httparty'
require 'json'
require 'date'

QUOTES = [
  "\"The more you read the Quran, the more you fall in love with The Author\"\n\nNgaji yuk squad @channel\nhttps://meet.google.com/ucx-orqs-nsh",
  "\"Don't never ever be in your mind that you are the one who achieve something. Indeed Alloh make it easy for you.\"\n\nNgaji yuk squad @channel\nhttps://meet.google.com/ucx-orqs-nsh",
  "\"The Quran is a friend, which will never let you down in this world and hereafter\"\n\nNgaji yuk squad @channel\nhttps://meet.google.com/ucx-orqs-nsh",
  "\"Don't leave me, don't stay away from me, keep me inside your heart, read me, understand me and obey me, *because tomorrow in the grave you will need me*\"\n\nNgaji yuk squad @channel\nhttps://meet.google.com/ucx-orqs-nsh"
]
SLACK_API_POST_MESSAGE = "https://slack.com/api/chat.postMessage"


def get_quote
  quote = QUOTES.sample
  post_message(quote)
end

def post_message quote  
  puts "Transferring the vibe through Slack!"
  puts quote  
  HTTParty.post(
    SLACK_API_POST_MESSAGE, 
    :query => {:channel => "C01LV3RQR2R", :text => quote, :pretty => 1},
    :headers => {'Authorization' => "Bearer #{ENV["SLACK_API_TOKEN"]}"}
  )
  puts "Posted a message. Hope they'd like it."
end

unless ['Saturday', 'Sunday'].include? Date.today.strftime('%A')
  puts "Off to Work.."
  get_quote
  puts "All done for the day."
end
