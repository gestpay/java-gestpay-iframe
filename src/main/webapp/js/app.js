'use strict';
var payModule = (function (BrowserEnabled, GestPay, configuration, util) {

	// BrowserEnabled is true if everything is OK
	if (!BrowserEnabled) {
		// the browser is NOT supported
		util.showErrors('', 'Browser not supported!', 'start');
		return;
	}

	// The Browser is supported!
	// shopLogin and encryptedString come from Step 2...
	GestPay.CreatePaymentPage(configuration.shopLogin, configuration.encryptedString, pageLoadedCallback);


	function pageLoadedCallback(result) {
		if (result.ErrorCode != 10) { // 10 means everything OK
			//An error has occurred
			//result.ErrorCode will return the Error occurred
			//Result.ErrorDescription will return the Error Description
			util.showErrors(result.ErrorCode, result.ErrorDescription, 'pageLoadedCallback');
			return;
		}
		if (document.getElementById('submit')) {
			document.getElementById('submit').disabled = false;
			document.getElementById('submit').setAttribute('value', 'Pay');
		}

		//the iFrame is correctly created and the payment page is loaded;
		// the user can proceed to insert the credit card data.

		var PaRes = configuration.PaRes;

		if (PaRes) {
			var transKey = util.getCookie('transKey');
			handle3Dsecurity(PaRes, transKey);
		}
	}

	function checkCC() {
		document.getElementById('submit').disabled = true;
		GestPay.SendPayment({
			CC: document.getElementById('CC').value,
			EXPMM: document.getElementById('ExpMM').value,
			EXPYY: document.getElementById('ExpYY').value,
			CVV2: document.getElementById('CVV2').value
		}, paymentCompletedCallback);
		return false;
	}

	var paymentCompletedCallback = function (result) {
		if (result.ErrorCode == 0) {
			//Call went good. proceed to decrypt the Result.EncryptedResponse property
			document.location.replace('response?a=' + configuration.shopLogin + '&b=' + result.EncryptedString);
		}

		// 8006 : Card holder authorization required
		else if (result.ErrorCode == 8006) {

			//Get the TransKey
			//NOTE: you have to store this value somewhere (for example, in a cookie)
			//for further use. After the redirect, you'll need this.
			document.cookie = "transKey=" + result.TransKey;
			//Get the encrypted string required to access the issuer authentication page
			document.cookie = 'encryptedString= '+ configuration.encryptedString;
			//Get the shopLogin required to access the issuer authentication page
			document.cookie ='shopLogin=' + configuration.shopLogin;
			//Get the VBVRisp; we will need it soon !
			var VBVRisp = result.VBVRisp;

			//place here the code to redirect the card holder to the authentication website
			// similar behavior as an HTTP redirect
			var gestpay3dUrl = 'https://testecomm.sella.it/pagam/pagam3d.aspx';
			//after the 3d authentication, gestpay will redirect to this url:
			var redirectUrl = 'http://localhost:8080/pay-secure.jsp';
			document.location.replace(gestpay3dUrl + '?a=' + configuration.shopLogin + '&b=' + VBVRisp + '&c=' + redirectUrl );

		} else  {
			//Call failed for other errors
			//.... place here error handle code...
			util.showErrors(result.ErrorCode, result.ErrorDescription, 'paymentCompletedCallback');
		}
	};


	function handle3Dsecurity(PaRes, transKey) {

		GestPay.SendPayment({
				'TransKey': transKey,
				'PARes': PaRes
			},
			paymentSuccededCallback);
	}

	function paymentSuccededCallback(result) {
		if (result.ErrorCode != 0) {
			//Call failed an error has occurred
			//.... place here error handle code...
			util.showErrors(result.ErrorCode, result.ErrorDescription, 'paymentSuccededCallback');

		} else {
			//Call went good
			//place here the code to retreive the encrypted string
			var responseString = result.EncryptedResponse;
			document.location.replace('response?a=' + configuration.shopLogin + '&b=' + result.EncryptedString);
		}
	}

	return {
		checkCC: checkCC
	};

}(window.BrowserEnabled, window.GestPay, window.configuration, util));