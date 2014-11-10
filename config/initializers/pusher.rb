require 'pusher'
Pusher.app_id = ENV["PUSHER_APP_ID"]
Pusher.key = ENV["PUSHER_KEY"]
Pusher.secret = ENV["PUSHER_SECRET"]

Pusher.url = "http://1364c2dfbaf130a7b786:84084765d9ef7c28d165@api.pusherapp.com/apps/95937"
Pusher.logger = Rails.logger
