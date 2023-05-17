import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../business_logic/blocs/milestone/milestone_bloc.dart';
import '../../../widgets/custom_formbuilder_textfield.dart';

class EditMilestoneScreen extends StatefulWidget {
  final String buyerId;
  final String sellerId;
  final String milestoneTitle;
  final String listingId;
  final DateTime startDate;
  final DateTime endDate;
  final String milestoneId;

  static const String route = 'edit-milestone-screen';

  const EditMilestoneScreen({super.key, required this.buyerId, required this.sellerId, required this.milestoneTitle, required this.milestoneId, required this.listingId, required this.endDate, required this.startDate});

  @override
  State<EditMilestoneScreen> createState() => _EditMilestoneScreenState();
}

class _EditMilestoneScreenState extends State<EditMilestoneScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _mileStoneController = TextEditingController();

  DateTime? _startDate;

  DateTime? _endDate;

  @override
  void initState() {
    _mileStoneController.text = widget.milestoneTitle;
    _startDate = widget.startDate;
    _endDate = widget.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomAppBarAndBody(
          showBackButton: true,
          title: 'Edit this mielstone',
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
                    controller: _mileStoneController,
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
                            // _stdate = startDate;

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
                            // _edDate = endDate;

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
                            buttonText: 'Update Milestone',
                            isLoading: false, //state.getMileStoneStatus == CreateMileStoneStatus.loading,
                            onPressed: () {
                              if (_mileStoneController.text.isEmpty) {
                                SnackBarService.showGenericErrorSnackBar(context, "Milestone title cannot be empty");
                                return;
                              } else if (_startDate == null) {
                                SnackBarService.showGenericErrorSnackBar(context, "Starting date is required");
                              } else if (_endDate == null) {
                                SnackBarService.showGenericErrorSnackBar(context, "Ending date is required");
                              } else {
                                context.read<MilestoneBloc>().add(
                                      UpdateMilestone(
                                          milestoneId: widget.milestoneId,
                                          milestoneTitle: _mileStoneController.text,
                                          startDate: _startDate!,
                                          endDate: _endDate!,
                                          onComplete: () {
                                            context.read<MilestoneBloc>().add(FetchMilestones(buyerId: widget.buyerId, sellerId: widget.sellerId, listingId: widget.listingId));
                                            SnackBarService.showConfirmationSnackBar(context, "Milestone Updated Successfully");
                                            context.router.pop();
                                          },
                                          onError: () {
                                            SnackBarService.showGenericErrorSnackBar(context);
                                          }), //washroom discord ao mai discord hi hoon tu
                                    );
                              }
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
