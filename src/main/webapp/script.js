$(document).ready(function() {
    var paymentId = "pay_MAuuhP01lHbu9w";
    var apiKey = "rzp_test_I1Old5tCWsytAn";
    var apiSecret = "lmtNkaOloyu7mLPfckT9lvIk";
  
    var endpoint = "https://api.razorpay.com/v1/payments/" + paymentId;
    var authString = apiKey + ":" + apiSecret;
    var authHeaderValue = "Basic " + btoa(authString);
  
    $.ajax({
      url: endpoint,
      type: "GET",
      headers: {
        "Authorization": authHeaderValue
      },
      success: function(response) {
        var amount = response.amount;
        $("#paymentAmount").text("Payment Amount: " + amount);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.error("Error:", errorThrown);
      }
    });
  });
  