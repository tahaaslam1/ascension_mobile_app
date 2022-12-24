import 'package:ascension_mobile_app/business_logic/cubits/flow_view/flow_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flow_screen.dart';

typedef StepCallback = Function(int currentStep);

class FlowView extends StatelessWidget {
  //A list of steps in sorted order in which they will be displayed
  final List<FlowScreen> steps;


  const FlowView({
    Key? key,
    required this.steps,
  }) : super(key: key);

  static FlowViewCubit of(BuildContext context) => BlocProvider.of<FlowViewCubit>(context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider<FlowViewCubit>(
        create: (_) => FlowViewCubit(currentStep: 1, isLoading: false, totalSteps: steps.length, context: context),
        child: BlocBuilder<FlowViewCubit, FlowViewState>(
          buildWhen: (previous, current) => previous.currentStep != current.currentStep,
          builder: (context, state) {
            return AbsorbPointer(absorbing: state.isLoading, child: steps[state.currentStep - 1].builder(context, state));
          },
        ),
      ),
    );
  }
}
