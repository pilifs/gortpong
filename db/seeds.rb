# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#1
Player.create(
  display_name: "Fil",
  slack_handle: "filips",
  wins: 0,
  losses: 0,
  games_played: 0
)
#2
Player.create(
  display_name: "cstaikos",
  slack_handle: "cstaikos",
  wins: 0,
  losses: 0,
  games_played: 0
)
#3
Player.create(
  display_name: "Mike M.",
  slack_handle: "michiru-guru",
  wins: 0,
  losses: 0,
  games_played: 0
)
#4
Player.create(
  display_name: "Mike C.",
  slack_handle: "mchepesiuk",
  wins: 0,
  losses: 0,
  games_played: 0
)
#5
Player.create(
  display_name: "Carlos",
  slack_handle: "lecharles",
  wins: 0,
  losses: 0,
  games_played: 0
)
#6
Player.create(
  display_name: "Sophia",
  slack_handle: "sophiahe",
  wins: 0,
  losses: 0,
  games_played: 0
)
#7
Player.create(
  display_name: "Metturan",
  slack_handle: "meds86",
  wins: 0,
  losses: 0,
  games_played: 0
)
#8
Player.create(
  display_name: "Ilia",
  slack_handle: "ilia",
  wins: 0,
  losses: 0,
  games_played: 0
)
#1
Game.create(
  winner_slack: "filips",
  loser_slack: "ilia",
  winner_score: 21,
  loser_score: 10
)
#6
Game.create(
  winner_slack: "cstaikos",
  loser_slack: "filips",
  winner_score: 21,
  loser_score: 17
)
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
