// ignore_for_file: public_member_api_d

import 'dart:convert';

import 'bood_bank_model.dart';

class BloodModel {
  final String id;
  final String bloodGroup;
  final BloodBank bloodBank;
  final String delayTime;
  final bool isAvailable;
  BloodModel(
      {required this.id,
      this.isAvailable=false,
      required this.bloodGroup,
      required this.bloodBank,
      required this.delayTime});

  BloodModel copyWith(
      {String? id,
      String? bloodGroup,
      BloodBank? bloodBank,
      String? delayTime,
      bool? isAvailable
      }) {
    return BloodModel(
        id: id ?? this.id,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        bloodBank: bloodBank ?? this.bloodBank,
        delayTime: delayTime ?? this.delayTime,
        
        isAvailable: isAvailable?? this.isAvailable
        );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bloodGroup': bloodGroup,
      'bloodBank': bloodBank.toMap(),
      'delayTime': delayTime,
      'isAvailable':isAvailable
    };
  }

  factory BloodModel.fromMap(Map<String, dynamic> map) {
    return BloodModel(
        id: map['id'] as String,
        bloodGroup: map['bloodGroup'] as String,
        bloodBank: BloodBank.fromMap(map['bloodBank'] as Map<String, dynamic>),
        delayTime: map['delayTime'] as String,
        
        isAvailable: map['isAvailable'] as bool
        
        );
  }

  String toJson() => json.encode(toMap());

  factory BloodModel.fromJson(String source) =>
      BloodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BloodModel(id: $id, isAvalable:$isAvailable,bloodGroup: $bloodGroup, bloodBank: $bloodBank, delayTime: $delayTime)';

  @override
  bool operator ==(covariant BloodModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bloodGroup == bloodGroup &&
        other.bloodBank == bloodBank;
  }

  @override
  int get hashCode => id.hashCode ^ bloodGroup.hashCode ^ bloodBank.hashCode;

  static List<BloodModel> bloods = [
    BloodModel(
        id: "1",
        bloodGroup: "A+",
        bloodBank: BloodBank(
            id: "2",
            name: "Cotonou Blood Express",
            adresse: "250 rue de l'amzon"),
        delayTime: '50',
        isAvailable: true
        ),
    BloodModel(
        id: "2",
        bloodGroup: "AB+",
        delayTime: "10",
        bloodBank: BloodBank(
            id: "3", name: "Calavi Blood ", adresse: "En face de l'UAC")),
    BloodModel(
        id: "3",
        bloodGroup: "B+",
        delayTime: "20",
        bloodBank: BloodBank(
            id: "2",
            name: "Cotonou Blood Express",
            
            adresse: "250 rue de l'amzon"),
            isAvailable: false
            
            ),
    BloodModel(
        delayTime: "50",
        id: "4",
        bloodGroup: "A-",
        bloodBank: BloodBank(
            id: "2", name: "Calavi Blood", adresse: "En face de l'UAC"))
  ];
}
