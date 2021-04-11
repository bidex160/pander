import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  // ...dependentServices,
  // ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider.value(value: FirebaseAuth.instance),
  Provider.value(value: SharedPreferences.getInstance()),
  Provider.value(value: FirebaseFunctions.instance),
];

// List<SingleChildWidget> dependentServices = [];
// List<SingleChildWidget> uiConsumableProviders = [];