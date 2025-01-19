# multiplayer_firebase_sample

A Multiplayer game sample project.

## Getting Started

To make it work at your side you have to:
1. Create a Firebase project in your Firebase console (https://console.firebase.google.com/)
2. Create Firestore database (Build / Firestore Database section)
3. Sheet Rules have to contain such rules:
```
service cloud.firestore {
  match /databases/{database}/documents {
  	
    //-> helper funtions to determine user role
    // check if the user is autorised
    function isAuthorized() {
      return request.auth.uid != null;
    }
    // check if the user is an owner of the document
    function isAuthor(id){
    	return request.auth.uid != null && request.auth.uid == id
    }
    
    
    // users document. 
    // each authorised user has an access to create his own or read all of others
    match /users/{userId} {
      allow read: if isAuthorized();
      allow update, delete: if isAuthor(userId);
      allow create: if isAuthorized();
    }
  }
}
```

4. Create Realtime database (Build / Realtime Database section)
5. Install and activate flutterfire_cli (https://firebase.flutter.dev/docs/cli/)
6. With a help of "flutterfire configure" command attach firebase project to this Flutter project
7. Enable "Anonymous" sign-in method in Firebase console in Build / Authentication section
   
