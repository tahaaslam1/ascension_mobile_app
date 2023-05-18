import 'package:ascension_mobile_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../business_logic/blocs/biding/bloc/biding_bloc.dart';
import '../../../../logger.dart';
import '../../../../services/snack_bar_service.dart';
import '../../../../styles.dart';
import '../../../widgets/avatar.dart';
import '../../../widgets/custom_formbuilder_textfield.dart';
import '../../single_listing_screen/local_widgets/listing_images_widget.dart';

class PlacingBidScreen extends StatefulWidget {
  final String listingId;
  final String listingTitle;
  final List<String> images;
  final String askingPrice;
  static const String route = 'placing-bid-screen';
  PlacingBidScreen({required this.listingId, required this.images, required this.askingPrice, required this.listingTitle});

  @override
  State<PlacingBidScreen> createState() => _PlacingBidScreenState();
}

class _PlacingBidScreenState extends State<PlacingBidScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController _bids = new TextEditingController();
  late BidingBloc _bidBloc;

  final List<String> imageList = [];
  @override
  void initState() {
    _bidBloc = BlocProvider.of<BidingBloc>(context);
    _bidBloc.add(FetchBidDetailsEvent(listingId: widget.listingId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BidingBloc, BidingState>(
      bloc: _bidBloc,
      builder: (context, state) {
        if (state.status == GetBidingStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == GetBidingStatus.error) {
          return Center(
            child: Text("Something Went Wrong"),
          );
        } else if (state.status == GetBidingStatus.loaded) {
          _bids.text = state.bid.bidValue.toString();
          return Scaffold(
              body: CustomAppBarAndBody(
            title: "Place A Bid",
            showBackButton: true,
            body: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ListingImagesWidget(
                      images: widget.images,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.listingTitle,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text("Bid Starts From : ", style: Theme.of(context).textTheme.headline4),
                          Text("Rs ${widget.askingPrice}", style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 15,
                        child: Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: Styles.elevation3,
                                  ),
                                  child: const Avatar(
                                    radius: 30,
                                    avatarUrl: 'https://picsum.photos/200',
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        Text("Seller : ", style: Theme.of(context).textTheme.headline6),
                                        Text(state.bid.firstName! + state.bid.lastName!, style: Theme.of(context).textTheme.headline6),
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 8.0),
                                  //   child: Row(
                                  //     children: [
                                  //       Text("Phone Number: ", style: Theme.of(context).textTheme.caption),
                                  //       Text(state.bid.sellerPhoneNumber!, style: Theme.of(context).textTheme.caption),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 20,
                        child: Container(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.bid.timeLeft.toString() + " Hrs",
                                      style: TextStyle(color: Colors.green, fontSize: 20),
                                    ),
                                    const Text(
                                      "Time Left",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 2,
                                  height: 60,
                                  color: Colors.grey,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.bid.bidValue.toString(),
                                      style: TextStyle(color: Colors.orange, fontSize: 20),
                                    ),
                                    const Text(
                                      "Higest Bid",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 20,
                        child: Container(
                            height: 120,
                            //  width: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Place Your Bid", style: Theme.of(context).textTheme.headline6),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 450,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: CustomFormBuilderTextField(
                                          name: widget.listingTitle,
                                          keyboardType: TextInputType.number,
                                          focusNode: FocusNode(),
                                          controller: _bids,
                                          labelText: _bids.text,
                                          validators: FormBuilderValidators.compose([
                                            FormBuilderValidators.required(),
                                            FormBuilderValidators.max(25),
                                          ]),
                                        ),
                                      ),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {
                                    //     // final bidd = int.tryParse(_bids.text);

                                    //     int add = int.tryParse(_bids.text)!;
                                    //     setState(() {
                                    //       add = add + 1;
                                    //       _bids.text = add.toString();
                                    //     });
                                    //     logger.d(_bids.text);
                                    //   },
                                    //   icon: const Icon(
                                    //     Icons.add_rounded,
                                    //     color: Colors.black,
                                    //   ),
                                    // ),
                                    // IconButton(
                                    //   onPressed: () {},
                                    //   icon: Icon(Icons.remove_rounded, color: Colors.black),
                                    // )
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 400,
                        child: CustomElevatedButton(
                          buttonText: "Place Bid",
                          onPressed: () {
                            if (int.tryParse(_bids.text) == null) {
                              SnackBarService.showGenericErrorSnackBar(context, 'Bid Value Must Be A Number');
                            } else {
                              _bidBloc.add(PlaceBidEvent(
                                  bidValue: int.tryParse(_bids.text)!,
                                  sellerId: state.bid.sellerId!,
                                  buyerId: BlocProvider.of<AuthBloc>(context).state.user.userId!,
                                  listingId: widget.listingId,
                                  onCompleted: () {
                                    SnackBarService.showSnackBar(context, "Your Bid is Placed", Icon(Icons.check));
                                    context.router.pop();
                                  }));
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        } else {
          return Text("");
        }
      },
    );
  }
}
