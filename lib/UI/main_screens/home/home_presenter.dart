import 'package:covid19/UI/main_screens/home/home.dart';
import 'package:covid19/UI/main_screens/home/home_provider.dart';
import 'package:covid19/models/CovidCasesResponse.dart';
import 'package:dio/dio.dart';

class HomePagePresenter {
  static const String _baseUrl = "https://corona.lmao.ninja/v2/countries/egypt";
  HomeScreen view = HomeScreen();
  final Dio _dio;
  HomePagePresenter({Dio dio}) : _dio = dio ?? Dio();
  Future<CovidCasesResponse> getCovidCases() async {
    final response = await _dio.get(_baseUrl);
    //check response
    if (response.statusCode == 200) {
      print("Request Ok" + response.statusMessage);
      print("Response :: " + response.data.toString());
      view.provider.totalCases =
          CovidCasesResponse.fromJson(response.data).cases.toString();
      print(view.provider.totalCases);
      // return CovidCasesResponse.fromJson(response.data);
    } else {
      print("Request Error" + response.statusMessage);
      return null;
    }
  }
}
