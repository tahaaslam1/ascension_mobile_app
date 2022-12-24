import 'package:ascension_mobile_app/business_logic/cubits/flow_view/flow_view_cubit.dart';
import 'package:ascension_mobile_app/presentation/widgets/anchored_single_child_scroll_view.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen_widgets.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef FlowBuilder = Widget Function(BuildContext, FlowViewState);

class FlowScreen extends StatelessWidget {
  final FlowBuilder builder;
  FlowScreen.custom({Key? key, required Widget child}) : builder=_defaultBuilder(child),super(key: key);
  FlowScreen({
    Key? key,
    required Widget child,
    String? title,
    Widget? anchor,
    EdgeInsets childPadding = const EdgeInsets.symmetric(horizontal: 20),
    EdgeInsets anchorPadding = const EdgeInsets.all(20),
  })  : builder = _defaultSteppedViewBuilder(child, title, anchor),
        super(key: key);

  static FlowBuilder _defaultBuilder(Widget child) {
    return (context, state) => child;
  }

  static FlowBuilder _defaultSteppedViewBuilder(Widget child, String? title, Widget? anchor) {
    return (BuildContext context, FlowViewState state) {
      return AnchoredSingleChildScrollView(
        childPadding: const EdgeInsets.symmetric(horizontal: 20),
        anchorPadding: const EdgeInsets.all(20),
        anchorElevation: Styles.elevation2,
        anchor: anchor,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FlowScreenAppBar(),
                const SizedBox(height: 12),
                const FlowScreeStepCount(),
                if (title != null) ...[
                  const SizedBox(height: 8),
                  FlowScreenTitle(title: title),
                ],
                if (state.currentStep <= state.totalSteps)
                  Flexible(
                    child: child,
                  ),
              ],
            ),
          ],
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowViewCubit, FlowViewState>(
      bloc: BlocProvider.of<FlowViewCubit>(context),
      builder: builder,
    );
  }
}
