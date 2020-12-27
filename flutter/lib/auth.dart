import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Stream<User> get userStream => _auth.userChanges();

  Auth() {
    if (_auth.currentUser == null) _auth.signInAnonymously();
    userStream.forEach((user) => print("USER LOG: $user"));
  }

  changeNickname(String name) {
    _auth.currentUser.updateProfile(displayName: name);
  }

  changePhoto(String photoURL) {
    _auth.currentUser.updateProfile(photoURL: photoURL);
  }

  static bool isLoggedIn(User user) => user != null && !user.isAnonymous;

  bool isLinked(String provider) => _auth.currentUser.providerData
      .any((element) => element.providerId == provider);

  bool hasProvider() => _auth.currentUser.providerData.isNotEmpty;

  Future<AuthCredential> google() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    return GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  facebook() async {
    print("facebook");
  }

  Future<AuthCredential> twitter() async {
    final TwitterLogin twitterLogin = TwitterLogin(
      consumerKey: 'nkIJrTlleaOfXerkosQDRKamn',
      consumerSecret: 'W4flLl2GW86zC8jwVYPTs0FycokB8GaLEMfMgqeMcMR6Q4Y7z0',
    );
    final TwitterLoginResult loginResult = await twitterLogin.authorize();
    final TwitterSession twitterSession = loginResult.session;
    return TwitterAuthProvider.credential(
      accessToken: twitterSession.token,
      secret: twitterSession.secret,
    );
  }

  Future<AuthCredential> getProviderCredential(String provider) async {
    switch (provider) {
      case "google.com":
        return await google();
      case "twitter.com":
        return await twitter();
      case "facebook.com":
        return await facebook();
      default:
        return null;
    }
  }

  toggleProvider(String provider) async {
    if (isLinked(provider)) {
      _auth.currentUser?.unlink(provider);
    } else {
      final credential = await getProviderCredential(provider);
      bool exists = false;
      await _auth.currentUser.linkWithCredential(credential).catchError(
        (error) {
          exists = error.code == "credential-already-in-use";
        },
      );
      if (exists) {
        if (!hasProvider()) {
          await _auth.signInWithCredential(credential);
          if (_auth.currentUser.photoURL == null)
            changePhoto(_auth.currentUser.providerData?.first?.photoURL);
          if (_auth.currentUser.displayName == null)
            changeNickname(_auth.currentUser.providerData?.first?.displayName);
        } else {
          Fluttertoast.showToast(
            msg: "This social media account is already linked.\n"
                "Please sign out if you want to use it.",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 18,
          );
        }
      }
    }
  }

  signOut() async {
    await _auth.signOut();
    await _auth.signInAnonymously();
  }

  void deleteAccount() async {
    if (_auth.currentUser.providerData.length > 0) {
      final provider = _auth.currentUser.providerData.first.providerId;
      final credential = await getProviderCredential(provider);
      if (credential != null)
        await _auth.currentUser.reauthenticateWithCredential(credential);
    }
    await _auth.currentUser.delete();
    _auth.signInAnonymously();
  }
}
