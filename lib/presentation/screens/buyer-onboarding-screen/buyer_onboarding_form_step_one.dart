import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../models/selectable.dart';
import '../../widgets/custom_formbuilder_dropdown.dart';
import '../../widgets/custom_formbuilder_textfield.dart';
import '../../widgets/selection_list_screen/list_screen.dart';

class BuyerOnBoardingStepOne extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const BuyerOnBoardingStepOne({super.key, required this.formKey});
  final bool delete = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        children: [
          // CustomFormBuilderDropDown(
          //   holdVal: true,
          //   name: "location",
          //   labelText: "Location",
          //   child: const ListScreen(
          //     selectableType: City,
          //     type: FormListType.staticList,
          //     title: "Location",
          //   ),
          // ),
          // CustomFormBuilderDropDown(
          //   holdVal: true,
          //   name: "location",
          //   labelText: "Location",
          //   child: const ListScreen(
          //     selectableType: City,
          //     type: FormListType.staticList,
          //     title: "Location",
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomFormBuilderTextField(
              name: "emp_status",
              focusNode: FocusNode(),
              controller: TextEditingController(),
              labelText: "Your Current Employement Status",
              validators: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(),
                FormBuilderValidators.max(25),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomFormBuilderTextField(
                    name: 'ownBusiness',
                    controller: TextEditingController(),
                    labelText: 'Do You Own A Business',
                    validators: (p0) {
                      return null;
                    },
                    readOnly: true,
                  ),
                ),
                Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: delete,
                  onChanged: (bool value) {},
                  //value: state.isAuctioned,
                  // onChanged: ((value) {
                  //   BlocProvider.of<ListingSwitchCubit>(context, listen: false).updateIsAuctioned(isAunctioned: value);
                  // }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
