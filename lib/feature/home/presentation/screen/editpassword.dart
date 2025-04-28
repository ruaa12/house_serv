import 'package:home_serviece/generated/locale_keys.g.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class EditpasswordScreen extends StatelessWidget {
  EditpasswordScreen({super.key});
  final new_passwordConroller = TextEditingController();
  final new_password_confirmationController = TextEditingController();
  final current_passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AuthBloc(authDatasource: AuthDatasource()), // توفير Bloc هنا
      child: Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          title: Text(LocaleKeys.editpassword_Edit_password.tr()),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ));
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(children: [
            Column(children: [
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocaleKeys.editpassword_Current_pass.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 5,
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
                label: LocaleKeys.editpassword_Enter_pass.tr(),
                labelText: 'enter password'.tr(),
                hint: '',
                controller: current_passwordController,
                keybourdTybe: TextInputType.number,
                onChanged: (String value) {},
                hintText: '',
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocaleKeys.editpassword_New_pass.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 5,
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
                label: LocaleKeys.editpassword_New_pass.tr(),
                labelText: LocaleKeys.editpassword_New_pass.tr(),
                onChanged: (String value) {},
                controller: new_passwordConroller,
                keybourdTybe: TextInputType.number,
                hint: '',
                hintText: '',
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocaleKeys.editpassword_Confirm_pass.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 5,
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
                label: LocaleKeys.editpassword_password.tr(),
                labelText: 'password'.tr(),
                hintText: '',
                controller: new_password_confirmationController,
                keybourdTybe: TextInputType.number,
                onChanged: (String value) {},
                hint: '',
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is PasswordSucces) {
                    return Button(
                      ontap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ));
                      },
                      name: LocaleKeys.editpassword_Update_pass.tr(),
                    );
                  }
                  if (state is PasswordFailure) {
                    return Center(
                      child: Text(state.erro),
                    );
                  }
                  return Button(
                    ontap: () {
                      // هنا إرسال حدث تغيير كلمة المرور
                      context.read<AuthBloc>().add(PasswordButtonPressed(
                            current_password:
                                'currentPassword', // ضع هنا القيمة الفعلية
                            new_password:
                                'newPassword', // ضع هنا القيمة الفعلية
                            new_password_confirmation:
                                'newPasswordConfirmation', // ضع هنا القيمة الفعلية
                          ));
                    },
                    name: LocaleKeys.editpassword_Update_pass.tr(),
                  );
                },
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
