import 'package:flutter_test/flutter_test.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/abstracts/a_service_base_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/abstracts/a_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/managers/dio_service_manager.dart';

void main(){
  
  test('Core service test.', () async {
    AServiceManager serviceManager = DioServiceManager();
    Response response = Response();
    await serviceManager.instance?.get("https://jsonplaceholder.typicode.com/todos/1", response, null, null, null);
    
    expect(response.title, isNotNull);

  });
}


//Core service test response model.
class Response extends ServiceBaseModel{
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Response({this.userId, this.id, this.title, this.completed});

  Response.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}