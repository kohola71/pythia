$(document).ready(function() {
  $("#send-friends").click(function(e) {
    var data = {
      questionId: e.target.dataset["question"]
    };
    FB.ui({method: 'apprequests',
      title: "Check out Pythia",
      message: "Check out <a href= 'http://pythiaapp.herokuapp.com/'>question</a>",
      data: data
    }, function(response) {
       console.log(response);
    });
    return false;
  });
});

FB.getLoginStatus(function(response) {
    if (response.status === 'connected') {
      gFBID = response.authResponse.userID;
      if (!processIncomingRequest()) {
      	alert("Welcome to Pythia!");
      }
    }
});



//there needs to be a data parameter - uniquify. So that I don't pass question/39. rails generate migration add_identifier_to_question. 