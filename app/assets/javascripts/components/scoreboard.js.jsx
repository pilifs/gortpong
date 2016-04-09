var Scoreboard = React.createClass({
  loadGameFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        var dat = this;
        _.forEach(["player_1", "player_2"], function(key) {
          // Check to see if score has changed before updating, if not return
          if (data[key] == dat.state.data[key]) return;
          console.log(data[key], dat.state.data[key])
          var update = {};
          key += "_isNew";
          update[key] = true;
          dat.setState(update);
          var timeout = setTimeout(function() {
            update[key] = false;
            dat.setState(update);
          }, 3000);
        });
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: {}, player_1_score_isNew: false, player_2_score_isNew: false};
  },
  componentWillMount: function() {
    this.loadGameFromServer();
  },
  componentDidMount: function() {
    setInterval(this.loadGameFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div id="scoreboardRoot">
        <PlayerOneScore score={this.state.data.player_1_score} isNew={this.state.player_1_score_isNew} />
        <PlayerTwoScore score={this.state.data.player_2_score} isNew={this.state.player_2_score_isNew} />

      </div>
    );
  }
});

var PlayerOneScore = React.createClass({
  render: function() {
    var cls = this.props.isNew ? "player-one-score update-score" : "player-one-score"
    return (
        <div className={cls}>
            {this.props.score}
        </div>
    );
  }
});

var PlayerTwoScore = React.createClass({
  render: function() {
    return (
        <div className="player-two-score">
            {this.props.score}
        </div>
    );
  }
});
