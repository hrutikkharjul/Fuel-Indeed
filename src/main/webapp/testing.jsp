<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection, java.net.URL" %>

<%
  // Define the API URL
  String apiUrl = "https://api.razorpay.com/v1/payments/pay_MAuuhP01lHbu9w";
  
  String response1 = null;

  try {
    // Create a URL object from the API URL
    URL url = new URL(apiUrl);

    // Open a connection to the URL
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();

    // Set the request method
    connection.setRequestMethod("GET");

    // Read the response from the API
    BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    StringBuilder responseBuilder = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
      responseBuilder.append(line);
    }
    reader.close();

    // Store the API response
    response1 = responseBuilder.toString();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>

<!DOCTYPE html>
<html>
<head>
    <title>API Response</title>
</head>
<body>
    <h1>API Response:</h1>
    <pre><%= response1 %></pre>
</body>
</html>
