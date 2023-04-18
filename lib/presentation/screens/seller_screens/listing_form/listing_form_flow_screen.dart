// ignore_for_file: must_be_immutable
import 'package:ascension_mobile_app/business_logic/blocs/listing/create_listing_bloc/create_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/cubits/listing_form_flow_screen/image_picker_cubit/listing_image_cubit.dart';
import 'package:ascension_mobile_app/business_logic/cubits/listing_form_flow_screen/switch_cubit/listing_switch_cubit.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/listing_form_step_five.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/listing_form_step_four.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/listing_form_step_one.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/listing_form_step_three.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/listing_form_step_two.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen_widgets.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_view.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ListingFormFlowScreen extends StatelessWidget {
  static const String route = 'listing-form-flow-screen';
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> assets = [];
  ListingFormFlowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateListingBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
            listingRepository: RepositoryProvider.of<ListingRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ListingSwitchCubit(),
        ),
        BlocProvider(
          create: (context) => ListingImageCubit(),
        ),
      ],
      child: BlocListener<CreateListingBloc, CreateListingState>(
        listener: (context, state) {
          if (state is CreateListingFormError) {
            SnackBarService.showGenericErrorSnackBar(context, AppMessageService.genericErrorMessage);
            FlowView.of(context).close();
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: FormBuilder(
              key: _formKey,
              child: FlowView(
                steps: [
                  FlowScreen(
                    title: 'Create a New Listing',
                    anchor: FlowScreenDefaultAnchor(
                      buttonText: 'Continue',
                      onPressed: (context) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          FlowView.of(context).next();
                        }
                      },
                    ),
                    child: ListingFormStepOne(
                      formKey: _formKey,
                    ),
                  ),
                  FlowScreen(
                    title: 'Create a New Listing',
                    anchor: FlowScreenDefaultAnchor(
                      buttonText: 'Continue',
                      onPressed: (context) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          FlowView.of(context).next();
                        }
                      },
                    ),
                    child: ListingFormStepTwo(
                      formKey: _formKey,
                    ),
                  ),
                  FlowScreen(
                    title: 'Create a New Listing',
                    anchor: FlowScreenDefaultAnchor(
                      buttonText: 'Continue',
                      onPressed: (context) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          FlowView.of(context).next();
                        }
                      },
                    ),
                    child: ListingFormStepThree(
                      formKey: _formKey,
                    ),
                  ),
                  // FlowScreen(
                  //   title: 'Create a New Listing',
                  //   anchor: FlowScreenDefaultAnchor(
                  //     buttonText: 'Continue',
                  //     onPressed: (context) {
                  //       if (_formKey.currentState!.saveAndValidate()) {
                  //         FlowView.of(context).next();
                  //       }
                  //     },
                  //   ), //TODO : if time then add this..
                  //   child: ListingFormStepFive(
                  //     formKey: _formKey,
                  //     assets: assets,
                  //     onAdd: (asset) {
                  //       if (!assets.contains(asset)) {
                  //         assets.add(asset);
                  //       }
                  //     },
                  //     onDelete: (asset) {
                  //       if (assets.contains(asset)) {
                  //         assets.removeWhere((element) => element == asset);
                  //       }
                  //     },
                  //   ),
                  // ),
                  FlowScreen(
                    title: 'Create a New Listing',
                    anchor: BlocBuilder<ListingImageCubit, ListingImageState>(
                      builder: (context, imageState) {
                        return BlocBuilder<ListingSwitchCubit, ListingSwitchState>(
                          builder: (context, switchState) {
                            return FlowScreenDefaultAnchor(
                              buttonText: 'Continue',
                              onPressed: (context) {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  Map<String, dynamic> listingFormData = Map<String, dynamic>.of(_formKey.currentState!.value);

                                  listingFormData['isAuctioned'] = switchState.isAuctioned;
                                  listingFormData['isEstablished'] = switchState.isEstablished;

                                  FlowView.of(context).setIsLoading(true);
                                  BlocProvider.of<CreateListingBloc>(context).add(
                                    CreateListing(
                                      listingFormData: listingFormData,
                                      listingImages: imageState.imagesList,
                                      onComplete: () {
                                        FlowView.of(context).setIsLoading(false);
                                        FlowView.of(context).next();
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                    child: ListingFormStepFour(
                      formKey: _formKey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
