import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherWithLocation();
  }

  void getWeatherWithLocation() async{
    var data= await WeatherModel().getWeatherWithLocation();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(weatherData: data);
      },
      ),
    );
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
          ),
      ),
    );
  }
}
