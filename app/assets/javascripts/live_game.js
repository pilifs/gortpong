$(document).on('ready page:load', function() {
  var liveGameInfo = {
    "$('#player-one-slack').html()" : $('#player-one-score').html(),
    "$('#player-two-slack').html()" : $('#player-two-score').html()
  }
  $(document).on('click', '#submit-live-game-button', function(e) {
    e.preventDefault();

    // $.ajax({
    //   type: 'post',
    //   action: '/games',
    //   data:
    // })
  })
})
