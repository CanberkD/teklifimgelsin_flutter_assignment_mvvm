// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_listing_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OfferListingPageViewModel on _OfferListingPageViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_OfferListingPageViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$setOfferListAsyncAction = AsyncAction(
      '_OfferListingPageViewModelBase.setOfferList',
      context: context);

  @override
  Future<void> setOfferList(FormResultModel formResultModel) {
    return _$setOfferListAsyncAction
        .run(() => super.setOfferList(formResultModel));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
