import 'package:dio/dio.dart';

class DioHelper{
static Dio? dio ;
static init (){
dio = Dio (
BaseOptions(
  baseUrl:"https://api.themoviedb.org/",
  receiveDataWhenStatusError:  true,
  headers: {
"accept":"application/json"
  }
)
);
}


static Future<Response?> getData({
  required String url ,
  required Map<String , dynamic > query,
})async{
return await dio?.get(url,queryParameters: query,);
}
}