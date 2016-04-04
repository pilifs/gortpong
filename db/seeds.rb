# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# NOTE: This is insecure and it doesn't matter (submit key is not intended to be a real password for anything or hard to find out)
User.create(
  {
    :name => 'submitter',
    :password => 'gortpong2016'
  }
)


# Can't get this next line working. Auto updating download link for the spreadsheet.
# auto_updating_player_csv = 'https://docs.google.com/spreadsheets/d/1okeCXA80gz2U7p-jUhDEoj0hNYD2LaNvFukqKXnhi1o/pub?gid=0&single=true&output=csv'
# Further reading: http://rambleon.org/2012/08/28/importing-a-google-spreadsheet-into-a-rails-application/
# There is also a headers => true property that you can pass into foreach to allow you to label the columns. Not 100% how it works
CSV.foreach('lib/assets/google-docs-players.csv') do |row|
  Player.create({
        :slack_handle => row[0],
        :display_name => row[1],
      })
end

# Auto updating games csv:
# https://docs.google.com/spreadsheets/d/1okeCXA80gz2U7p-jUhDEoj0hNYD2LaNvFukqKXnhi1o/pub?gid=178204794&single=true&output=csv
CSV.foreach('lib/assets/google-docs-games.csv') do |row|
  Game.create({
        :winner_slack => row[0],
        :winner_score => row[1],
        :loser_slack => row[2],
        :loser_score => row[3],
      })
end

LiveGame.create(
  table_name: "Bitmaker Labs"
)

LiveGame.create(
  table_name: "Mel Lastman Square"
)

LiveGame.all.each do |game|
  queue = PlayerQueue.create(live_game_id: game.id)
end

#1
# Player.create(
#   display_name: "Fil",
#   slack_handle: "filips",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #2
# Player.create(
#   display_name: "cstaikos",
#   slack_handle: "cstaikos",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #3
# Player.create(
#   display_name: "Mike M.",
#   slack_handle: "michiru-guru",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #4
# Player.create(
#   display_name: "Mike C.",
#   slack_handle: "mchepesiuk",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #5
# Player.create(
#   display_name: "Carlos",
#   slack_handle: "lecharles",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #6
# Player.create(
#   display_name: "Sophia",
#   slack_handle: "sophiahe",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #7
# Player.create(
#   display_name: "Metturan",
#   slack_handle: "meds86",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #8
# Player.create(
#   display_name: "Ilia",
#   slack_handle: "ilia",
#   wins: 0,
#   losses: 0,
#   games_played: 0
# )
# #1
# Game.create(
#   winner_slack: "filips",
#   loser_slack: "ilia",
#   winner_score: 21,
#   loser_score: 10
# )
# #6
# Game.create(
#   winner_slack: "cstaikos",
#   loser_slack: "filips",
#   winner_score: 21,
#   loser_score: 17
# )
# #10
# Game.create(
#   winner_id: 3,
#   loser_id: 4,
#   winner_score: 21,
#   loser_score: 11
# )
# #18
# Game.create(
#   winner_id: 1,
#   loser_id: 5,
#   winner_score: 21,
#   loser_score: 17
# )
