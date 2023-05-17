// ignore_for_file: must_be_immutable
import 'package:ascension_mobile_app/business_logic/blocs/listing/create_listing_bloc/create_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/listing/edit_listing/edit_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/listing/get_seller_listing/get_seller_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/cubits/listing_form_flow_screen/image_picker_cubit/listing_image_cubit.dart';
import 'package:ascension_mobile_app/business_logic/cubits/listing_form_flow_screen/switch_cubit/listing_switch_cubit.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/edit/edit_listing_form_step_four.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/edit/edit_listing_form_step_one.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/edit/edit_listing_form_step_three.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/edit/edit_listing_form_step_two.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_screen_widgets.dart';
import 'package:ascension_mobile_app/presentation/widgets/flow_view/flow_view.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditListingFormFlowScreen extends StatelessWidget {
  static const String route = 'edit-listing-form-flow-screen';
  final _formKey = GlobalKey<FormBuilderState>();
  final List<String> assets = [];
  final Listing listing;
  EditListingFormFlowScreen({Key? key, required this.listing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditListingBloc(
            listing: listing,
            listingRepository: RepositoryProvider.of<ListingRepository>(context),
          ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<EditListingBloc, EditListingState>(
            listener: (context, state) {
              if (state.updateListingStatus == UpdateListingStatus.error) {
                SnackBarService.showGenericErrorSnackBar(context, AppMessageService.genericErrorMessage);
                FlowView.of(context).close();
              }
            },
            child: FormBuilder(
              key: _formKey,
              child: FlowView(
                steps: [
                  FlowScreen(
                    title: 'Edit Listing',
                    anchor: FlowScreenDefaultAnchor(
                      buttonText: 'Continue',
                      onPressed: (context) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          FlowView.of(context).next();
                        }
                      },
                    ),
                    child: EditListingFormStepOne(
                      formKey: _formKey,
                    ),
                  ),
                  FlowScreen(
                    title: 'Edit Listing',
                    anchor: FlowScreenDefaultAnchor(
                      buttonText: 'Continue',
                      onPressed: (context) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          FlowView.of(context).next();
                        }
                      },
                    ),
                    child: EditListingFormStepTwo(
                      formKey: _formKey,
                    ),
                  ),
                  FlowScreen(
                    title: 'Edit Listing',
                    anchor: FlowScreenDefaultAnchor(
                      buttonText: 'Continue',
                      onPressed: (context) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          FlowView.of(context).next();
                        }
                      },
                    ),
                    child: EditListingFormStepThree(
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
                    title: 'Edit Listing',
                    anchor: BlocBuilder<EditListingBloc, EditListingState>(
                      builder: (context, state) {
                        return FlowScreenDefaultAnchor(
                          buttonText: 'Edit listing',
                          onPressed: (context) {
                            if (_formKey.currentState!.saveAndValidate()) {
                              Map<String, dynamic> listingFormData = Map<String, dynamic>.of(_formKey.currentState!.value);
                              logger.d(listingFormData);

                              listingFormData['isAuctioned'] = state.listing.isAuctioned;
                              listingFormData['isEstablished'] = state.listing.isEstablished;

                              FlowView.of(context).setIsLoading(true);
                              BlocProvider.of<EditListingBloc>(context, listen: false).add(UpdateListing(
                                editFormData: listingFormData,
                                onComplete: () {
                                  BlocProvi
                                  FlowView.of(context).setIsLoading(false);
                                  FlowView.of(context).next();
                                },
                              ));
                              // BlocProvider.of<CreateListingBloc>(context).add(
                              //   CreateListing(
                              //     listingFormData: listingFormData,
                              //     listingImages: imageState.imagesList,
                              //     onComplete: () {
                              //       BlocProvider.of<GetSellerListingBloc>(context).add(FetchSellerListing());

                              //       FlowView.of(context).setIsLoading(false);

                              //       FlowView.of(context).next();
                              //     },
                              //   ),
                              // );
                            }
                          },
                        );
                      },
                    ),
                    child: EditListingFormStepFour(
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
