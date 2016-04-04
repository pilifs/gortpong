var Scoreboard = React.createClass({
  loadGameFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: {score: this.props.player_1_score}};
  },
  componentDidMount: function() {
    this.loadGameFromServer();
    setInterval(this.loadGameFromServer, this.props.pollInterval);
  },
  shouldComponentUpdate: function(nextProps, nextState) {
    return nextState.data.player_1_score !== this.state.data.player_1_score;
  },
  // componentWillReceiveProps: function(nextProps, nextState) {
  //   // if(nextState.data.score > this.state.data.score) {
  //   //   this.setState({increase: true});
  //   // } else if(nextState.data.score < this.state.data.score) {
  //   //   this.setState({increase: false});
  //   // }
  // },
  componentWillUpdate: function() {
    React.findDOMNode(this).classList.add("update-score");
  },
  componentDidUpdate: function() {
    var scoreAnimation = React.findDOMNode(this);
    setTimeout(function(){
       scoreAnimation.classList.remove("update-score");
    }, 3000);
  },
  render: function() {
    return (
      <div className="scoreboardRoot">
        <span>
          {this.state.data.player_1_score}
        </span>
      </div>
    );
  }
});
