import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/form-page/viewModel/form_page_view_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/design/design_constants.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/theme/project_colors.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/form-page/view/widgets/selection_button_list_widget.dart';

import 'widgets/bottom_back_and_continue_buttons.dart';

class FormPageView extends StatefulWidget {
  const FormPageView({super.key});

  @override
  State<FormPageView> createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  final double containerHeight = 300;

  final FormPageViewModel _viewModel = FormPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizingConstants.horizontalPadding),
          child: Container(
            decoration: BoxDecoration(
              color: ProjectColors.pureWhite,
              borderRadius: BorderRadius.circular(SizingConstants.cardRadius),
              border: DesignConstants.defaultGreyBorder
            ),
            child: SizedBox(
              height: containerHeight,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Observer(builder: (_) {
                      return Text(_viewModel.titleList[_viewModel.currentPageIndex], style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),);
                      })
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child: PageView(
                      onPageChanged: (value) {
                        _viewModel.onPageChanged(value);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _viewModel.pageController,
                      children: [
                        Observer(builder: (_) {
                          return SelectionButtonList(
                            buttonList: _viewModel.ageButtonList,
                            isOrderedList: false,
                          );
                        }),
                        Observer(builder: (_) {
                          return SelectionButtonList(
                            buttonList: _viewModel.spendingHabitsList,
                            isOrderedList: true,
                          );
                        }),
                        Observer(builder: (_) {
                          return SelectionButtonList(
                            buttonList: _viewModel.expectationsList,
                            isOrderedList: true,
                          );
                        }),
                      ],
                    )
                  ),
                  Observer(builder: (_) {
                    return DotsIndicator(
                      dotsCount: _viewModel.titleList.length,
                      position: _viewModel.currentPageIndex,
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    );
                  }),
                  BottomBackAndContinueButtons(viewModel: _viewModel)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}