import 'package:fitbitter/generated/json/base/json_convert_content.dart';

class FoodRespEntity with JsonConvert<FoodRespEntity> {
	FoodRespFoodLog? foodLog;
}

class FoodRespFoodLog with JsonConvert<FoodRespFoodLog> {
	String? isFavorite;
	String? logDate;
	String? logId;
	FoodRespFoodLogLoggedFood? loggedFood;
	FoodRespFoodLogNutritionalValues? nutritionalValues;
}

class FoodRespFoodLogLoggedFood with JsonConvert<FoodRespFoodLogLoggedFood> {
	String? accessLevel;
	String? amount;
	String? brand;
	String? calories;
	String? foodId;
	String? mealTypeId;
	String? locale;
	String? name;
	FoodRespFoodLogLoggedFoodUnit? unit;
	List<String>? units;
}

class FoodRespFoodLogLoggedFoodUnit with JsonConvert<FoodRespFoodLogLoggedFoodUnit> {
	String? id;
	String? name;
	String? plural;
}

class FoodRespFoodLogNutritionalValues with JsonConvert<FoodRespFoodLogNutritionalValues> {
	String? calories;
	String? carbs;
	String? fat;
	String? fiber;
	String? protein;
	String? sodium;
}
