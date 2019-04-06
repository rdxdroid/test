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
    el: '#content',

    data: {
        email: '',
    },

    methods: {
        sendPasswordResetEmail () {
            firebase.auth().sendPasswordResetEmail(this.email);
        },
    },
})