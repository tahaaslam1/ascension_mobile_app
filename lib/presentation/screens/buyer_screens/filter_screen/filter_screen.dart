import 'package:ascension_mobile_app/business_logic/cubits/filter/filter_cubit.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/filter_screen/local_widgets/custom_chip_dynamic_industry.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/presentation/widgets/formfield_title_with_info.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../models/selectable.dart';
import '../../../widgets/custom_formbuilder_dropdown.dart';
import '../../../widgets/selection_list_screen/list_screen.dart';

class FilterScreen extends StatefulWidget {
  static const String route = 'filter-screen';

  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        showBackButton: true,
        title: 'Filters',
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: FormBuilder(
              key: _formKey,
              child: BlocBuilder<FilterCubit, FilterState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const FormFieldTitleWithInfo(
                        title: "Price Range",
                        isOptional: false,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: CustomFormBuilderTextField(
                                // formKey: _formKey,
                                name: "starting_range",
                                focusNode: FocusNode(),
                                controller: TextEditingController(),
                                labelText: "From",
                                keyboardType: TextInputType.number,
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.numeric(),
                                ])),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: CustomFormBuilderTextField(
                                name: "ending_range",
                                focusNode: FocusNode(),
                                controller: TextEditingController(),
                                keyboardType: TextInputType.number,
                                labelText: "To",
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.numeric(),
                                ])),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomFormBuilderTextField(
                              name: 'isAuctioned',
                              controller: TextEditingController(),
                              labelText: 'Auctioned Listing',
                              validators: (p0) {
                                return null;
                              },
                              readOnly: true,
                            ),
                          ),
                          Switch(
                            activeColor: Theme.of(context).colorScheme.primary,
                            value: state.isAuctioned,
                            onChanged: ((value) {
                              context.read<FilterCubit>().updateIsAuctioned(isAunctioned: value);
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomFormBuilderTextField(
                              name: 'isEstablished',
                              controller: TextEditingController(),
                              labelText: 'Established Listing?',
                              validators: (p0) {
                                return null;
                              },
                              readOnly: true,
                            ),
                          ),
                          Switch(
                            activeColor: Theme.of(context).colorScheme.primary,
                            value: state.isEstablished,
                            onChanged: ((value) {
                              context.read<FilterCubit>().updateIsEstablished(isEstablished: value);
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      CustomFormBuilderDropDown(
                        validators: (p0) {
                          return null;
                        },
                        holdVal: true,
                        name: "city",
                        labelText: "Location",
                        // initialValue: City(label: 'checck'),
                        child: const ListScreen(
                          selectableType: City,
                          type: FormListType.staticList,
                          title: "Location",
                        ),
                      ),
                      const SizedBox(height: 40),
                      const FormFieldTitleWithInfo(
                        title: "Industries",
                        isOptional: false,
                      ),
                      const SizedBox(height: 16),
                      if (state.industries.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: state.industries.map((industry) {
                            return CustomChipDynamicIndustry(
                              name: industry.label,
                              onDelete: () {
                                context.read<FilterCubit>().deleteIndustry(industry);
                              },
                            );
                          }).toList(),
                        ),
                      const SizedBox(height: 16),
                      CustomFormBuilderDropDown(
                        validators: (p0) {
                          return null;
                        },
                        name: "industries2",
                        labelText: "Industry",
                        forIndustries2: true,
                        onIndustry2Add: (industry) {
                          context.read<FilterCubit>().addIndustry(industry);
                        },
                        // initialValue: City(label: 'check'),
                        child: const ListScreen(
                          selectableType: Industry2,
                          type: FormListType.staticList,
                          title: "Industries",
                        ),
                      ),
                      const SizedBox(height: 28),
                      Center(
                        child: CustomElevatedButton(
                          buttonText: 'Apply Filters',
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              Map<String, dynamic> filterData = Map<String, dynamic>.of(_formKey.currentState!.value);
                              logger.i(filterData);

                              final int start = int.tryParse(filterData['starting_range']) ?? 0;
                              final int end = int.tryParse(filterData['ending_range']) ?? 0;

                              if (start > end) {
                                SnackBarService.showGenericErrorSnackBar(context, 'Starting range cannot be greater than ending range');
                              } else {
                                context.read<FilterCubit>().updateFilter(
                                      isAuctioned: state.isAuctioned,
                                      isEstablished: state.isEstablished,
                                      priceRangeStart: start,
                                      priceRangeEnd: end,
                                      industries: state.industries,
                                      city: filterData['city'] == null
                                          ? City.empty
                                          : City(
                                              id: filterData['city'].id,
                                              label: filterData['city'].label,
                                            ),
                                    );
                                context.router.pop();
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 28),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
