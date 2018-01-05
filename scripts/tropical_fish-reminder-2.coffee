# Description
#   Check to feed a tropical-fish and reset a flag
#
# Dependencies:
#   None
#
# Configuration:
#   SLACK_REMIND_ROOM_TF = <slack_room_name>
#   SLACK_REMIND_MSG_TF2 = <slack_remind_message>
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
  # Triger
  new cron '0 0 0 * * *', () ->
  # robot.hear /tf2/i, (robot) ->
    #robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_TF}, 'tf-cron-2'

    # Check to feed
    file = '/tmp/tropical.txt'
    fs   = require 'fs'
    fs.readFile file, 'utf8', (err,text) ->
      # Feed OK
      if err
        fs.writeFile file, ""
      # Feed NG
      else
        # remind = process.env.SLACK_REMIND_MSG_TF2
        # robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_TF}, remind
  , null, true, "Asia/Tokyo"
