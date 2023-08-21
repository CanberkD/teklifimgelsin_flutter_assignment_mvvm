import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/model/form_result_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/view/widgets/offer_list_item.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/viewModel/offer_listing_page_view_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/enums/arguments.dart';

class OfferListingPageView extends StatefulWidget {
  const OfferListingPageView({super.key});

  @override
  State<OfferListingPageView> createState() => _OfferListingPageViewState();
}

class _OfferListingPageViewState extends State<OfferListingPageView> {
  OfferListingPageViewModel? _viewModel;

  var arguments;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {

        arguments = ModalRoute.of(context)!.settings.arguments;

        FormResultModel formResultModel =
            arguments[Arguments.formResultModel];
        _viewModel = OfferListingPageViewModel(formResultModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Container(
            child: _viewModel == null ? const Center(child: CircularProgressIndicator(),) : _viewModel!.isLoading ? const Center(child: CircularProgressIndicator(),): 
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _viewModel!.offerList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: SizingConstants.horizontalPadding, vertical: SizingConstants.verticalPadding),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(SizingConstants.cardRadius),
                    onTap: (){_viewModel!.cardContainerClicked(_viewModel!.offerList[index], index, context);},
                    child: Hero(
                      tag: index,
                      child: Material(
                        type: MaterialType.transparency,
                        child: OfferListItem(
                          imgUrl: _viewModel!.offerList[index].imgUrl ?? '',
                          cardName: _viewModel!.offerList[index].cardName ?? '',
                          isSponsored: _viewModel!.offerList[index].sponsored == 0 ? false : true,
                          rating: _viewModel!.offerList[index].rating ?? 0,
                          annualPayment: _viewModel!.offerList[index].annualPayment?.toInt() ?? 0,
                          cashAdvanceInterest: _viewModel!.offerList[index].cashAdvanceInterest?.toDouble() ?? 0,
                          overdueInterest: _viewModel!.offerList[index].overdueInterest?.toDouble() ?? 0,
                          applyUrl: _viewModel!.offerList[index].url ?? '',
                          shoppingInterest: _viewModel!.offerList[index].shoppingInterest?.toDouble() ?? 0,
                          isExtendedCardView: false,
                        ),
                      ),
                    ),
                  ),
                );
              }, 
            )
        );
      })
    );
  }
}