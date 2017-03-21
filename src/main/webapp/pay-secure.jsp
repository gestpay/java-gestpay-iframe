<%@ page import="com.myshop.constants.Constants" %>
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

<section class="hero is-warning is-hidden" id="errorSection">
    <div class="hero-body">
        <div class="container">
            <h1 class="title" id="ErrorCode">
            </h1>
            <h2 class="subtitle" id="ErrorDescription">
            </h2>
        </div>
    </div>
</section>

<section class="section container">

    <h1 class="title">Payment in process...</h1>
    <h2 class="subTitle">Don't close this page until the payment has finished</h2>

</section>
<script type="text/javascript">

    var configuration = {
        shopLogin: '<%=Constants.SHOP_LOGIN%>',
        encryptedString: <% if (request.getAttribute("encryptResponse") != null) { %>
            '<%=((EncryptResponse)request.getAttribute("encryptResponse")).getCryptDecryptString()%>',
        <% } else { %>
            '${cookie.encryptedString.value}',
        <% } if (request.getParameter("PaRes") != null ) { %>
        PaRes: '<%= request.getParameter("PaRes") %>'
        <% } %>
    }
</script>
<script src="https://testecomm.sella.it/pagam/JavaScript/js_GestPay.js" type="text/javascript"></script>
<script src="js/util.js" type="text/javascript"></script>
<script src="js/app.js" type="text/javascript"></script>
</body>
</html>
