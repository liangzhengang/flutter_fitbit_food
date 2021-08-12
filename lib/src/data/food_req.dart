class FoodReq {
  String foodName;
  int mealTypeId;
  int unitId;
  num amount;
  String date; //2021-08-11
  int? calories;

  /// 脂肪
  int? totalFat;

  ///胆固醇
  int? cholesterol;

  ///钠
  int? sodium;

  ///钾
  int? potassium;

  ///碳水
  int? totalCarbohydrate;

  ///纤维
  int? dietaryFiber;

  ///蛋白质
  int? protein;

  FoodReq(this.foodName, this.mealTypeId, this.unitId, this.amount, this.date,
      {this.calories,
      this.totalFat,
      this.cholesterol,
      this.sodium,
      this.potassium,
      this.totalCarbohydrate,
      this.dietaryFiber,
      this.protein});

  @override
  String toString() {
    return '{"foodName": "$foodName", "mealTypeId": $mealTypeId, "unitId": $unitId, "amount": $amount, "date": "$date", "calories": $calories, "totalFat": $totalFat, "cholesterol": $cholesterol, "sodium": $sodium, "potassium": $potassium, "totalCarbohydrate": $totalCarbohydrate, "dietaryFiber": $dietaryFiber, "protein": $protein}';
  }


}
