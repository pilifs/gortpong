json.player_1 do
  json.player @table.player_one_slack
  json.score @table.player_one_score
end
json.player_2 do
  json.player @table.player_two_slack
  json.score @table.player_two_score
end
json.queue @table.player_queue.player_id
