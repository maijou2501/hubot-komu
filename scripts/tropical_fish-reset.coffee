# Description
#   Hearing about feed a tropical-fish and delete flag
#
# Dependencies:
#   None
#
# Configuration:
#   SLACK_HEARING_MSG_TF = <slack_hearing_message>
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
  triger = process.env.SLACK_HEARING_MSG_TF
  robot.hear new RegExp(triger, 'i'), (res) ->
    file = '/tmp/tropical.txt'
    fs = require('fs')
    fs.unlink file
