# Description
#   Check to feed a tropical-fish and remind to Slack
#
# Dependencies:
#   None
#
# Configuration:
#   SLACK_REMIND_ROOM_TF = <slack_room_name>
#   SLACK_REMIND_MSG_TF  = <slack_remind_message>
#
# Commands:
#   None
#
# Notes:
#   None
#
# Author:
#   maijou2501 <maijou2501@gmail.com>

cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 0 22 * * *', () ->
  # robot.hear /tf1/i, (robot) ->
    # robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_TF}, 'tf-cron-1'

    # Check to feed
    file = '/tmp/tropical.txt'
    fs   = require 'fs'
    fs.readFile file, 'utf8', (err, text) ->
      # Feed ON
      if err
        #robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_TF}, 'gf-feed-ok'
        return
      # Feed NG
      else
        remind = process.env.SLACK_REMIND_MSG_TF
        robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_TF}, remind
  , null, true, "Asia/Tokyo"
