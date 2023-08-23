import 'package:flutter_test/flutter_test.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/abstracts/a_service_base_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/abstracts/a_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/managers/dio_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/model/get_offers_post_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/model/get_offers_response_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/service/service_paths.dart';

void main(){
  
  test('Core service test.', () async {
    AServiceManager serviceManager = DioServiceManager();
    Response response = Response();
    await serviceManager.instance?.get("https://jsonplaceholder.typicode.com/todos/1", response, null, null, null);
    
    expect(response.title, isNotNull);

  });

  test('Get credit card offers test.', () async {
    AServiceManager serviceManager = DioServiceManager();

    //Default post model.
    GetOffersPostModel getOffersPostModel = GetOffersPostModel(
      age: 4,
      bill: 8,
      dining: 5,
      grocery: 1,
      installment: 5,
      mile: 2,
      onlineShopping: 3, 
      other: 13, 
      point: 3, 
      saleCashback: 1, 
      travel: 2
    );

    //Response Model
    GetOffersResponseModel getOffersResponseModel = GetOffersResponseModel();

    await serviceManager.instance?.post(ServicePaths().getCardOffers(), getOffersPostModel, getOffersResponseModel, null, null, null);

    expect(getOffersResponseModel.activeOffers?.first.bankId, isNotNull);
   

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