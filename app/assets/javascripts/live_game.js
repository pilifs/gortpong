$(document).on('ready page:load', function() {
  $(document).on('click', '#submit-live-game-button', function(e) {
    var liveGameInfo = new Object();
    liveGameInfo.playerOneSlack = $('#player-one-slack').html();
    liveGameInfo.playerTwoSlack = $('#player-two-slack').html();
    liveGameInfo.playerOneScore = $('#player-one-score').html();
    liveGameInfo.playerTwoScore = $('#player-two-score').html();

    console.log(liveGameInfo)
  })
})
