import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../business_logic/blocs/milestone/bloc/milestone_bloc.dart';
import '../../../../widgets/custom_formbuilder_dropdown.dart';
import '../../../../widgets/custom_formbuilder_textfield.dart';
import '../../../../widgets/selection_list_screen/list_screen.dart';

class EditMilestoneScreen extends StatefulWidget {
  final String buyerId;
  final String sellerId;
  final String milestoneTitle;
  final String listingId;
  final String startDate;
  final String endDate;
  final String milestoneId;

  static const String route = 'edit-milestone-screen';

  EditMilestoneScreen(
      {required this.buyerId,
      required this.sellerId,
      required this.milestoneTitle,
      required this.milestoneId,
      required this.listingId,
      required this.endDate,
      required this.startDate});

  @override
  State<EditMilestoneScreen> createState() => _EditMilestoneScreenState();
}

class _EditMilestoneScreenState extends State<EditMilestoneScreen> {
  final TextEditingController _mileStoneController = TextEditingController();
  DateTime? _stdate;
  DateTime? _edDate;

  final TextEditingController _listingTitleController = TextEditingController();
  final TextEditingController _buyerNameController = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  DateTime? _startDate;

  DateTime? _endDate;

  @override
  void initState() {
    _mileStoneController.text = widget.milestoneTitle;
    _startDate = DateTime.parse(widget.startDate);
    _endDate = DateTime.parse(widget.endDate);
    _stdate = DateTime.parse(widget.startDate);
    _edDate = DateTime.parse(widget.endDate);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        showBackButton: true,
        title: 'Add A New MileStone',
        body: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormBuilderTextField(
                  name: "mile_stone_title",
                  focusNode: FocusNode(),
                  controller: _mileStoneController,
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
                    _startDate != null ? Text('${_startDate!.day}-${_startDate!.month}-${_startDate!.year}') : const SizedBox(),
                    IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true, minTime: DateTime.now(), maxTime: DateTime(2024, 01, 01), onChanged: (date) {}, onConfirm: (startDate) {
                          _stdate = startDate;

                          setState(() {
                            _startDate = startDate;
                          });
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
                    _endDate != null ? Text('${_endDate!.day}-${_endDate!.month}-${_endDate!.year} ') : const SizedBox(),
                    IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        DatePicker.showDatePicker(context, showTitleActions: true, minTime: _stdate, maxTime: DateTime(2024, 01, 01), onChanged: (date) {},
                            onConfirm: (endDate) {
                          _edDate = endDate;

                          setState(() {
                            _endDate = endDate;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: OutlinedButton(
                      child: const Text("Update MileStone"),
                      onPressed: () {
                        context.read<MilestoneBloc>().add(
                              UpdateMilestone(
                                  milestoneId: widget.milestoneId,
                                  milestoneTitle: _mileStoneController.text,
                                  startDate: _stdate!,
                                  endDate: _edDate!,
                                  onComplete: () {
                                    context
                                        .read<MilestoneBloc>()
                                        .add(FetchMilestones(buyerId: widget.buyerId, sellerId: widget.sellerId, listingId: widget.listingId));
                                    context.router.pop();
                                    SnackBarService.showSnackBar(context, "Milestone Updated Successfully", Icon(Icons.check));
                                  }), //washroom discord ao mai discord hi hoon tu
                            );
                      },
                    ),
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
