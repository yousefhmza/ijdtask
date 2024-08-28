import 'package:ijdtask/modules/home/models/category_model.dart';

class Suggestion {
  final String mainImage;
  final List<String> images;
  final String logo;
  final int id;
  final int type;
  final int hotelStars;
  final String nameEn;
  final String nameAr;
  final String discEn;
  final String discAr;
  final String mobile;
  final String email;
  final String website;
  final String address;
  final String city;
  final double? mapLon;
  final double? mapLat;
  final num averageRating;
  final List<PropertyAmenity> propertyAmenities;
  final List<PropertyAmenity> propertySpecialAmenities;
  final CategoryModel propertyType;
  final int price;
  final int priceAfterDiscount;

  Suggestion({
    required this.mainImage,
    required this.images,
    required this.logo,
    required this.id,
    required this.type,
    required this.hotelStars,
    required this.nameEn,
    required this.nameAr,
    required this.discEn,
    required this.discAr,
    required this.mobile,
    required this.email,
    required this.website,
    required this.address,
    required this.city,
    required this.mapLon,
    required this.mapLat,
    required this.averageRating,
    required this.propertyAmenities,
    required this.propertySpecialAmenities,
    required this.propertyType,
    required this.price,
    required this.priceAfterDiscount,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        mainImage: json["mainImage"] ?? "",
        images: List<String>.from((json["images"] ?? []).map((image) => image)),
        logo: json["logo"] ?? "",
        id: json["id"] ?? 0,
        type: json["type"] ?? 0,
        hotelStars: json["hotelStars"] ?? 0,
        nameEn: json["nameEn"] ?? "",
        nameAr: json["nameAr"] ?? "",
        discEn: json["discEn"] ?? "",
        discAr: json["discAr"] ?? "",
        mobile: json["mobile"] ?? "",
        email: json["email"] ?? "",
        website: json["website"] ?? "",
        address: json["address"] ?? "",
        city: json["city"] ?? "",
        mapLon: double.tryParse(json["mapLon"].toString()),
        mapLat: double.tryParse(json["mapLat"].toString()),
        averageRating: json["averageRating"] ?? 0,
        propertyAmenities: List<PropertyAmenity>.from(
          (json["PropertyAmenities"] ?? []).map((amenity) => PropertyAmenity.fromJson(amenity)),
        ),
        propertySpecialAmenities: List<PropertyAmenity>.from(
          (json["PropertySpecialAmenities"] ?? []).map((amenity) => PropertyAmenity.fromJson(amenity)),
        ),
        propertyType: CategoryModel.fromJson(json["PropertyType"] ?? {}),
        price: json["price"] ?? 0,
        priceAfterDiscount: json["priceAfterDiscount"] ?? 0,
      );
}

class PropertyAmenity {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int propertyId;
  final int amenityId;
  final CategoryModel amenity;

  PropertyAmenity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.propertyId,
    required this.amenityId,
    required this.amenity,
  });

  factory PropertyAmenity.fromJson(Map<String, dynamic> json) => PropertyAmenity(
        id: json["id"] ?? 0,
        createdAt: DateTime.tryParse(json["createdAt"].toString()) ?? DateTime(1970),
        updatedAt: DateTime.tryParse(json["updatedAt"].toString()) ?? DateTime(1970),
        propertyId: json["PropertyId"] ?? 0,
        amenityId: json["AmenityId"] ?? 0,
        amenity: CategoryModel.fromJson(json["Amenity"] ?? {}),
      );
}
