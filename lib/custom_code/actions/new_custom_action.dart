// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// when this button is pressed, i want the game (game name, userid, and reviewtext to be saved to a favorites collection to be displayed on the profile screen
import 'package:cloud_firestore/cloud_firestore.dart';

Future newCustomAction() async {
  // Get the current user's ID
  final currentUser = currentUserUid;

  if (currentUser == null || currentUser.isEmpty) {
    print('No user logged in');
    return;
  }

  try {
    // Reference to the favorites collection in Firestore
    final favoritesCollection =
        FirebaseFirestore.instance.collection('favorites');

    // Query to check if this game is already in favorites for this user
    final existingFavorite = await favoritesCollection
        .where('userid', isEqualTo: currentUser)
        .where('gameName', isEqualTo: FFAppState().gameName)
        .get();

    if (existingFavorite.docs.isNotEmpty) {
      // Game already exists in favorites, no need to add again
      print('Game already in favorites');
      return;
    }

    // Add the game to the favorites collection
    await favoritesCollection.add({
      'gameName': FFAppState().gameName,
      'userid': currentUser,
      'reviewText': FFAppState().reviewText,
      'createdAt': FieldValue.serverTimestamp(),
    });

    print('Game successfully added to favorites');
  } catch (e) {
    print('Error adding game to favorites: $e');
  }
}
