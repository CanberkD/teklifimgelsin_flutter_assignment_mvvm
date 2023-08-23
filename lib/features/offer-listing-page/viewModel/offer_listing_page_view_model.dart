import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/abstracts/a_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/core/service/managers/dio_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/extended-card-page/view/extended_card_page_view.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/form-page/model/form_button_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/model/form_result_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/model/get_offers_post_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/model/get_offers_response_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/enums/button_list_items.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/service/service_paths.dart';
part 'offer_listing_page_view_model.g.dart';

class OfferListingPageViewModel extends _OfferListingPageViewModelBase with _$OfferListingPageViewModel{
  OfferListingPageViewModel(FormResultModel formResultModel){
    setOfferList(formResultModel);
    //Get result and show.

  }
}

abstract class _OfferListingPageViewModelBase with Store {

  @observable
  bool isLoading = false;

  List<Offer> offerList = List.empty(growable: true);

  @action
  Future<void> setOfferList(FormResultModel formResultModel) async {
    
    //Update page loading state.
    isLoading = true;
    
    //Create post and response model objects.
    GetOffersPostModel getOffersPostModel = getPostModelWithFormResultModel(formResultModel);
    GetOffersResponseModel getOffersResponseModel = GetOffersResponseModel();
    
    //Create serviceManager.
    AServiceManager serviceManager = DioServiceManager();

    //Send post request with post model and add results response model.
    await serviceManager.instance?.post(ServicePaths().getCardOffers(), getOffersPostModel, getOffersResponseModel, null, null, null);
    
    //Add sponsoredOffers first, then activeOffers. PassiveOffers in the response model but not used. It can be used if desired. 
    offerList = getOffersResponseModel.sponsoredOffers ?? [];
    offerList.addAll(getOffersResponseModel.activeOffers ?? []);

    //Update page loading state.
    isLoading = false;

  }
  
  //Using the variable of FormResultModel that comes from the formPage, creates the postModel to be used post request.
  GetOffersPostModel getPostModelWithFormResultModel(FormResultModel resultModel){

    GetOffersPostModel getOffersPostModel = GetOffersPostModel();

    //Generates fibonacciLists with startIndex and listLenght.
    List<int> fibonacciForSpendingHabits = generateReverseFibonacciList(1, resultModel.spendingHabitsList.length);
    List<int> fibonacciForExpectations= generateReverseFibonacciList(1, resultModel.expectationsList.length);

    //Set the age.
    getOffersPostModel.age = resultModel.age; //Came with +1 from form page.

    //Setting SpendingHabits coefficients.
    for(FormButtonModel item in resultModel.spendingHabitsList){

      //Setting coefficient with sequence number. If sequence number equals to 0 this means not selected. 
      int coefficient = item.sequence == 0 ? 1 : fibonacciForSpendingHabits[item.sequence-1]; //item.sequence came with + 1 for user view. Decrease it because of that.
      
      if(item.id == ButtonListItems.travel){
        getOffersPostModel.travel = coefficient; 
      }
      else if(item.id == ButtonListItems.onlineShopping){
        getOffersPostModel.onlineShopping = coefficient;
      }
      else if(item.id == ButtonListItems.dining){
        getOffersPostModel.dining = coefficient;
      }
      else if(item.id == ButtonListItems.grocery){
        getOffersPostModel.grocery = coefficient;
      }
      else if(item.id == ButtonListItems.bill){
        getOffersPostModel.bill = coefficient;
      }
      else if(item.id == ButtonListItems.other){
        getOffersPostModel.other = coefficient;
      }

    }

    //Setting Expectations coefficients.
    for(FormButtonModel item in resultModel.expectationsList){

      //Setting coefficient with sequence number. If sequence number equals to 0 this means not selected. 
      int coefficient = item.sequence == 0 ? 1 : fibonacciForExpectations[item.sequence-1]; //item.sequence came with + 1 for user view. Decrease it because of that.
      
      if(item.id == ButtonListItems.point){
        getOffersPostModel.point = coefficient; 
      }
      else if(item.id == ButtonListItems.mile){
        getOffersPostModel.mile = coefficient;
      }
      else if(item.id == ButtonListItems.saleCashback){
        getOffersPostModel.saleCashback = coefficient;
      }
      else if(item.id == ButtonListItems.installment){
        getOffersPostModel.installment = coefficient;
      }

    }
    
    return getOffersPostModel;

  }

  void cardContainerClicked(Offer offer, int index, BuildContext context){
    // OnTap function for route to the ExtendedCardPageView
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) =>
          ExtendedCardPageView(item: offer, index: index,),
      ),
    );
  }
  

  //Reversed fibonacci list generator with startIndex and desired length of list.
  List<int> generateReverseFibonacciList(int startIndex, int length) {
  
    List<int> fibonacciList = [];

    if (length <= 0) {
      return fibonacciList;
    }

    int start = startIndex; 
    int current = startIndex+1;
    int temp;

    for (int i = 0; i < length; i++) {
      fibonacciList.add(start);
      temp = start + current;
      start = current;
      current = temp;
    }

    //Convert fibonacci list to reversed fibonacci list and then return it. 
    return fibonacciList.reversed.toList();
  }
}