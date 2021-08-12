import 'dart:convert';

import 'package:fitbitter/generated/json/base/json_convert_content.dart';
import 'package:fitbitter/src/data/food_req.dart';
import 'package:fitbitter/src/data/food_resp_entity.dart';
import 'package:logger/logger.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitFoodDataManager] is a class the manages the requests related to
/// [FitbitDeviceData].
class FitbitFoodDataManager extends FitbitDataManager {
  /// Default constructor
  FitbitFoodDataManager(this.data, {String? clientID, String? clientSecret}) {
    this.clientID = clientID;
    this.clientSecret = clientSecret;
  } // FitbitDeviceDataManager
  FoodReq data;

  @override
  Future<FoodRespEntity> fetch(FitbitAPIURL fitbitUrl) async {
    final response = await postResponse(fitbitUrl, jsonDecode(data.toString()));

    // Debugging
    final logger = Logger();
    logger.i('$response');
    //Extract data and return them
    FoodRespEntity ret = JsonConvert.fromJsonAsT<FoodRespEntity>(response);
    return ret;
  } // fetch

} // FitbitDeviceDataManager
