import 'package:equatable/equatable.dart';

class ExampleModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final Map? other;

  const ExampleModel({
    required this.id,
    required this.name,
    required this.email,
    this.other,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        other,
      ];

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        other: json['other'] as Map,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'other': other,
      };

  ExampleModel copyWith({
    int? id,
    String? name,
    String? email,
    Map? other,
  }) =>
      ExampleModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        other: other ?? this.other,
      );
}
