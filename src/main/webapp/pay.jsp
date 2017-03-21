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

    <div class="columns">
        <div class="column">
            <h1 class="title">Object to buy: <b>
                <%=request.getParameter("item")%>
            </b>.</h1>
            <h2 class="subtitle">Price: <b>
                <%=request.getParameter("amount")%>
                &euro;</b>.</h2>
            <br>
            <p>
        </div>
        <div class="column is-6">

            <h2 class="title">Credit Card Data</h2>

            <form name="CCForm" id="CCForm" onsubmit="return payModule.checkCC();">
                <div class="field">
                    <label class="label" for="CC">Credit Card Number</label>
                    <p class="control">
                        <input class="input" type="text" autocomplete="off" id="CC" placeholder="1234 5678 1234 5678"
                               />
                    </p>
                    <label class="label" for="ExpMM">Expiry Month</label>
                    <p class="control">
                        <input class="input" type="text" id="ExpMM" placeholder="05" />
                    </p>
                    <label class="label" for="ExpYY">Expiry Year</label>
                    <p class="control">
                        <input class="input" type="text" id="ExpYY" placeholder="21" />
                    </p>
                    <label class="label" for="CVV2">CVV2 / 4DBC</label>
                    <p class="control">
                        <input class="input" type="text" id="CVV2" placeholder="123" />
                    </p>
                    <p class="control">
                        <input type="submit" id="submit" disabled="true" class="button is-primary" value="Loading..."/>
                    </p>
                </div>
            </form>
        </div>
    </div>
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
