import 'package:ascension_mobile_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/profile/bloc/profile_bloc_bloc.dart';
import 'package:ascension_mobile_app/presentation/widgets/anchored_single_child_scroll_view.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:ascension_mobile_app/presentation/widgets/custom_formbuilder_textfield.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';

import '../../../logger.dart';
import '../../../services/snack_bar_service.dart';

class EditProfileScreen extends StatefulWidget {
  static const String route = 'edit-profile-screen';

  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  TextEditingController _firstName = TextEditingController();

  TextEditingController _lastName = TextEditingController();
  XFile? selectedImages;
  late ProfileBlocBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ProfileBlocBloc>(context);
    _firstName.text = BlocProvider.of<AuthBloc>(context).state.user.firstName.toString();
    _lastName.text = BlocProvider.of<AuthBloc>(context).state.user.lastName.toString();

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: CustomAppBarAndBody(
            title: 'Edit Profile',
            showBackButton: true,
            body: AnchoredSingleChildScrollView(
              childPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              anchorPadding: const EdgeInsets.all(20),
              anchorElevation: Styles.elevation2,
              anchor: CustomElevatedButton(
                buttonText: 'Save',
                onPressed: () {
                  if (_firstName.text.isEmpty || _lastName.text.isEmpty) {
                    // show snackba
                    SnackBarService.showGenericErrorSnackBar(context);
                  } else {
                    _bloc.add(UpdateProfileEvent(
                        firstName: _firstName.text,
                        lastName: _lastName.text,
                        userId: BlocProvider.of<AuthBloc>(context).state.user.userId.toString(),
                        email: BlocProvider.of<AuthBloc>(context).state.user.email.toString(),
                        profile_image: selectedImages,
                        oldImage: BlocProvider.of<AuthBloc>(context).state.user.profile_picture.toString(),
                        onCompleted: () {
                          logger.d("here");
                          context.router.pop();
                          SnackBarService.showSnackBar(context, "Profile Updated Successfully", Icon(Icons.check));
                        }));
                  }

                  // if (_formKey.currentState!.saveAndValidate()) {
                  //   logger.i(_formKey.currentState!.value);

                  // }
                },
              ),
              child: FormBuilder(
                autoFocusOnValidationFailure: false,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "First Name",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: _firstName,
                      labelText: "First name",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                    ),
                    Text(
                      "Last Name",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormBuilderTextField(
                      name: "Last Name",
                      formKey: _formKey,
                      focusNode: FocusNode(),
                      controller: _lastName,
                      labelText: "Last Name",
                      validators: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Center(child: SizedBox(height: 200, width: 200, child: Image.network('https://cdn-icons-png.flaticon.com/512/3566/3566345.png'))),
                    ElevatedButton(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        selectedImages = await imagePicker.pickImage(source: ImageSource.gallery);
                        // BlocProvider.of<ListingImageCubit>(context).selectImages(selectedImages);
                      },
                      child: SizedBox(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(child: Text("Upload Profile Picture")),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
