class Region {
  late String id;
  late String nama;

  Region({
    required this.id,
    required this.nama,
  });

  factory Region.fromJson(Map<String, dynamic> json) =>
      Region(id: json["id"], nama: json["nama"]);

  Map<String, dynamic> toJson() => {"id": id, "nama": nama};
}
