import 'package:empty/counter/domain/entity/counter_entity.dart';

class CounterModel extends CounterEntity {
  const CounterModel({
    required super.intCounter,
  });
  
  factory CounterModel.fromJson(Map<String, dynamic> json) => CounterModel(
        intCounter: json["intCounter"],
      );

  Map<String, dynamic> toJson() => {
        "intCounter": intCounter,
      };
}
