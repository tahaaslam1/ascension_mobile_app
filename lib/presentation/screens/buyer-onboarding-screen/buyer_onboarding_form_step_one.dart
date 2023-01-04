import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../models/selectable.dart';
import '../../widgets/custom_formbuilder_dropdown.dart';
import '../../widgets/custom_formbuilder_textfield.dart';
import '../../widgets/selection_list_screen/list_screen.dart';
import '../filter_screen/filter_screen.dart';

class BuyerOnBoardingStepOne extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;

  const BuyerOnBoardingStepOne({super.key, required this.formKey});

  @override
  State<BuyerOnBoardingStepOne> createState() => _BuyerOnBoardingStepOneState();
}

class _BuyerOnBoardingStepOneState extends State<BuyerOnBoardingStepOne> {
  final bool delete = false;
  String dropdownvalue = 'Karachi';
  var cities = [
    "Karachi",
    "Lahore",
    "Faisalabad",
    "Rawalpindi",
    "Gujranwala",
    "Peshawar",
    "Multan",
    "Hyderabad",
    "Islamabad",
    "Quetta",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Location",
                    style: Theme.of(context).textTheme.headline6),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: cities.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Interests:",
                style: Theme.of(context).textTheme.headline6),
          ),
          SizedBox(
            height: 200,
            child: GridView.count(
              primary: false,
              // padding: const EdgeInsets.all(20),
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 5,
              children: [
                IndustryTag(industry: "Fashion"),
                IndustryTag(industry: "Retail"),
                IndustryTag(industry: "Factory"),
                IndustryTag(industry: "Real State"),
                IndustryTag(industry: "Logistics"),
                IndustryTag(industry: "Food"),
                IndustryTag(industry: "Sports"),
                IndustryTag(industry: "Start Up"),
                IndustryTag(industry: "Sports"),
                IndustryTag(industry: "Start Up"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
