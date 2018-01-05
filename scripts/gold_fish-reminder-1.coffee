# Description
#   Check to feed a gold-fish and remind to Slack
#
# Dependencies:
#   None
#
# Configuration:
#   SLACK_REMIND_ROOM_GF = <slack_room_name>
#   SLACK_REMIND_MSG_GF  = <slack_remind_message>
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
  # Trigger
  new cron '0 0 18 * * *', () ->
  # robot.hear /gf1/i, (robot) ->
    # robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_GF}, 'gf-cron-1'

    # Check to feed
    file = '/tmp/gold.txt'
    fs   = require 'fs'
    fs.readFile file, 'utf8', (err, text) ->
      # Feed OK
      if err
        # robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_GF}, 'gf-feed-ok'
        return
      # Feed NG
      else
        remind = process.env.SLACK_REMIND_MSG_GF
        robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_GF}, remind
  , null, true, "Asia/Tokyo"
