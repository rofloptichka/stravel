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

double ratingSummary(
  double totalRatings,
  double rating,
) {
  // get average rating to one decimal point from list of reviews
  if (totalRatings > 0) {
    return (rating +
            (totalRatings - rating) ~/ math.max((totalRatings ~/ 5), 1)) /
        2;
  } else {
    return rating;
  }
}

double ratingSummaryList(List<ReviewsRecord> rating) {
  if (rating.isEmpty) {
    return 0;
  }
  var ratingsSum = 0.0;
  for (final comment in rating) {
    ratingsSum += comment.rating!;
  }
  return ratingsSum / rating.length;
}

bool searchForText(
  String searchFor,
  String searchin,
) {
  return searchin.toLowerCase().contains(searchFor.toLowerCase());
}

bool alwaysTrue() {
  return true;
}

int totalPrice(
  int baseprice,
  int adprice,
) {
  return (baseprice + adprice);
}

String showper(
  int numba,
  String percent,
) {
  return (numba.toString() + percent);
}

int newCustomFunction(
  int price,
  int numberofpeople,
) {
  return price * numberofpeople;
}
