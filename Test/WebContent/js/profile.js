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
		profile: [],
		profilePic: '',
		name: '',
		dateOfBirth: '',
		state: '',
		city: '',
	},

	methods: {
		signOut() {
			firebase.auth().signOut();
		},
	},
	
	mounted: {
	    getProfileData: function () {
	        axios.get("B_test.jsp")
	        .then((response)  =>  {
	          this.profile = response.data.value;
	        })
	    }
	},
})