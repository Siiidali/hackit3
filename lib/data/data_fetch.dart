import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;


class FetchData {
  Future<String> getData() async {
    final queryParameters = {
      "user_id": "b5f6b8c5-a400-4448-8422-c3a3da90d472",
      "start_date": "2022-01-13",
      "to_webhook": "false"
    };
    final headers = {
      "dev-id": "patach-LgIVrIIoFr",
      "x-api-key":
          "2de7511d1120e528d5af049a1ae408b20600916a4976a81170c0a2d6e5a43118",
    };
    final query = Uri.https("api.tryterra.co", "/v2/daily", queryParameters);
    final response = await http.get(query, headers: headers);
    final json = jsonDecode(response.body);
    return json.toString();
  }
}



class DataFetch {
  Future<List> getData() async {
    final jsondata = await rootBundle.rootBundle.loadString('data/body.json');

    Map<String, dynamic> list = json.decode(jsondata);
    List<dynamic> data = list['data'];

    // seperating the data
    List<HRTB> _heartBeat = [];
    List<BloodSugar> _bloodSugar = [];
    List<BloodPressure> _bloodPressure = [];
    List<BodyTemp> _bodyTemp = [];
    int i = 0;
    for (var hydra in data[0]['heart_data']['heart_rate_data']['detailed']
        ['hr_samples']) {
      _heartBeat.add(HRTB(hydra['bpm'], i++));
    }
    i = 0;
    for (var blood in data[0]['insulin_data']['blood_glucose_samples']) {
      _bloodSugar.add(BloodSugar(blood['blood_glucose_mg_per_dL'], i++));
    }
    i = 0;
    for (var pressure in data[0]['blood_pressure_data']
        ['blood_pressure_samples']) {
      _bloodPressure.add(BloodPressure(
          pressure['systolic_bp'], pressure['diastolic_bp'], i++));
    }
    i = 0;
    for (var temp in data[0]['temperature_data']['body_temperature_samples']) {
      _bodyTemp.add(BodyTemp(temp['body_temperature_celsius'].round(), i++));
    }

    // List<int> hydration = [];
    // for (var hydra in data[0]['heart_data']['heart_rate_data']['detailed']
    //     ['hr_samples']) {
    //   hydration.add(hydra['bpm']);
    // }

    return [_heartBeat, _bloodSugar, _bloodPressure, _bodyTemp];
  }
}

// fetch from daily
class DataFetch2 {
  Future<List> getData() async {
    final jsondata = await rootBundle.rootBundle.loadString('data/daily.json');

    Map<String, dynamic> list = json.decode(jsondata);
    int dailySteps = list['data'][0]['distance_data']['steps'];
    final jsondata2 = await rootBundle.rootBundle.loadString('data/sleep.json');
    Map<String, dynamic> list2 = json.decode(jsondata2);
    int sleep = list2['data'][0]['sleep_durations_data']['other']
            ['duration_in_bed']
        .round();
    return [dailySteps, sleep];
  }
}

class BodyTemp {
  BodyTemp(this.bTemp, this.index);
  final int bTemp;
  final int index;
}

class BloodPressure {
  BloodPressure(this.systolic, this.diastolic, this.index);
  final double systolic;
  final double diastolic;
  final int index;
}

class BloodSugar {
  BloodSugar(this.sugarAmount, this.index);
  final int sugarAmount;
  final int index;
}

class HRTB {
  HRTB(this.heartbeat, this.index);
  final int heartbeat;
  final int index;
}
