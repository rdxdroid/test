const config = {
	apiKey: "AIzaSyAwj0S65tbfKXormqaslo-pooz1mDtFTvs",
	authDomain: "niryamana-ac2dc.firebaseapp.com",
	databaseURL: "https://niryamana-ac2dc.firebaseio.com",
	projectId: "niryamana-ac2dc",
	storageBucket: "niryamana-ac2dc.appspot.com",
	messagingSenderId: "449429620964"
};
firebase.initializeApp(config);

new Vue({
	el: '#main',

	data: {
		mobNumber: '',
		OTP: '',
		appVerifier: '',
	},

	methods: {
		openNav() {
			document.getElementById("mySidenav").style.width = "13.5em";
			document.getElementById("main").style.marginLeft = "13.5em";
			document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
		},

		closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "white";
		},

		signOut() {
			firebase.auth().signOut();
		},

		sendOTP() {
			firebase.auth().signInWithPhoneNumber(this.mobNumber, window.appVerifier).then((confirmationResult) => {
				window.confirmationResult = confirmationResult;
			});

			window.appVerifier = new firebase.auth.RecaptchaVerifier('recaptchaVerifierDIV', {
				'size': 'invisible',
				'callback': (response) => {
					console.log(response);
				}
			});
		},

		verifyOTP() {
			window.confirmationResult.confirm(this.OTP).then((result) => {
				console.log(result);
			});
		},
	},
})