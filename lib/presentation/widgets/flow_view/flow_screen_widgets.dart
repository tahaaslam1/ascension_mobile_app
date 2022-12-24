import 'package:ascension_mobile_app/business_logic/cubits/flow_view/flow_view_cubit.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  const FlowProgressBar({Key? key, required this.totalSteps, required this.currentStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: LinearProgressIndicator(
        value: getCurrentStepValue(),
        minHeight: 8,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }

  double getCurrentStepValue() => currentStep / totalSteps;
}

class FlowScreenAppBar extends StatelessWidget {
  const FlowScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlowViewCubit flowViewCubit = BlocProvider.of<FlowViewCubit>(context);
    return BlocBuilder<FlowViewCubit, FlowViewState>(
        bloc: flowViewCubit,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (state.currentStep > 1)
                BackButton(
                  onPressed: () {
                    flowViewCubit.back();
                  },
                )
              else
                IconButton(
                  onPressed: () {
                    flowViewCubit.back();
                  },
                  icon: const Icon(Icons.close),
                ),
              Flexible(
                child: FlowProgressBar(
                  totalSteps: state.totalSteps,
                  currentStep: state.currentStep,
                ),
              ),
            ],
          );
        });
  }
}

class FlowScreenTitle extends StatelessWidget {
  final String title;
  const FlowScreenTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class FlowScreeStepCount extends StatelessWidget {
  const FlowScreeStepCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowViewCubit, FlowViewState>(
      builder: (context, state) {
        return Text('STEP ${state.currentStep} OF ${state.totalSteps}', style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).colorScheme.onSurface));
      },
    );
  }
}

class FlowScreenDefaultAnchor extends StatelessWidget {
  final String buttonText;
  final void Function(BuildContext) onPressed;
  final bool isOutlined;
  const FlowScreenDefaultAnchor({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlowViewCubit flowViewCubit = BlocProvider.of<FlowViewCubit>(context, listen: true);
    return isOutlined
        ? CustomOutlinedButton(
            onPressed: () => onPressed(context),
            buttonText: buttonText,
            isLoading: flowViewCubit.state.isLoading,
          )
        : CustomElevatedButton(
            onPressed: () => onPressed(context),
            buttonText: buttonText,
            isLoading: flowViewCubit.state.isLoading,
          );
  }
}
