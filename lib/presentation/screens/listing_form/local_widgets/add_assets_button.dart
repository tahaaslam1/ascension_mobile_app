import 'package:ascension_mobile_app/business_logic/cubits/listing_form_assets_button/add_assets_button_cubit.dart';
import 'package:ascension_mobile_app/presentation/screens/listing_form/local_widgets/assets_card.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_view.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class AddAssetsButton extends StatelessWidget {
  final FocusNode focusNode;
  final Function(String) onAdd;
  final Function(String) onDelete;
  final List<String> assets;

  const AddAssetsButton({
    Key? key,
    required this.focusNode,
    required this.onAdd,
    required this.onDelete,
    required this.assets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAssetsButtonCubit>(
      create: (context) => AddAssetsButtonCubit(
        buttonHeight: 54,
        isExpanded: false,
        showContainers: false,
        isEditing: false,
        assets: assets,
        context: context,
      ),
      child: BlocBuilder<AddAssetsButtonCubit, AddAssetsButtonState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<AddAssetsButtonCubit>(context);
          final flowViewContext = FlowView.of(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.assets.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.assets.length,
                      itemBuilder: (context, index) {
                        return AssetsCard(
                          asset: state.assets[index],
                          onDelete: () {
                            cubit.deleteQualification(state.assets[index]);
                            onDelete(state.assets[index]);
                          },
                        );
                      },
                    )
                  ],
                ),

              // ---------------------------------- .>

              // if (state.assets.where((element) => !element.isRequired).isNotEmpty)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Required",
              //         style: Theme.of(context).textTheme.bodyText2?.copyWith(
              //               color: Theme.of(context).colorScheme.onSurfaceVariant,
              //             ),
              //       ),
              //       ListView.builder(
              //         physics: const NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemCount: state.qualifications.length,
              //         itemBuilder: (context, index) {
              //           return !state.qualifications[index].isRequired
              //               ? QualificationCard(
              //                   qualification: state.qualifications[index],
              //                   onDelete: () {
              //                     cubit.deleteQualification(state.qualifications[index]);
              //                     onDelete(state.qualifications[index].toMap());
              //                   },
              //                 )
              //               : const SizedBox();
              //         },
              //       ),
              //     ],
              //   ),
              // if (state.qualifications.where((x) => x.isRequired).isNotEmpty)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const SizedBox(height: 8),
              //       Text("Preferred", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
              //       ListView.builder(
              //         physics: const NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemCount: state.qualifications.length,
              //         itemBuilder: (context, index) {
              //           return state.qualifications[index].isRequired
              //               ? QualificationCard(
              //                   qualification: state.qualifications[index],
              //                   onDelete: () {
              //                     logger.i(cubit.state.qualifications);
              //                     cubit.deleteQualification(state.qualifications[index]);
              //                     onDelete(state.qualifications[index].toMap());
              //                     logger.i(cubit.state.qualifications);
              //                   },
              //                 )
              //               : const SizedBox();
              //         },
              //       ),
              //     ],
              //   ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  if (focusNode.hasFocus) focusNode.unfocus();
                  if (!cubit.state.isExpanded) {
                    cubit.expand();
                    flowViewContext.setIsLoading(true);
                    await Future.delayed(const Duration(milliseconds: 300));
                    flowViewContext.setIsLoading(false);
                    cubit.showContainer();
                  }
                },
                child: AnimatedContainer(
                  decoration: Styles.containerStyle,
                  duration: const Duration(milliseconds: 200),
                  height: state.buttonHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: state.isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: state.isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
                          children: [
                            if (!state.isExpanded)
                              Iconify(
                                Ic.baseline_add_circle_outline,
                                size: 24,
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Add Qualification",
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                        // Offstage(
                        //   offstage: !state.showContainers,
                        //   child: AddQualificationForm(
                        //     state: state,
                        //     onAdd: (map) {
                        //       cubit.addQualification(Qualification.fromMap(map));
                        //       cubit.collapse();
                        //       onAdd(map);
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
