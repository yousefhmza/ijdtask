class CategoryModel {
  final String image;
  final int id;
  final String nameAr;
  final String nameEn;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.image,
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        image: json["image"] ?? "",
        id: json["id"] ?? 0,
        nameAr: json["nameAr"] ?? "",
        nameEn: json["nameEn"] ?? "",
        status: json["status"] ?? "",
        createdAt: DateTime.tryParse(json["createdAt"].toString()) ?? DateTime(1970),
        updatedAt: DateTime.tryParse(json["updatedAt"]) ?? DateTime(1970),
      );
}
