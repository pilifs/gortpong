json.live_game do
  json.player_one_score @live_game.player_one_score
  json.player_one_slack @live_game.player_one_slack
  json.player_two_score @live_game.player_two_score
  json.player_two_slack @live_game.player_two_slack
end
