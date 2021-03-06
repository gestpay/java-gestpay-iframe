<%@ page import="it.gestpay.wscryptdecrypt.DecryptResponse" %>
<%@ page import="it.gestpay.wscryptdecrypt.EncryptResponse" %>
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
<section class="section container">

    <% if (request.getAttribute("encryptResponse") != null) { %>

    <h2>ERROR in ENCRYPT</h2>
    <h3>Code: <%=((EncryptResponse)request.getAttribute("encryptResponse")).getErrorCode()%></h3>
    <h3>Description: <%=((EncryptResponse)request.getAttribute("encryptResponse")).getErrorDescription()%></h3>

    <% } else if (request.getAttribute("decryptResponse") != null) { %>

    <h2>ERROR in DECRYPT</h2>
    <h3>Code: <%=((DecryptResponse)request.getAttribute("decryptResponse")).getErrorCode()%></h3>
    <h3>Description: <%=((DecryptResponse)request.getAttribute("decryptResponse")).getErrorDescription()%></h3>

    <% } else { %>

    <h2>ERROR</h2>
    <h3>There is a generic problem with your request.</h3>

    <% } %>

</section>
</body>
</html>
