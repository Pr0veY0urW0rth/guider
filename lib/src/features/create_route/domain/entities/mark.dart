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
      'latitude': latitude,
      'longitude': longitude,
      'addres': addres,
      'name': name,
      'shortDescription': shortDescription,
      'description': description,
      'images': images.toString(),
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
}
