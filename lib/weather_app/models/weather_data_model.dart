
class WeatherDataModel {
  Location? location;
  Current? current;

  WeatherDataModel({this.location, this.current});

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    location = json["location"] == null ? null : Location.fromJson(json["location"]);
    current = json["current"] == null ? null : Current.fromJson(json["current"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(location != null) {
      _data["location"] = location?.toJson();
    }
    if(current != null) {
      _data["current"] = current?.toJson();
    }
    return _data;
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  int? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  int? precipMm;
  int? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  int? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? visKm;
  int? visMiles;
  double? uv;
  int? gustMph;
  double? gustKph;
  AirQuality? airQuality;

  Current({this.lastUpdatedEpoch, this.lastUpdated, this.tempC, this.tempF, this.isDay, this.condition, this.windMph, this.windKph, this.windDegree, this.windDir, this.pressureMb, this.pressureIn, this.precipMm, this.precipIn, this.humidity, this.cloud, this.feelslikeC, this.feelslikeF, this.windchillC, this.windchillF, this.heatindexC, this.heatindexF, this.dewpointC, this.dewpointF, this.visKm, this.visMiles, this.uv, this.gustMph, this.gustKph, this.airQuality});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = (json["last_updated_epoch"] as num).toInt();
    lastUpdated = json["last_updated"];
    tempC = (json["temp_c"] as num).toInt();
    tempF = (json["temp_f"] as num).toDouble();
    isDay = (json["is_day"] as num).toInt();
    condition = json["condition"] == null ? null : Condition.fromJson(json["condition"]);
    windMph = (json["wind_mph"] as num).toDouble();
    windKph = (json["wind_kph"] as num).toDouble();
    windDegree = (json["wind_degree"] as num).toInt();
    windDir = json["wind_dir"];
    pressureMb = (json["pressure_mb"] as num).toInt();
    pressureIn = (json["pressure_in"] as num).toDouble();
    precipMm = (json["precip_mm"] as num).toInt();
    precipIn = (json["precip_in"] as num).toInt();
    humidity = (json["humidity"] as num).toInt();
    cloud = (json["cloud"] as num).toInt();
    feelslikeC = (json["feelslike_c"] as num).toDouble();
    feelslikeF = (json["feelslike_f"] as num).toDouble();
    windchillC = (json["windchill_c"] as num).toInt();
    windchillF = (json["windchill_f"] as num).toDouble();
    heatindexC = (json["heatindex_c"] as num).toDouble();
    heatindexF = (json["heatindex_f"] as num).toDouble();
    dewpointC = (json["dewpoint_c"] as num).toDouble();
    dewpointF = (json["dewpoint_f"] as num).toDouble();
    visKm = (json["vis_km"] as num).toInt();
    visMiles = (json["vis_miles"] as num).toInt();
    uv = (json["uv"] as num).toDouble();
    gustMph = (json["gust_mph"] as num).toInt();
    gustKph = (json["gust_kph"] as num).toDouble();
    airQuality = json["air_quality"] == null ? null : AirQuality.fromJson(json["air_quality"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["last_updated_epoch"] = lastUpdatedEpoch;
    _data["last_updated"] = lastUpdated;
    _data["temp_c"] = tempC;
    _data["temp_f"] = tempF;
    _data["is_day"] = isDay;
    if(condition != null) {
      _data["condition"] = condition?.toJson();
    }
    _data["wind_mph"] = windMph;
    _data["wind_kph"] = windKph;
    _data["wind_degree"] = windDegree;
    _data["wind_dir"] = windDir;
    _data["pressure_mb"] = pressureMb;
    _data["pressure_in"] = pressureIn;
    _data["precip_mm"] = precipMm;
    _data["precip_in"] = precipIn;
    _data["humidity"] = humidity;
    _data["cloud"] = cloud;
    _data["feelslike_c"] = feelslikeC;
    _data["feelslike_f"] = feelslikeF;
    _data["windchill_c"] = windchillC;
    _data["windchill_f"] = windchillF;
    _data["heatindex_c"] = heatindexC;
    _data["heatindex_f"] = heatindexF;
    _data["dewpoint_c"] = dewpointC;
    _data["dewpoint_f"] = dewpointF;
    _data["vis_km"] = visKm;
    _data["vis_miles"] = visMiles;
    _data["uv"] = uv;
    _data["gust_mph"] = gustMph;
    _data["gust_kph"] = gustKph;
    if(airQuality != null) {
      _data["air_quality"] = airQuality?.toJson();
    }
    return _data;
  }
}

class AirQuality {
  double? co;
  double? no2;
  int? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality({this.co, this.no2, this.o3, this.so2, this.pm25, this.pm10, this.usEpaIndex, this.gbDefraIndex});

  AirQuality.fromJson(Map<String, dynamic> json) {
    co = (json["co"] as num).toDouble();
    no2 = (json["no2"] as num).toDouble();
    o3 = (json["o3"] as num).toInt();
    so2 = (json["so2"] as num).toDouble();
    pm25 = (json["pm2_5"] as num).toDouble();
    pm10 = (json["pm10"] as num).toDouble();
    usEpaIndex = (json["us-epa-index"] as num).toInt();
    gbDefraIndex = (json["gb-defra-index"] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["co"] = co;
    _data["no2"] = no2;
    _data["o3"] = o3;
    _data["so2"] = so2;
    _data["pm2_5"] = pm25;
    _data["pm10"] = pm10;
    _data["us-epa-index"] = usEpaIndex;
    _data["gb-defra-index"] = gbDefraIndex;
    return _data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    icon = json["icon"];
    code = (json["code"] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["text"] = text;
    _data["icon"] = icon;
    _data["code"] = code;
    return _data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({this.name, this.region, this.country, this.lat, this.lon, this.tzId, this.localtimeEpoch, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    region = json["region"];
    country = json["country"];
    lat = (json["lat"] as num).toDouble();
    lon = (json["lon"] as num).toDouble();
    tzId = json["tz_id"];
    localtimeEpoch = (json["localtime_epoch"] as num).toInt();
    localtime = json["localtime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["region"] = region;
    _data["country"] = country;
    _data["lat"] = lat;
    _data["lon"] = lon;
    _data["tz_id"] = tzId;
    _data["localtime_epoch"] = localtimeEpoch;
    _data["localtime"] = localtime;
    return _data;
  }
}