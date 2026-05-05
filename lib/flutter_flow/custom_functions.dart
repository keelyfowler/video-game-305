import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? joinGamesNames(List<FavoritesRecord>? favorites) {
  if (favorites == null || favorites.isEmpty) return null;
  return favorites
      .map((f) => f.gameName ?? '')
      .where((name) => name.isNotEmpty)
      .join(', ');
}

List<String> splitStringToList(
  String? inputString,
  String delimiter,
) {
  if (inputString == null || inputString.isEmpty) {
    return [];
  }

  return inputString
      .split(delimiter)
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
}
