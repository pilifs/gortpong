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
  slack_handle: "filips"
)
#2
Player.create(
  display_name: "cstaikos",
  slack_handle: "cstaikos"
)
#3
Player.create(
  display_name: "Mike M.",
  slack_handle: "michiru-guru"
)
#4
Player.create(
  display_name: "Mike C.",
  slack_handle: "mchepesiuk"
)
#5
Player.create(
  display_name: "Carlos",
  slack_handle: "lecharles"
)
#6
Player.create(
  display_name: "Sophia",
  slack_handle: "sophiahe"
)
#7
Player.create(
  display_name: "Metturan",
  slack_handle: "meds86"
)
#8
Player.create(
  display_name: "Ilia",
  slack_handle: "ilia"
)
#1
Game.create(
  winner_id: 1,
  loser_id: 3,
  winner_score: 21,
  loser_score: 10
)
#6
Game.create(
  winner_id: 2,
  loser_id: 1,
  winner_score: 21,
  loser_score: 17
)
#10
Game.create(
  winner_id: 3,
  loser_id: 4,
  winner_score: 21,
  loser_score: 11
)
#18
Game.create(
  winner_id: 1,
  loser_id: 5,
  winner_score: 21,
  loser_score: 17
)
