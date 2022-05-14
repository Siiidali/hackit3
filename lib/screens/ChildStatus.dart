import 'package:flutter/material.dart';
import 'package:hackit3/data/data_fetch.dart';
import 'package:hackit3/widgets/stat_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChildStatus extends StatefulWidget {
  const ChildStatus({Key? key}) : super(key: key);


  @override
  State<ChildStatus> createState() => _ChildStatusState();
}

class _ChildStatusState extends State<ChildStatus> {
  final DataFetch data = DataFetch();
  final DataFetch2 data2 = DataFetch2();
  // late List<HRTB> heartbeats;
  List<HRTB> heartbeats = [HRTB(1, 2)];
  List<BloodSugar> bloodSugars = [BloodSugar(1, 2)];
  List<BloodPressure> bloodPressures = [BloodPressure(1, 2, 3)];
  List<BodyTemp> bodyTemps = [BodyTemp(1, 2)];
  int dailySteps = 0;
  int sleepTime = 0;
  Future<void> search() async {
    final response = await data.getData();
    final response2 = await data2.getData();
    setState(() {
      heartbeats = response[0];
      bloodSugars = response[1];
      bloodPressures = response[2];
      bodyTemps = response[3];
      dailySteps = response2[0];
      sleepTime = response2[1];
    });
  }

  @override
  void initState() {
    super.initState();
    search();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffFFFDF7),
          padding: const EdgeInsets.only(bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Color(0xff8ABFCB),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Amine",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Manage Cloud",
                        style: TextStyle(
                            color: Color(0xff8ABFCB),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 229, 228),
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                    ),
                    Text("PATACH is dangerously hot"),
                    Text("Just now"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 229, 228),
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                    ),
                    Text("PATACH is dangerously hot"),
                    Text("Just now"),
                  ],
                ),
              ),
              Row(
                children: [
                  StateCard(
                    image: "assets/bloodPressure.png",
                    name: "Blood \nPressure",
                    mesurement1: bloodPressures[0].systolic.round().toString(),
                    mesurement2: "/" +
                        bloodPressures[0].diastolic.round().toString() +
                        "mmgh",
                    status: "norma",
                    color: Color(0xffD0FBFF),
                    sfCartesianChart: SfCartesianChart(
                      // hide axis
                      primaryXAxis: NumericAxis(
                        isVisible: false,
                      ),

                      primaryYAxis: NumericAxis(
                        isVisible: false,
                      ),
                      series: <SplineSeries>[
                        SplineSeries<BloodPressure, int>(
                            dataSource: bloodPressures,
                            xValueMapper: (BloodPressure bloodPressure, _) =>
                                bloodPressure.index,
                            yValueMapper: (BloodPressure bloodPressure, _) =>
                                bloodPressure.systolic,
                            color: Color(0xffD0FBFF),
                            width: 3,
                            opacity: 1,
                            splineType: SplineType.natural,
                            cardinalSplineTension: 1)
                      ],
                    ),
                  ),
                  StateCard(
                    image: "assets/heartBeat.png",
                    name: "Heart \nRate",
                    mesurement1: heartbeats[0].heartbeat.round().toString(),
                    mesurement2: "bpm",
                    status: "norma",
                    color: Color.fromARGB(59, 252, 77, 77),
                    sfCartesianChart: SfCartesianChart(
                      // hide axis
                      primaryXAxis: NumericAxis(
                        isVisible: false,
                      ),

                      primaryYAxis: NumericAxis(
                        isVisible: false,
                      ),
                      series: <SplineSeries>[
                        SplineSeries<HRTB, int>(
                            dataSource: heartbeats,
                            xValueMapper: (HRTB heartBeat, _) =>
                                heartBeat.index,
                            yValueMapper: (HRTB heartBeat, _) =>
                                heartBeat.heartbeat,
                            color: Color.fromARGB(59, 252, 77, 77),
                            width: 3,
                            opacity: 1,
                            splineType: SplineType.natural,
                            cardinalSplineTension: 1)
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  StateCard(
                    image: "assets/bloodSugar.png",
                    name: "Body \nTemperature",
                    mesurement1: bodyTemps[0].bTemp.round().toString(),
                    mesurement2: "mg / dl",
                    status: "norma",
                    color: Color(0xffFFEAEA),
                    sfCartesianChart: SfCartesianChart(
                      // hide axis
                      primaryXAxis: NumericAxis(
                        isVisible: false,
                      ),

                      primaryYAxis: NumericAxis(
                        isVisible: false,
                      ),
                      series: <SplineSeries>[
                        SplineSeries<BodyTemp, int>(
                            dataSource: bodyTemps,
                            xValueMapper: (BodyTemp bodyTemp, _) =>
                                bodyTemp.index,
                            yValueMapper: (BodyTemp bodyTemp, _) =>
                                bodyTemp.bTemp,
                            color: Color(0xffFFEAEA),
                            width: 3,
                            opacity: 1,
                            splineType: SplineType.natural,
                            cardinalSplineTension: 1)
                      ],
                    ),
                  ),
                  StateCard(
                    image: "assets/bloodSugar.png",
                    name: "Blood \nSugar",
                    mesurement1: bloodSugars[0].sugarAmount.round().toString(),
                    mesurement2: "mg / dl",
                    status: "norma",
                    color: Color(0xffF8DEBD),
                    sfCartesianChart: SfCartesianChart(
                      // hide axis
                      primaryXAxis: NumericAxis(
                        isVisible: false,
                      ),

                      primaryYAxis: NumericAxis(
                        isVisible: false,
                      ),
                      series: <SplineSeries>[
                        SplineSeries<BloodSugar, int>(
                            // name: 'Sales',
                            dataSource: bloodSugars,
                            xValueMapper: (BloodSugar bloodSugar, _) =>
                                bloodSugar.index,
                            yValueMapper: (BloodSugar bloodSugar, _) =>
                                bloodSugar.sugarAmount,
                            // dataLabelSettings: DataLabelSettings(isVisible: true),
                            // enableTooltip: true,
                            color: Color(0xffF8DEBD),
                            width: 3,
                            opacity: 1,
                            splineType: SplineType.natural,
                            cardinalSplineTension: 1)
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thursday, 25 June 2020",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/foot.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dailySteps.toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Daily Steps",
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold ,color:Color(0x450A2342), ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Image(image: AssetImage("assets/graph.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.black,
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image(image: AssetImage("assets/sleep.png")),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sleepTime > 60
                                    ? (sleepTime / 60).round().toString() + "H"
                                    : sleepTime.toString() + " Min",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Sleep Time",
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold,
                                    color: Color(0x650A2342)),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Image(image: AssetImage("assets/graph.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.black,
                          )
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
