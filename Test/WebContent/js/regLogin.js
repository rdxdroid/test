const config = {
	apiKey: "AIzaSyAwj0S65tbfKXormqaslo-pooz1mDtFTvs",
	authDomain: "niryamana-ac2dc.firebaseapp.com",
	databaseURL: "https://niryamana-ac2dc.firebaseio.com",
	projectId: "niryamana-ac2dc",
	storageBucket: "niryamana-ac2dc.appspot.com",
	messagingSenderId: "449429620964"
};
firebase.initializeApp(config);

new Vue ({
	el: '#logreg',
	data: {
		email: null,
		password: '',
		passwordConfirm: '',
		userName: null,
		loginPassword: '',
		signedIn: false,
		signedUp: false,
		userUID: '',
		errorCode: '',
		errorMessageFlag: false,
	},

	methods: {
		register () {
			firebase.auth().setPersistence(firebase.auth.Auth.Persistence.SESSION).then(() => {
				firebase.auth().createUserWithEmailAndPassword(this.email, this.password).then((signedUp) => {
					this.signedUp = true;
					this.userUID = firebase.auth().currentUser.uid;
					document.getElementById("UIDReg").value = this.userUID;
				})
				.catch((error) => {
					this.errorCode = error.code;
					if(errorCode == "email-already-in-use")
						this.errorMessageFlag = true;
				});
			});
		},

		signIn () {
			firebase.auth().setPersistence(firebase.auth.Auth.Persistence.SESSION).then(() => {
				firebase.auth().signInWithEmailAndPassword(this.userName, this.loginPassword).then((signedIn) => {
					this.signedIn = true;
					this.userUID = firebase.auth().currentUser.uid;
					document.getElementById("UIDLogin").value = this.userUID;
				})
				.catch((error) => {
					this.errorCode = error.code;
					if (errorCode == "user-not-found")
						this.errorMessageFlag = true;
					else if (errorCode == "wrong-password")
						this.errorMessageFlag = true;
				});
			});
		},
	},

	created() {
		firebase.auth().onAuthStateChanged(user => {
			if (this.signedUp == true) {
				document.getElementById("UIDFormReg").submit();
			}
			else if (this.signedIn == true)
				document.getElementById("UIDFormLogin").submit();
		});
	},
})