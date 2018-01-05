# Description
#   Check Cards in Trello list and remind to Slack
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_TRELLO_KEY     = <trello_api_key>
#   HUBOT_TRELLO_TOKEN   = <trello_api_token>
#   HUBOT_TRELLO_LIST_CC = <trello_list_id>
#   SLACK_REMIND_ROOM_CC = <slack_room_name>
#   SLACK_REMIND_MSG_CC  = <slack_remind_message>
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
Trello = require 'node-trello'

module.exports = (robot) ->
  # Trigger
  new cron '0 0 17 * * *', () ->
  # robot.hear /todo/i, (robot) ->

    # Get List info
    key   = process.env.HUBOT_TRELLO_KEY
    token = process.env.HUBOT_TRELLO_TOKEN
    url   = "/1/lists/"+process.env.HUBOT_TRELLO_LIST_CC+"/cards"
    trello = new Trello key, token
    trello.get url, {fields:"name,badges,shortUrl"}, (err, data) ->
      if err
        robot.send "Trello error"
        return

      # Remind
      remind = process.env.SLACK_REMIND_MSG_CC
      for obj in data
        if "#{obj['badges'].checkItemsChecked}" == "0"
          remind += "\n- #{obj['name']} (#{obj['shortUrl']})"
      robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_CC}, remind
      # console.log data

  , null, true, "Asia/Tokyo"
