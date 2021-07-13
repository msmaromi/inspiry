require 'httparty'
require 'json'
require 'date'

IMAGE_QUOTES = [
  "https://i.pinimg.com/originals/c4/48/d3/c448d3ea718f8cd768514791c42358e8.jpg",
  "https://i.pinimg.com/originals/7a/1e/d6/7a1ed6797aad86bff151b6114ccff48c.jpg",
  "https://lh3.googleusercontent.com/proxy/sLcKFeUGRVJOE-wyewtJKSZYXGUqXoYIGmUXZwVb2NfB1MaS1vxJ0ERP_4o8maFdLZl264amkGm47tUcL6jKQbEpBez-z0Meg3uJERXZnScT4zNuWPmILOj-PJnPXUs5iH0yGQA_jxIAetJPCSJjiJ9XTLg94Np03OcT5yPAkA",
  "https://lh3.googleusercontent.com/proxy/7UOzOq-_7IrQZkx-9oEJZqrRJt27huCIL0JJHGaUFSQfdz1rT-h8wYwKs5YWREAx0Ju8MCuIplMFHfYsXcmTKgOGap7qGQVFmzlNZFTJEFvbqtsaf-rMw6vKrPfdiTt5JIF-lX2MiJBCNX3LJ9AAMZBQiKDsefFSYTx6-VQNuQ",
  "https://qph.fs.quoracdn.net/main-qimg-c3251b081ab538dd663226ce440a4f9f",
  "https://thebrightquotes.com/wp-content/uploads/2020/11/Islamic-Inspirational-Quotes-on-Allah-43-1024x1024.jpg",
  "https://cdn3.vectorstock.com/i/1000x1000/65/57/muslim-quote-and-saying-for-better-life-best-for-vector-23266557.jpg",
  "https://cdn.hipwallpaper.com/i/11/85/9Tg7um.jpg",
  "https://i.pinimg.com/originals/92/5c/eb/925ceb1fdbed7efb5e9b5feccbcff6ff.png",
  "https://i.pinimg.com/originals/48/3f/26/483f263dd2fd0c884e62850ad2a2875d.jpg",
  "https://i.pinimg.com/originals/ec/92/f6/ec92f65b12c619c158fb78003dff7dd2.jpg",
  "https://i.pinimg.com/originals/ca/ce/db/cacedb9610c18860e5cc5fa5acc765ea.png",
  "https://i.pinimg.com/originals/81/3a/10/813a103e44045344e813a42f04977e27.jpg",
  "https://i.pinimg.com/736x/cd/bb/89/cdbb89e4bb04ce25a714916228186ced.jpg",
  "https://i.pinimg.com/originals/de/df/44/dedf441dca98f12045be9c9d94ec8609.jpg",
  "https://i.pinimg.com/originals/b0/cd/58/b0cd5811d17f4b8117b727f4bb869cfb.jpg",
  "https://i.pinimg.com/736x/9c/f4/8e/9cf48ec42594230a5440bcdcee94b812.jpg"
]
TEXT = "Ngaji yuk squad <!channel>\nhttps://meet.google.com/qgk-phfc-owm"
CHANNEL_ID = "C017K819DJ8" # open slack via web to find the channel id
SLACK_API_POST_MESSAGE = "https://slack.com/api/chat.postMessage"


def get_quote
  image_quote = IMAGE_QUOTES.sample
  attachments = [{ :title => "Invitation", :image_url => image_quote }]
  post_message(attachments)
end

def post_message attachments
  puts "Transferring the vibe through Slack!"
  HTTParty.post(
    SLACK_API_POST_MESSAGE,
    :query => {:channel => CHANNEL_ID, :text => TEXT, :attachments => attachments.to_json, :pretty => 1},
    :headers => {'Authorization' => "Bearer #{ENV["SLACK_API_TOKEN"]}"}
  )
  puts "Posted a message. Hope they'd like it."
end

unless ['Saturday', 'Sunday'].include? Date.today.strftime('%A')
  puts "Off to Work.."
  get_quote
  puts "All done for the day."
end
