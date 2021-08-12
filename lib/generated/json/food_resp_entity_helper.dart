import 'package:fitbitter/src/data/food_resp_entity.dart';

foodRespEntityFromJson(FoodRespEntity data, Map<String, dynamic> json) {
	if (json['foodLog'] != null) {
		data.foodLog = FoodRespFoodLog().fromJson(json['foodLog']);
	}
	return data;
}

Map<String, dynamic> foodRespEntityToJson(FoodRespEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['foodLog'] = entity.foodLog?.toJson();
	return data;
}

foodRespFoodLogFromJson(FoodRespFoodLog data, Map<String, dynamic> json) {
	if (json['isFavorite'] != null) {
		data.isFavorite = json['isFavorite'].toString();
	}
	if (json['logDate'] != null) {
		data.logDate = json['logDate'].toString();
	}
	if (json['logId'] != null) {
		data.logId = json['logId'].toString();
	}
	if (json['loggedFood'] != null) {
		data.loggedFood = FoodRespFoodLogLoggedFood().fromJson(json['loggedFood']);
	}
	if (json['nutritionalValues'] != null) {
		data.nutritionalValues = FoodRespFoodLogNutritionalValues().fromJson(json['nutritionalValues']);
	}
	return data;
}

Map<String, dynamic> foodRespFoodLogToJson(FoodRespFoodLog entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['isFavorite'] = entity.isFavorite;
	data['logDate'] = entity.logDate;
	data['logId'] = entity.logId;
	data['loggedFood'] = entity.loggedFood?.toJson();
	data['nutritionalValues'] = entity.nutritionalValues?.toJson();
	return data;
}

foodRespFoodLogLoggedFoodFromJson(FoodRespFoodLogLoggedFood data, Map<String, dynamic> json) {
	if (json['accessLevel'] != null) {
		data.accessLevel = json['accessLevel'].toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount'].toString();
	}
	if (json['brand'] != null) {
		data.brand = json['brand'].toString();
	}
	if (json['calories'] != null) {
		data.calories = json['calories'].toString();
	}
	if (json['foodId'] != null) {
		data.foodId = json['foodId'].toString();
	}
	if (json['mealTypeId'] != null) {
		data.mealTypeId = json['mealTypeId'].toString();
	}
	if (json['locale'] != null) {
		data.locale = json['locale'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['unit'] != null) {
		data.unit = FoodRespFoodLogLoggedFoodUnit().fromJson(json['unit']);
	}
	if (json['units'] != null) {
		data.units = (json['units'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	return data;
}

Map<String, dynamic> foodRespFoodLogLoggedFoodToJson(FoodRespFoodLogLoggedFood entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['accessLevel'] = entity.accessLevel;
	data['amount'] = entity.amount;
	data['brand'] = entity.brand;
	data['calories'] = entity.calories;
	data['foodId'] = entity.foodId;
	data['mealTypeId'] = entity.mealTypeId;
	data['locale'] = entity.locale;
	data['name'] = entity.name;
	data['unit'] = entity.unit?.toJson();
	data['units'] = entity.units;
	return data;
}

foodRespFoodLogLoggedFoodUnitFromJson(FoodRespFoodLogLoggedFoodUnit data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['plural'] != null) {
		data.plural = json['plural'].toString();
	}
	return data;
}

Map<String, dynamic> foodRespFoodLogLoggedFoodUnitToJson(FoodRespFoodLogLoggedFoodUnit entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['plural'] = entity.plural;
	return data;
}

foodRespFoodLogNutritionalValuesFromJson(FoodRespFoodLogNutritionalValues data, Map<String, dynamic> json) {
	if (json['calories'] != null) {
		data.calories = json['calories'].toString();
	}
	if (json['carbs'] != null) {
		data.carbs = json['carbs'].toString();
	}
	if (json['fat'] != null) {
		data.fat = json['fat'].toString();
	}
	if (json['fiber'] != null) {
		data.fiber = json['fiber'].toString();
	}
	if (json['protein'] != null) {
		data.protein = json['protein'].toString();
	}
	if (json['sodium'] != null) {
		data.sodium = json['sodium'].toString();
	}
	return data;
}

Map<String, dynamic> foodRespFoodLogNutritionalValuesToJson(FoodRespFoodLogNutritionalValues entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['calories'] = entity.calories;
	data['carbs'] = entity.carbs;
	data['fat'] = entity.fat;
	data['fiber'] = entity.fiber;
	data['protein'] = entity.protein;
	data['sodium'] = entity.sodium;
	return data;
}