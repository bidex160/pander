import 'package:flutter/foundation.dart';
import 'package:pander/features/authentication/data/datasources/shared_preferences_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSourceImpl extends SharedPreferencesDataSource {
  final Future<SharedPreferences> sharedPreferences;

  SharedPreferencesDataSourceImpl({@required this.sharedPreferences});
}