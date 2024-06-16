// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MarkEntity extends Equatable {
  final int id;
  final double latitude;
  final double longitude;
  final String addres;
  final String name;
  final String shortDescription;
  final String description;
  final List<Image> images;

  const MarkEntity({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.addres,
    required this.name,
    required this.shortDescription,
    required this.description,
    this.images = const [],
  });

  MarkEntity copyWith({
    int? id,
    double? latitude,
    double? longitude,
    String? addres,
    String? name,
    String? shortDescription,
    String? description,
    List<Image>? images,
  }) {
    return MarkEntity(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addres: addres ?? this.addres,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'addres': addres,
      'name': name,
      'shortDescription': shortDescription,
      'description': description,
      //'images': images.map((x) => x.toMap()).toList(),
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      latitude,
      longitude,
      addres,
      name,
      shortDescription,
      description,
      images,
    ];
  }

  factory MarkEntity.fromMap(Map<String, dynamic> map) {
    return MarkEntity(
      id: map['MarkID'] as int,
      latitude: map['Latitude'] as double,
      longitude: map['Longitude'] as double,
      addres: map['Address'] as String,
      name: map['Markname'] as String,
      shortDescription: map['ShortDescription'] as String,
      description: map['LongDescription'] as String,
      //images: List<Image>.from((map['images'] as List<int>).map<Image>((x) => Image.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MarkEntity.fromJson(String source) =>
      MarkEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
