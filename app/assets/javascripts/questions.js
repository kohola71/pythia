
$(document).ready(function() {
 // 'hey ' + e.target.dataset["question"] + ' ho'
   $("#send-friends").click(function(e) {
    FB.ui({method: 'apprequests',
      title: "Check out Pythia",
      message: "I have a dilemma. Help me make up my mind!",
      data: '{"question_id": ' + e.target.dataset["question"] + '}'
    }, function(response) {
      console.log(response);
    });
    return false;
  });
  
  // FB.getLoginStatus(function(response) {
  //     if (response.status === 'connected') {
  //       gFBID = response.authResponse.userID;
  //       if (!processIncomingRequest()) {
  //         alert("Welcome to Pythia!");
  //       }
  //     }
  // });

  var AddField = function(event) {
      event.preventDefault();
    var LastField = $(".answer_field:last");
    
    var ReplaceFunction = function(i, val) {
      return val.replace(/[0-9]/, function(m) { return (+m + 1).toString() });
    }

    var NewField = LastField.clone();

    NewField.find("textarea").attr("name", ReplaceFunction);

    NewField.find("textarea").attr("id", ReplaceFunction);

    NewField.find("label").attr("for", ReplaceFunction);


    NewField.insertAfter(LastField);

  }
 
 $("<button> Add Answer </button>").appendTo(".answer_container").click(AddField); 
});





//there needs to be a data parameter - uniquify. So that I don't pass question/39. rails generate migration add_identifier_to_question. 