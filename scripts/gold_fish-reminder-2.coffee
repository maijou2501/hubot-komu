# Description
#   Check to feed a gold-fish and reset a flag
#
# Dependencies:
#   None
#
# Configuration:
#   SLACK_REMIND_ROOM_GF = <slack_room_name>
#   SLACK_REMIND_MSG_GF2 = <slack_remind_message>
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
  new cron '0 0 0 * * *', () ->
  # robot.hear /gf2/i, (robot) ->
    #robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_GF}, 'gf-cron-2'

    # Check to feed
    file = '/tmp/gold.txt'
    fs   = require 'fs'
    fs.readFile file, 'utf8', (err,text) ->
      # Feed OK
      if err
        fs.writeFile file, ""
      # Feed NG
      else
        # remind = process.env.SLACK_REMIND_MSG_GF2
        # robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_GF}, remind
  , null, true, "Asia/Tokyo"
