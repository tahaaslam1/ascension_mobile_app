import 'package:ascension_mobile_app/models/milestone.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_outlined_button.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../business_logic/blocs/milestone/milestone_bloc.dart';
import '../../../widgets/custom_formbuilder_textfield.dart';

class CreateMileStoneScreen extends StatefulWidget {
  static const String route = 'create-milestone-screen';

  final String buyerId;
  final String sellerId;
  final String buyerName;
  final String listingTitle;
  final String listingId;

  const CreateMileStoneScreen({super.key, required this.buyerId, required this.sellerId, required this.buyerName, required this.listingTitle, required this.listingId});

  @override
  State<CreateMileStoneScreen> createState() => _CreateMileStoneScreenState();
}

class _CreateMileStoneScreenState extends State<CreateMileStoneScreen> {
  // final TextEditingController _mileStoneController = TextEditingController();

  DateTime? _startDate;

  DateTime? _endDate;

  final _formKey = GlobalKey<FormBuilderState>();

  // DateTime? _startDate;

  // DateTime? _endDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomAppBarAndBody(
          showBackButton: true,
          title: 'New MileStone',
          body: FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomFormBuilderTextField(
                    name: "mile_stone_title",
                    focusNode: FocusNode(),
                    controller: TextEditingController(),
                    labelText: "Title of Mile Stone",
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(25),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Starting Date:",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      _startDate != null ? Text('${_startDate!.day}-${_startDate!.month}-${_startDate!.year}') : const SizedBox(),
                      IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () {
                          DatePicker.showDatePicker(context, showTitleActions: true, minTime: DateTime.now(), maxTime: DateTime(2024, 01, 01), onChanged: (date) {}, onConfirm: (startDate) {
                            setState(() {
                              _startDate = startDate;
                            });
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Ending Date:",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      _endDate != null ? Text('${_endDate!.day}-${_endDate!.month}-${_endDate!.year} ') : const SizedBox(),
                      IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () {
                          DatePicker.showDatePicker(context, showTitleActions: true, minTime: _startDate, maxTime: DateTime(2024, 01, 01), onChanged: (date) {}, onConfirm: (endDate) {
                            setState(() {
                              _endDate = endDate;
                            });
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: BlocBuilder<MilestoneBloc, MilestoneState>(
                        builder: (context, state) {
                          return CustomElevatedButton(
                            buttonText: 'Create Milestone',
                            isLoading: state.getMileStoneStatus == CreateMileStoneStatus.creating,
                            onPressed: () {
                              if (_formKey.currentState!.saveAndValidate()) {
                                Map<String, dynamic> data = Map<String, dynamic>.of(_formKey.currentState!.value);

                                final mileStoneTitle = data['mile_stone_title'];

                                if (_startDate == null) {
                                  SnackBarService.showGenericErrorSnackBar(context, 'Starting date is required');
                                  return;
                                } else if (_endDate == null) {
                                  SnackBarService.showGenericErrorSnackBar(context, 'Ending date is required');
                                  return;
                                } else {
                                  BlocProvider.of<MilestoneBloc>(context, listen: false).add(CreateMilestoneEvent(
                                    mileStone: Milestone(
                                      milestoneTitle: mileStoneTitle,
                                      buyerId: widget.buyerId,
                                      sellerId: widget.sellerId,
                                      listingId: widget.listingId,
                                      buyerName: widget.buyerName,
                                      startDate: _startDate!,
                                      endDate: _endDate!,
                                    ),
                                    onCompleted: () {
                                      SnackBarService.showConfirmationSnackBar(context, "Milestone Created Successfully");
                                      context.router.pop();
                                    },
                                    onError: () {
                                      SnackBarService.showGenericErrorSnackBar(context);
                                      context.router.pop();
                                    },
                                  ));
                                }
                              }
                              // if (_mileStoneController.text.isEmpty) {
                              //   SnackBarService.showGenericErrorSnackBar(context, 'Milestone title is required');
                              // } else if (_stdate == null) {
                              // } else if (_edDate == null) {
                              // } else {
                              //   _milestoneBloc.add(
                              //     CreateMilestoneEvent(
                              //       buyerName: widget.buyerName,
                              //       mileStoneTitle: _mileStoneController.text.trim(),
                              //       startDate: _stdate!,
                              //       endDate: _edDate!,
                              //       listingTitle: widget.listingTitle,
                              //       buyerId: widget.buyerId,
                              //       sellerId: widget.sellerId,
                              //       listingId: widget.listingId,
                              //       onCompleted: () {
                              //         _milestoneBloc.add(FetchMilestones(buyerId: widget.buyerId, sellerId: widget.sellerId, listingId: widget.listingId));
                              //         context.router.pop();
                              //         SnackBarService.showConfirmationSnackBar(context, "Milestone Created Successfully ");
                              //       },
                              //     ),
                              //   );
                              // }
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
