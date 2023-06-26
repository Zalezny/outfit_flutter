import 'package:outfit_flutter/web_api/dto/work_time.dart';

class OutfitDto {
  String? sId;
  String? title;
  String? hour;
  String? date;
  List<WorkTime>? momHours;
  List<WorkTime>? kateHours;
  int? iV;
  bool? ended;

  OutfitDto(
      {this.sId,
      this.title,
      this.hour,
      this.date,
      this.momHours,
      this.kateHours,
      this.iV,
      this.ended});

  OutfitDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    hour = json['hour'];
    date = json['date'];
    if (json['momHours'] != null) {
      momHours = <WorkTime>[];
      json['momHours'].forEach((v) {
        momHours!.add(WorkTime.fromJson(v));
      });
    }
    if (json['kateHours'] != null) {
      kateHours = <WorkTime>[];
      json['kateHours'].forEach((v) {
        kateHours!.add(WorkTime.fromJson(v));
      });
    }
    iV = json['__v'];
    ended = json['ended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['hour'] = hour;
    data['date'] = date;
    if (momHours != null) {
      data['momHours'] = momHours!.map((v) => v.toJson()).toList();
    }
    if (kateHours != null) {
      data['kateHours'] = kateHours!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    data['ended'] = ended;
    return data;
  }

  OutfitDto copyWith({
    String? sId,
  String? title,
  String? hour,
  String? date,
  List<WorkTime>? momHours,
  List<WorkTime>? kateHours,
  int? iV,
  bool? ended,
  }) {
    return OutfitDto(
      sId: sId ?? this.sId,
      title: title ?? this.title,
      hour: hour ?? this.hour,
      date: date ?? this.date,
      momHours: momHours ?? this.momHours,
      kateHours: kateHours ?? this.kateHours,
      iV: iV ?? this.iV,
      ended: ended ?? this.ended
    );
  }
}


