import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/form-page/model/form_button_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/model/form_result_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/enums/arguments.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/enums/button_list_items.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/navigation/route_names.dart';
part 'form_page_view_model.g.dart';

class FormPageViewModel extends _FormPageViewModelBase with _$FormPageViewModel{
  FormPageViewModel(){
    
    setFormTitles();
    
    setAgeButtonList();
    setSpendingHabitsButtonList();
    setExpectationsButtonList();

  }
}

abstract class _FormPageViewModelBase with Store {

  //FROM PAGE GENERAL----------

  PageController pageController = PageController();
  
  List<String> titleList = List.empty(growable: true);

  @observable
  bool isBackButtonVisible = false;

  @observable
  bool isContinueButtonActive = false;

  @observable
  int currentPageIndex = 0;

  void continueClicked(BuildContext? context) {
    if(currentPageIndex != titleList.length - 1){ //Form is not completed.
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
    else{//Form completed.
      if(context != null){
        formCompleted(context);
      }
    }
  }

  @action
  void changeContinueButtonActiveState(){
    if(currentPageIndex == 0){
      isContinueButtonActive = selectedAgeIndex != -1 ? true : false;     
    }
    else if(currentPageIndex == 1){
      isContinueButtonActive = spendingHabitsSelectedList.isNotEmpty ? true : false;
    }
    else{
      isContinueButtonActive = expectationsSelectedList.isNotEmpty ? true : false;
    }
  }

  void goBackClicked() async{
    
    await  pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);

  }

  void setFormTitles(){
    //Set form title list. This list can be retrieved with http response if necessary.
    titleList = ["Kaç yaşındasın?", "Harcama alışkanlıkların neler?", "Kredi kartından beklendilerini sırala"];
  }

  void onPageChanged(int index){
    //PageView onchange method.

    currentPageIndex = index;
    
    //If pageViews page is age selection, hide back button.
    if(index == 0){
      isBackButtonVisible = false;
    }
    else{
      isBackButtonVisible = true;
    }

    //Update continue button activity.
    changeContinueButtonActiveState();
  }

  void formCompleted(BuildContext context){
    //TeklifimGelsin
    FormResultModel formResultModel = FormResultModel(
      age: selectedAgeIndex+1, 
      spendingHabitsList: spendingHabitsList,
      expectationsList: expectationsList,
    );
    Navigator.pushNamed(context, ProjectRoutes.offerListingPage.name, arguments: {Arguments.formResultModel: formResultModel});
  }

  //----------FROM PAGE GENERAL
  
  
  //AGE SELECTION----------

  int selectedAgeIndex = -1;

  @observable
  ObservableList<FormButtonModel> ageButtonList = ObservableList.of(List.empty(growable: true));

  @action
  void setAgeButtonList(){

    //Set default button list. This list can be retrieved from the http request if necessary.
    ageButtonList = ObservableList.of(
      [
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '18 ve altı', sequence: 1, onPressed: (){ageButtonPressed(0);}),
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '19 - 25', sequence: 1, onPressed: (){ageButtonPressed(1);}),
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '26 - 35', sequence: 1, onPressed: (){ageButtonPressed(2);}),
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '36 ve üzeri', sequence: 1, onPressed: (){ageButtonPressed(3);}),
      ]
    );

    //If no button has been selected, loop is not necessery. All of them can remain in the false state.
    //If any button is selected, for loop starts. All of them isSelected value equals false except selected one.
    if(selectedAgeIndex != -1){
      for(int i = 0; i < ageButtonList.length; i++){
        ageButtonList[i].isSelected = false;
        if(i == selectedAgeIndex){
          ageButtonList[i].isSelected = true;
        }
      }
    }

  }

  void ageButtonPressed(int index){

    //Change value of isSelected.
    ageButtonList[index].isSelected = !ageButtonList[index].isSelected;

    //If the new value is true, update the selectedIndex with new index. 
    //If the new value is false, update the selectedIndex with -1 also mean not selected.
    if(ageButtonList[index].isSelected){
      selectedAgeIndex = index;
      continueClicked(null);
    }
    else{
      selectedAgeIndex = -1;
    }

    //Set default button list with the new selectedIndex value.
    setAgeButtonList();
  
    //Update continue button activity.
    changeContinueButtonActiveState();
  }

  //----------AGE SELECTION

  //SPENDING HABITS SELECTION----------

  @observable
  ObservableList<FormButtonModel> spendingHabitsList = ObservableList.of(List.empty(growable: true));

  @observable
  ObservableList<FormButtonModel> spendingHabitsSelectedList = ObservableList.of(List.empty(growable: true));
  
  void setSpendingHabitsButtonList(){

    //Set default button list. This list can be retrieved from the http request if necessary.
    spendingHabitsList = ObservableList.of(
      [
        FormButtonModel(id: ButtonListItems.travel, isSelected: false, text: 'Seyahat', sequence: 0, onPressed: (){spendingHabitsButtonPressed(0);}),
        FormButtonModel(id: ButtonListItems.onlineShopping, isSelected: false, text: 'Online Alışveriş', sequence: 0, onPressed: (){spendingHabitsButtonPressed(1);}),
        FormButtonModel(id: ButtonListItems.dining, isSelected: false, text: 'Yeme/İçme', sequence: 0, onPressed: (){spendingHabitsButtonPressed(2);}),
        FormButtonModel(id: ButtonListItems.grocery, isSelected: false, text: 'Gıda/Market', sequence: 0, onPressed: (){spendingHabitsButtonPressed(3);}),
        FormButtonModel(id: ButtonListItems.bill, isSelected: false, text: 'Fatura', sequence: 0, onPressed: (){spendingHabitsButtonPressed(4);}),
        FormButtonModel(id: ButtonListItems.other, isSelected: false, text: 'Diğer', sequence: 0, onPressed: (){spendingHabitsButtonPressed(5);}),
      ]
    );
    
  }
  
  @action
  void spendingHabitsButtonPressed(int index){

    //Change value of isSelected.
    spendingHabitsList[index].isSelected = !spendingHabitsList[index].isSelected;

    if(spendingHabitsList[index].isSelected){
      spendingHabitsSelectedList.add(spendingHabitsList[index]);
      int sequence = spendingHabitsSelectedList.indexOf(spendingHabitsList[index]) + 1;
      spendingHabitsList[index].sequence = sequence;
    }
    else{ //Selection remove
      //Remove the selection from the list of spendingHabitsSelectedList.
      spendingHabitsSelectedList.removeWhere((element) => element == spendingHabitsList[index]);
      //Changing sequence number.
      spendingHabitsList[index].sequence = 0;

      //Reorder the sequence of the chosen ones.
      for(int i = 0; i < spendingHabitsSelectedList.length; i++){
        int sequence = spendingHabitsSelectedList.indexOf(spendingHabitsSelectedList[i]) + 1; //Find the index of the selected item in the list of spendingHabitsSelectedList.
        spendingHabitsList.firstWhere((element) => element == spendingHabitsSelectedList[i]).sequence = sequence; //Set the value.
      }
    }
    
    //Update continue button activity.
    changeContinueButtonActiveState();
    spendingHabitsList = ObservableList.of(spendingHabitsList);
  }

  //----------SPENDING HABITS SELECTION

  //EXPECTATIONS SELECTION----------
  
  @observable
  ObservableList<FormButtonModel> expectationsList = ObservableList.of(List.empty(growable: true));

  @observable
  ObservableList<FormButtonModel> expectationsSelectedList = ObservableList.of(List.empty(growable: true));

  void setExpectationsButtonList(){

    //Set default button list. This list can be retrieved from the http request if necessary.
    expectationsList = ObservableList.of(
      [
        FormButtonModel(id: ButtonListItems.point, isSelected: false, text: 'Puan', sequence: 0, onPressed: (){expectationsButtonPressed(0);}),
        FormButtonModel(id: ButtonListItems.mile, isSelected: false, text: 'Mil', sequence: 0, onPressed: (){expectationsButtonPressed(1);}),
        FormButtonModel(id: ButtonListItems.saleCashback, isSelected: false, text: 'İndirim', sequence: 0, onPressed: (){expectationsButtonPressed(2);}),
        FormButtonModel(id: ButtonListItems.installment, isSelected: false, text: 'Taksit İmkanı', sequence: 0, onPressed: (){expectationsButtonPressed(3);}),
      ]
    );
    
  }
  
  @action
  void expectationsButtonPressed(int index){

    //Change value of isSelected.
    expectationsList[index].isSelected = !expectationsList[index].isSelected;

    //If button selected, add to selectedList and set the sequence number. Sequance number increase +1 beacause of user view. 
    if(expectationsList[index].isSelected){
      expectationsSelectedList.add(expectationsList[index]);
      int sequence = expectationsSelectedList.indexOf(expectationsList[index]) + 1;
      expectationsList[index].sequence = sequence;
    }
    else{ //Selection remove.
      //Remove the selection from the list of expactationsSelectedList.
      expectationsSelectedList.removeWhere((element) => element == expectationsList[index]);
      expectationsList[index].sequence = 0;
      //Reorder the sequence of the chosen ones.
      for(int i = 0; i < expectationsSelectedList.length; i++){
        int sequence = expectationsSelectedList.indexOf(expectationsSelectedList[i]) + 1; //Find the index of the selected item in the list of expactationsSelectedList.
        expectationsList.firstWhere((element) => element == expectationsSelectedList[i]).sequence = sequence; //Set the value.
      }
    }

    //Update continue button activity.
    changeContinueButtonActiveState();
    expectationsList = ObservableList.of(expectationsList);
  }

  //----------EXPECTATIONS SELECTION

}
