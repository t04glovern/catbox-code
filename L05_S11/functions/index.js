const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

exports.onLikeCat = functions.firestore
    .document('/likes/{likeId}')
    .onCreate(event => {
        let catId, userId;
        [catId, userId] = event.params.likeId.split(':');

        const db = admin.firestore();
        const catRef = db.collection('cats').doc(catId);
        db.runTransaction(t => {
            return t.get(catRef)
                .then(doc => {
                    t.update(catRef, {
                        like_counter: (doc.data().like_counter || 0) + 1
                    });
                })
        }).then(result => {
            console.log('Increased aggregate cat like counter.');
        }).catch(err => {
            console.log('Failed to increase aggregate cat like counter.', err);
        });
    });

exports.onUnlikeCat = functions.firestore
    .document('/likes/{likeId}')
    .onDelete(event => {
        let catId, userId;
        [catId, userId] = event.params.likeId.split(':');

        const db = admin.firestore();
        const catRef = db.collection('cats').doc(catId);
        return db.runTransaction(t => {
            return t.get(catRef)
                .then(doc => {
                    t.update(catRef, {
                        like_counter: (doc.data().like_counter || 0) - 1
                    });
                })
        }).then(result => {
            console.log('Decreased aggregate cat like counter.');
        }).catch(err => {
            console.log('Failed to decrease aggregate cat like counter.', err);
        });
    });
