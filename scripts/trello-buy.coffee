# Description
#   Check a checklist in Trello Card and remind to Slack
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_TRELLO_KEY     = <trello_api_key>
#   HUBOT_TRELLO_TOKEN   = <trello_api_token>
#   HUBOT_TRELLO_CARD_CL = <trello_card_id>
#   SLACK_REMIND_ROOM_CL = <slack_room_name>
#   SLACK_REMIND_MSG_CL  = <slack_remind_message>
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
  # robot.hear /buy/i, (robot) ->

    # Get checklist info
    key   = process.env.HUBOT_TRELLO_KEY
    token = process.env.HUBOT_TRELLO_TOKEN
    url   = "/1/checklists/"+process.env.HUBOT_TRELLO_CARD_CL
    trello = new Trello key, token
    trello.get url, {fields: "name"}, (err, data) ->
      if err
        robot.send "Trello error"
        return

      # Reimind
      remind = process.env.SLACK_REMIND_MSG_CL
      for obj in data.checkItems
        if "#{obj['state']}" == "incomplete"
          remind += "\n- #{obj['name']}"
      robot.send {room: "#"+process.env.SLACK_REMIND_ROOM_CL}, remind
      # console.log remind

  , null, true, "Asia/Tokyo"
