// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BloodBank {
  final String id;
  final String name;
  final String adresse;
  BloodBank({
    required this.id,
    required this.name,
    required this.adresse,
  });

  BloodBank copyWith({
    String? id,
    String? name,
    String? adresse,
  }) {
    return BloodBank(
      id: id ?? this.id,
      name: name ?? this.name,
      adresse: adresse ?? this.adresse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'adresse': adresse,
    };
  }

  factory BloodBank.fromMap(Map<String, dynamic> map) {
    return BloodBank(
      id: map['id'] as String,
      name: map['name'] as String,
      adresse: map['adresse'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodBank.fromJson(String source) => BloodBank.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BloodBank(id: $id, name: $name, adresse: $adresse)';

  @override
  bool operator ==(covariant BloodBank other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.adresse == adresse;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ adresse.hashCode;
}
