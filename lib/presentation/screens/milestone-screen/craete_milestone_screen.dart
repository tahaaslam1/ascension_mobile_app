import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../widgets/custom_formbuilder_dropdown.dart';
import '../../widgets/custom_formbuilder_textfield.dart';
import '../../widgets/selection_list_screen/list_screen.dart';

class CreateMileStoneScreen extends StatelessWidget {
  final TextEditingController _mileStoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  CreateMileStoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        showBackButton: true,
        title: 'Add A New MileStone',
        body: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              // CustomFormBuilderDropDown(
              //   holdVal: true,
              //   name: "Your Lisitng",
              //   labelText: "Your Listing",
              //   child: const ListScreen(
              //    selectableType: City,
              //     type: FormListType.staticList,
              //     title: "Location",
              //   ),
              // )
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormBuilderTextField(
                  name: "listing_title",
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  labelText: "Title of Listing Stone",
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.max(25),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormBuilderTextField(
                  name: "mile_stone_title",
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  labelText: "Title of Mile Stone",
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.max(25),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Starting Date:",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2023, 01, 01),
                            maxTime: DateTime(2024, 01, 01), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Ending Date:",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2023, 01, 01),
                            maxTime: DateTime(2024, 01, 01), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    child: Text("Create MileStone"),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
