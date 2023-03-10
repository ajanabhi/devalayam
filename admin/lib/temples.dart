import 'dart:convert';

class Temple {
  final String name;
  final String address;
  final LatLong latlng;
  final String info;
  Temple({
    required this.name,
    required this.address,
    required this.latlng,
    required this.info,
  });

  Temple copyWith({
    String? name,
    String? address,
    LatLong? latlng,
    String? info,
  }) {
    return Temple(
      name: name ?? this.name,
      address: address ?? this.address,
      latlng: latlng ?? this.latlng,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'latlng': latlng.toMap(),
      'info': info,
    };
  }

  factory Temple.fromMap(Map<String, dynamic> map) {
    return Temple(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      latlng: LatLong.fromMap(map['latlng']),
      info: map['info'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Temple.fromJson(String source) => Temple.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Temple(name: $name, address: $address, latlng: $latlng, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Temple &&
        other.name == name &&
        other.address == address &&
        other.latlng == latlng &&
        other.info == info;
  }

  @override
  int get hashCode {
    return name.hashCode ^ address.hashCode ^ latlng.hashCode ^ info.hashCode;
  }
}

class LatLong {
  final double lat;
  final double long;
  LatLong({
    required this.lat,
    required this.long,
  });

  LatLong copyWith({
    double? lat,
    double? long,
  }) {
    return LatLong(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory LatLong.fromMap(Map<String, dynamic> map) {
    return LatLong(
      lat: map['lat']?.toDouble() ?? 0.0,
      long: map['long']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLong.fromJson(String source) =>
      LatLong.fromMap(json.decode(source));

  @override
  String toString() => 'LatLong(lat: $lat, long: $long)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LatLong && other.lat == lat && other.long == long;
  }

  @override
  int get hashCode => lat.hashCode ^ long.hashCode;
}

abstract class Temples {
  final all = <Temple>[
    Temple(
        name: "Hanuman Temple",
        address: "5QJV+935, Kolluru, Andhra Pradesh 522324",
        latlng: LatLong(lat: 16.18681166057675, long: 80.79409063195838),
        info: ""),
    Temple(
        name: "Kamilibaba Temple",
        address: "5QJV+96J, Kolluru, Andhra Pradesh 522324",
        latlng: LatLong(lat: 16.187878593435926, long: 80.79371198645163),
        info: "")
  ];
}
