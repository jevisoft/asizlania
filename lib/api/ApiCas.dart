import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart';

class ApiCas{

static String CHECK_API_KEY="";
  
static Map<String,String> getHeadersApiKey(){
    Map<String,String> headers={"checkkeymobile":CHECK_API_KEY};
    return headers;
  }
static Map<String,String> getHeadersApiKeyPost(){
    Map<String,String> headers={"checkkeymobile":CHECK_API_KEY,
                          "Content-Type":"application/json; charset=UTF-8"};
    
    return headers;
  }  

static Uri getUrlEndPointApi(String path){
  return Uri.parse("${dotenv.env['ENDPOINT_CAS']}$path");
}

 static apiCasGet(String path) async{
     var response=await http.get(getUrlEndPointApi(path),
                headers:getHeadersApiKey());
     return response;
 }

 static apiCasPost(String path,Object body) async{
     var response=await http.post(getUrlEndPointApi(path),
                headers:getHeadersApiKeyPost(),
                body:body);
     return response;
 }


static Future<http.Response> prueba() async{
   return await apiCasGet("/prueba");         
}

static Future<http.Response> vincular(Object body) async{
   return await apiCasPost("/vincular/add",body);            
}

static Future<http.Response> desvincular(Object body) async{
   return await apiCasPost("/mobile/desvinculate",body);         
}

static Future<http.Response> asistencias(Object body) async{
   return await apiCasPost("/mobile/asistencias",body);         
}

static Future<http.Response> checa(Object body) async{
   return await apiCasPost("/mobile/savechecos",body);         
}


}