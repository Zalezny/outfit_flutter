class WorkTime {
  int? hour;
  int? minute;
  int? second;
  String? date;
  String? sId;

  WorkTime({
    this.hour,
    this.minute,
    this.second,
    this.date,
    this.sId,
  });

  WorkTime.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
    date = json['date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hour'] = hour;
    data['minute'] = minute;
    data['second'] = second;
    data['date'] = date;
    data['_id'] = sId;
    return data;
  }

  WorkTime copyWith({
    int? hour,
    int?  minute,
    int? second,
    String? date,
    String? sId,
  }) {
    return WorkTime(
      hour: hour ?? this.hour,
      sId: sId ?? this.sId,
      second: second ?? this.second,
      minute: minute ?? this.minute,
      date: date ?? this.date,
    );
  }
}