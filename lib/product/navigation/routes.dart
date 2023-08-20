import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/form-page/view/form_page_view.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/offer-listing-page/view/offer_listing_page_view.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/navigation/route_names.dart';

class NavigationRoutes{
  final Map<String, Widget Function(BuildContext)> routes = {
    ProjectRoutes.formPage.name : (context) => const FormPageView(),        
    ProjectRoutes.offerListingPage.name : (context) => const OfferListingPageView(),        
  };
}