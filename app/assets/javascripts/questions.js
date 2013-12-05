$(document).ready(function() {
  $("#send-friends").click(function() {
    FB.ui({method: 'apprequests',
      title: "Help me decide!",
      message: "Please help me decide what to do"
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