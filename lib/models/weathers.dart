class Weathers {
  String? address;
  List<Days>? days;
  CurrentConditions? currentConditions;

  Weathers({this.address, this.days, this.currentConditions});

  Weathers.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
    currentConditions = json['currentConditions'] != null
        ? new CurrentConditions.fromJson(json['currentConditions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    if (this.currentConditions != null) {
      data['currentConditions'] = this.currentConditions!.toJson();
    }
    return data;
  }
}

class Days {
  String? datetime;
  double? tempmax;
  double? tempmin;
  double? temp;
  double? humidity;
  double? precipprob;
  List<String>? preciptype;
  double? windspeed;
  double? pressure;
  String? conditions;
  String? icon;
  List<Hours>? hours;

  Days(
      {this.datetime,
      this.tempmax,
      this.tempmin,
      this.temp,
      this.humidity,
      this.precipprob,
      this.preciptype,
      this.windspeed,
      this.pressure,
      this.conditions,
      this.icon,
      this.hours});

  Days.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    humidity = json['humidity'];
    precipprob = json['precipprob'];
    preciptype = json['preciptype'].cast<String>();
    windspeed = json['windspeed'];
    pressure = json['pressure'];
    conditions = json['conditions'];
    icon = json['icon'];
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(new Hours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['tempmax'] = this.tempmax;
    data['tempmin'] = this.tempmin;
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['precipprob'] = this.precipprob;
    data['preciptype'] = this.preciptype;
    data['windspeed'] = this.windspeed;
    data['pressure'] = this.pressure;
    data['conditions'] = this.conditions;
    data['icon'] = this.icon;
    if (this.hours != null) {
      data['hours'] = this.hours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hours {
  String? datetime;
  double? temp;
  double? humidity;
  double? precipprob;
  Null? preciptype;
  double? windspeed;
  double? pressure;
  String? conditions;
  String? icon;

  Hours(
      {this.datetime,
      this.temp,
      this.humidity,
      this.precipprob,
      this.preciptype,
      this.windspeed,
      this.pressure,
      this.conditions,
      this.icon});

  Hours.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    temp = json['temp'];
    humidity = json['humidity'];
    precipprob = json['precipprob'];
    preciptype = json['preciptype'];
    windspeed = json['windspeed'];
    pressure = json['pressure'];
    conditions = json['conditions'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['precipprob'] = this.precipprob;
    data['preciptype'] = this.preciptype;
    data['windspeed'] = this.windspeed;
    data['pressure'] = this.pressure;
    data['conditions'] = this.conditions;
    data['icon'] = this.icon;
    return data;
  }
}

class CurrentConditions {
  String? datetime;
  double? temp;
  double? humidity;
  double? precipprob;
  Null? preciptype;
  double? windspeed;
  double? pressure;
  String? conditions;
  String? icon;

  CurrentConditions(
      {this.datetime,
      this.temp,
      this.humidity,
      this.precipprob,
      this.preciptype,
      this.windspeed,
      this.pressure,
      this.conditions,
      this.icon});

  CurrentConditions.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    temp = json['temp'];
    humidity = json['humidity'];
    precipprob = json['precipprob'];
    preciptype = json['preciptype'];
    windspeed = json['windspeed'];
    pressure = json['pressure'];
    conditions = json['conditions'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['precipprob'] = this.precipprob;
    data['preciptype'] = this.preciptype;
    data['windspeed'] = this.windspeed;
    data['pressure'] = this.pressure;
    data['conditions'] = this.conditions;
    data['icon'] = this.icon;
    return data;
  }
}
