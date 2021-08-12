import 'package:fitbitter/src/data/food_req.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fitbitter.dart';

class FitbitFoodAPIURL extends FitbitAPIURL {
  /// Default [FitbitDeviceAPIURL] constructor.

  FitbitFoodAPIURL({String? url, String? userID})
      : super(
          url: url,
          userID: userID,
        );

  /// factory constructor
  factory FitbitFoodAPIURL.logFood({String? userID}) =>
      FitbitFoodAPIURL(
          url: '${_getBaseURL(userID)}log.json', userID: userID);

  /// A private method that generates the base url of a [FitbitDeviceAPIURL].
  static String _getBaseURL(String? userID) {
    if (userID == null) {
      userID = GetIt.instance<SharedPreferences>().getString("user_id");
    }
    return 'https://api.fitbit.com/1/user/$userID/foods/';
  } // _getBaseURL

}
