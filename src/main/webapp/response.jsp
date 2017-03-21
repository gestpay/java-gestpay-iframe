<%@ page import="it.gestpay.wscryptdecrypt.DecryptResponse" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.3.2/css/bulma.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>The BEST ecommerce EVER</title>
</head>
<body>
<section class="hero is-medium is-primary is-bold">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                The BEST ecommerce... EVER!
            </h1>
            <h2 class="subtitle">
                We sell good stuff
            </h2>
        </div>
    </div>
</section>
<section class="section">

    <div class="container">
        <% if ("0".equals(((DecryptResponse) request.getAttribute("decryptResponse")).getErrorCode())) { %>
        <h2 class="title">Your item has been payed!</h2>
        <% } else { %>
        <h2 class="title">There's been an error while processing your request.</h2>
        <% } %>

        <p>Here is a recap of the transaction:</p>
        <p>ErrorCode: <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getErrorCode()%>
        </b></p>
        <p>ErrorDescription: <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getErrorDescription()%>
        </b></p>
        <p>Amount: <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getAmount()%>
        </b></p>
        <p>Authorization Code:
            <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getAuthorizationCode()%>
            </b></p>
        <p>Bank Transaction Id:
            <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getBankTransactionID()%>
            </b></p>
        <p>Currency: <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getCurrency()%>
        </b></p>
        <p>ShopTransactionId: <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getShopTransactionID()%>
        </b></p>
        <p>Transaction Result:
            <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getTransactionResult()%>
            </b></p>
        <p>Transaction Type: <b><%=((DecryptResponse) request.getAttribute("decryptResponse")).getTransactionType()%>
        </b></p>
    </div>

    <a type="button" href="/" class="button is-primary">Back to Home</a>
</section>
</body>
</html>