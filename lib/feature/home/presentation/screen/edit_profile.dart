import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  File? _image;

  Future<void> _pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _image = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text(LocaleKeys.editProfile_Edit_prof.tr()),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UpdateProfileSucces) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Profile updated successfully")));
          } else if (state is UpdateProfilefailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: _pickFile,
                    child: CircleAvatar(
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      radius: 50,
                      child:
                          _image == null ? const Icon(Icons.camera_alt) : null,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.length >= 8) {
                        return null;
                      } else {
                        return LocaleKeys.editpassword_Valid_pass.tr();
                      }
                    },
                    label: 'Fullname',
                    labelText: 'fullname'.tr(),
                    hintText: '',
                    controller: fullnameController,
                    keybourdTybe: TextInputType.number,
                    onChanged: (String value) {},
                    hint: '',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.length >= 8) {
                        return null;
                      } else {
                        return LocaleKeys.editpassword_Valid_pass.tr();
                      }
                    },
                    label: 'username',
                    labelText: 'username'.tr(),
                    hintText: '',
                    controller: usernameController,
                    keybourdTybe: TextInputType.number,
                    onChanged: (String value) {},
                    hint: '',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.length >= 8) {
                        return null;
                      } else {
                        return LocaleKeys.editpassword_Valid_pass.tr();
                      }
                    },
                    label: 'Phone',
                    labelText: 'phone'.tr(),
                    hintText: '',
                    controller: phoneController,
                    keybourdTybe: TextInputType.number,
                    onChanged: (String value) {},
                    hint: '',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.length >= 8) {
                        return null;
                      } else {
                        return LocaleKeys.editpassword_Valid_pass.tr();
                      }
                    },
                    label: 'Email',
                    labelText: 'Email'.tr(),
                    hintText: '',
                    controller: emailController,
                    keybourdTybe: TextInputType.number,
                    onChanged: (String value) {},
                    hint: '',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                UpdateProfileButtonPressed(
                                  name: fullnameController.text,
                                  phone: phoneController.text,
                                  username: usernameController.text,
                                  email: emailController.text,
                                  image: _image,
                                ),
                              );
                            }
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text('Update Profile'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
