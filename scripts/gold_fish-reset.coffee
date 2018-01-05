# Description
#   Hearing about feed a gold-fish and delete flag
#
# Dependencies:
#   None
#
# Configuration:
#   SLACK_HEARING_MSG_GF = <slack_hearing_message>
#
# Commands:
#   None
#
# Notes:
#   None
#
# Author:
#   maijou2501 <maijou2501@gmail.com>

module.exports = (robot) ->
  triger = process.env.SLACK_HEARING_MSG_GF
  robot.hear new RegExp(triger, 'i'), (res) ->
    file = '/tmp/gold.txt'
    fs   = require('fs')
    fs.unlink file
