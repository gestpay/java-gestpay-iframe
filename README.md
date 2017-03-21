Java-gestpay-iframe
===================

With this example you can see how to integrate Gestpay iFrame solution in your webapplication.

The target language for this example is Java. More examples [here](http://docs.gestpay.it/exa/gestpay-examples.html).

## What is Gestpay iFrame solution

If you want to customize the payment page of your shop, you can do this by using the iFrame solution. This way you can
design the best page ever.

More informations about iFrame can be found here:
[super quick start guide](http://docs.gestpay.it/gs/super-quick-start-guide.html)
and here: [Creating your custom payment page](http://docs.gestpay.it/pay/creating-your-custom-payment-page.html).

## How to start this project

Prerequisites:

- Java 7+
- Apache Tomcat
- Maven

Download this project, then launch `mvn clean install`.

Once compiled, move the .war file inside tocmat `webapp/` dir.

## What's in this project

This project is a simple ecommerce store with three items ready do be sold.

Let's examine classes and files.

| Path | Description |
| ---- | ----------- |
| `src/main/java/com.myshop.constants.Constants` | All the constants used in this project |
| `src/main/java/com.myshop.servlets.EncryptServlet` | This serlvet is registred with path `/pay`. When called, it will start an `Encrypt` request to Gestpay. Then it will redirect to page `pay.jsp` |
| `src/main/java/com.myshop.servlets.DecryptServlet` | This servlet is registered with path `/response`. It will decrypt the encrypted string received from Gestpay, after the payment has succeded. Then it will redirect to page `response.jsp`. |
| `src/main/java/it.gestpay.wscryptdecrypt.*` | contains classes needed to crypt and decrypt the request to/from Gestpay.
| `src/main/webapp/index.jsp` | This is the home page of the shop. |
| `src/main/webapp/pay.jsp` | After selecting an item to buy, the user is redirected here where he can insert his credit card data. |
| `src/main/webapp/pay-secure.jsp` | A waiting page used when 3D-secure is triggered |
| `src/main/webapp/error.jsp` | If anything goes wrong, you should be redirected here. |
| `src/main/webapp/response.jsp` | If the payment goes well, the user is redirected here, where some fields of the transactions are shown. |
| `src/main/webapp/WEB-INF/web.xml` | this file contains the servlet routes. There are two routes configured: `/pay` and `/response`.
| `src/main/webapp/js/util.js` | Some javascript general purpose functions are grouped in this file |
| `src/main/webapp/js/app.js` | **This file contains all Gestpay iframe logic**. This is the iframe starting point. |
| `pom.xml` | the maven pom file. |


## User flow

### Non 3D-Secure cards

1. user connects to `index.jsp` and selects a product to pay
2. user is redirected to `/pay`, `EncryptServlet` will create an encryptString, then the user will see `pay.jsp`
3. On `pay.jsp` the user will insert his credit card data and clicks "pay"
4. Javascript `app.js` code will execute, and if everything goes OK the user is redirected to `/response` with a new
`encryptedString`
5. In `/response`, the `DecryptServlet` will decrypt the `encryptedString` and will show the content in `response.jsp`.

### 3D-Secure cards

1. user connects to `index.jsp` and selects a product to pay
2. user is redirected to `/pay`, `EncryptServlet` will create an encryptString, then the user will see `pay.jsp`
3. On `pay.jsp` the user will insert his credit card data and clicks *pay*
4. Javascript `app.js` code will execute, but  `paymentCompletedCallback` will get the `ErrorCode 8006`. 3D Secure is
triggered.
5. The user is redirected to a Gestpay page, where he can perform a fake authentication.
6. Gestpay will then redirect the user to the page `pay-secure.jsp`, that will continue the payment process. If
everything goes OK, Gestpay will return an `encryptedString`. The user is then redirected to `/response`.
7. In `/response`, the `DecryptServlet` will decrypt the `encryptedString` and will show the content in `response.jsp`.


## Support, help, etc.

If you need support, open an issue here on Github.