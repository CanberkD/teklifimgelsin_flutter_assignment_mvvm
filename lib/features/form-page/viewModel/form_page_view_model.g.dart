// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormPageViewModel on _FormPageViewModelBase, Store {
  late final _$isBackButtonVisibleAtom = Atom(
      name: '_FormPageViewModelBase.isBackButtonVisible', context: context);

  @override
  bool get isBackButtonVisible {
    _$isBackButtonVisibleAtom.reportRead();
    return super.isBackButtonVisible;
  }

  @override
  set isBackButtonVisible(bool value) {
    _$isBackButtonVisibleAtom.reportWrite(value, super.isBackButtonVisible, () {
      super.isBackButtonVisible = value;
    });
  }

  late final _$isContinueButtonActiveAtom = Atom(
      name: '_FormPageViewModelBase.isContinueButtonActive', context: context);

  @override
  bool get isContinueButtonActive {
    _$isContinueButtonActiveAtom.reportRead();
    return super.isContinueButtonActive;
  }

  @override
  set isContinueButtonActive(bool value) {
    _$isContinueButtonActiveAtom
        .reportWrite(value, super.isContinueButtonActive, () {
      super.isContinueButtonActive = value;
    });
  }

  late final _$currentPageIndexAtom =
      Atom(name: '_FormPageViewModelBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$ageButtonListAtom =
      Atom(name: '_FormPageViewModelBase.ageButtonList', context: context);

  @override
  ObservableList<FormButtonModel> get ageButtonList {
    _$ageButtonListAtom.reportRead();
    return super.ageButtonList;
  }

  @override
  set ageButtonList(ObservableList<FormButtonModel> value) {
    _$ageButtonListAtom.reportWrite(value, super.ageButtonList, () {
      super.ageButtonList = value;
    });
  }

  late final _$spendingHabitsListAtom =
      Atom(name: '_FormPageViewModelBase.spendingHabitsList', context: context);

  @override
  ObservableList<FormButtonModel> get spendingHabitsList {
    _$spendingHabitsListAtom.reportRead();
    return super.spendingHabitsList;
  }

  @override
  set spendingHabitsList(ObservableList<FormButtonModel> value) {
    _$spendingHabitsListAtom.reportWrite(value, super.spendingHabitsList, () {
      super.spendingHabitsList = value;
    });
  }

  late final _$spendingHabitsSelectedListAtom = Atom(
      name: '_FormPageViewModelBase.spendingHabitsSelectedList',
      context: context);

  @override
  ObservableList<FormButtonModel> get spendingHabitsSelectedList {
    _$spendingHabitsSelectedListAtom.reportRead();
    return super.spendingHabitsSelectedList;
  }

  @override
  set spendingHabitsSelectedList(ObservableList<FormButtonModel> value) {
    _$spendingHabitsSelectedListAtom
        .reportWrite(value, super.spendingHabitsSelectedList, () {
      super.spendingHabitsSelectedList = value;
    });
  }

  late final _$expectationsListAtom =
      Atom(name: '_FormPageViewModelBase.expectationsList', context: context);

  @override
  ObservableList<FormButtonModel> get expectationsList {
    _$expectationsListAtom.reportRead();
    return super.expectationsList;
  }

  @override
  set expectationsList(ObservableList<FormButtonModel> value) {
    _$expectationsListAtom.reportWrite(value, super.expectationsList, () {
      super.expectationsList = value;
    });
  }

  late final _$expectationsSelectedListAtom = Atom(
      name: '_FormPageViewModelBase.expectationsSelectedList',
      context: context);

  @override
  ObservableList<FormButtonModel> get expectationsSelectedList {
    _$expectationsSelectedListAtom.reportRead();
    return super.expectationsSelectedList;
  }

  @override
  set expectationsSelectedList(ObservableList<FormButtonModel> value) {
    _$expectationsSelectedListAtom
        .reportWrite(value, super.expectationsSelectedList, () {
      super.expectationsSelectedList = value;
    });
  }

  late final _$_FormPageViewModelBaseActionController =
      ActionController(name: '_FormPageViewModelBase', context: context);

  @override
  void changeContinueButtonActiveState() {
    final _$actionInfo = _$_FormPageViewModelBaseActionController.startAction(
        name: '_FormPageViewModelBase.changeContinueButtonActiveState');
    try {
      return super.changeContinueButtonActiveState();
    } finally {
      _$_FormPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAgeButtonList() {
    final _$actionInfo = _$_FormPageViewModelBaseActionController.startAction(
        name: '_FormPageViewModelBase.setAgeButtonList');
    try {
      return super.setAgeButtonList();
    } finally {
      _$_FormPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void spendingHabitsButtonPressed(int index) {
    final _$actionInfo = _$_FormPageViewModelBaseActionController.startAction(
        name: '_FormPageViewModelBase.spendingHabitsButtonPressed');
    try {
      return super.spendingHabitsButtonPressed(index);
    } finally {
      _$_FormPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void expectationsButtonPressed(int index) {
    final _$actionInfo = _$_FormPageViewModelBaseActionController.startAction(
        name: '_FormPageViewModelBase.expectationsButtonPressed');
    try {
      return super.expectationsButtonPressed(index);
    } finally {
      _$_FormPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBackButtonVisible: ${isBackButtonVisible},
isContinueButtonActive: ${isContinueButtonActive},
currentPageIndex: ${currentPageIndex},
ageButtonList: ${ageButtonList},
spendingHabitsList: ${spendingHabitsList},
spendingHabitsSelectedList: ${spendingHabitsSelectedList},
expectationsList: ${expectationsList},
expectationsSelectedList: ${expectationsSelectedList}
    ''';
  }
}
