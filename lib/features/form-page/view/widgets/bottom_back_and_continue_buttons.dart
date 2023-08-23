

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/features/form-page/viewModel/form_page_view_model.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_mvvm/product/constants/theme/project_colors.dart';

class BottomBackAndContinueButtons extends StatelessWidget {
  const BottomBackAndContinueButtons({
    super.key,
    required FormPageViewModel viewModel,
  }) : _viewModel = viewModel;

  final FormPageViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
              horizontal: SizingConstants.horizontalPadding) +
          const EdgeInsets.only(bottom: SizingConstants.verticalPadding),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Observer(builder: (_) {
              return AnimatedSize(
                clipBehavior: Clip.hardEdge,
                duration: const Duration(milliseconds: 200),
                child: _viewModel.isBackButtonVisible
                    ? ElevatedButton(
                        onPressed: _viewModel.goBackClicked,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors.inactiveGrey),
                        child: FittedBox(
                            child: _viewModel.isBackButtonVisible
                                ? const Icon(Icons.chevron_left)
                                : const SizedBox.shrink()),
                      )
                    : const SizedBox.shrink(),
              );
            }),
          ),
          Expanded(
            flex: 4,
            child: Observer(builder: (_) {
              return Padding(
                padding: EdgeInsets.only(
                    left: _viewModel.isBackButtonVisible
                        ? SizingConstants.verticalPadding
                        : 0),
                child: ElevatedButton(
                    onPressed: _viewModel.isContinueButtonActive
                        ? () {
                            _viewModel.continueClicked(context);
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_viewModel.currentPageIndex !=
                                _viewModel.titleList.length - 1
                            ? 'Devam Et'
                            : 'TeklifimGelsin'),
                        const Icon(Icons.chevron_right)
                      ],
                    )),
              );
            }),
          ),
        ],
      ),
    );
  }
}
