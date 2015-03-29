$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  $("#survey_create_form").submit(function(e){
    e.preventDefault();
    var form = $(this);
    console.log(this);
    $.ajax({
      "url": "/surveys",
      "method": "post",
      "data": form.serialize(),
      'success': function(response){
        console.log(response);
        $("#survey_create_form").css({display: "none"});
        $("body").append(response.question_form)
        $("#heading").text(response.title)
        surveyId = response.survey_id
      },
      'complete': function(response){
        console.log(response)
        // $("body").append(response)
      },

    });
  });

  $("#question_create_form").submit(function(e){
    e.preventDefault();
    var form = $(this);
    console.log(this);
    $.ajax({
      "url": "/surveys/" + surveyId + "/questions",
      "method": "post",
      "data": form.serialize(),
      'success': function(response){
        console.log(response);

      }

    });
  });


});
