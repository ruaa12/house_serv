import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(authDatasource: AuthDatasource());
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      _authBloc.add(GetProfile(token: token));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('التوكن غير موجود، يرجى تسجيل الدخول')),
      );
    }
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: Scaffold(
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
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProfileSuccess) {
              final user = state.user;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.teal[100],
                        backgroundImage: user.profilePhotoUrl != null
                            ? NetworkImage(user.profilePhotoUrl!)
                            : null,
                        child: user.profilePhotoUrl == null
                            ? const Icon(Icons.person,
                                size: 50, color: Colors.teal)
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInfo('Name', user.name),
                    const Divider(),
                    const SizedBox(height: 20),
                    _buildInfo('Username', user.username),
                    const Divider(),
                    const SizedBox(height: 20),
                    _buildInfo('Email', user.email),
                    const Divider(),
                    const SizedBox(height: 20),
                    _buildInfo('Phone', user.phone),
                    const Divider(),
                    const SizedBox(height: 20),
                    _buildInfo(
                      'created_at',
                      user.createdAt != null
                          ? user.createdAt!.toLocal().toString()
                          : '-',
                    ),
                    const Divider(),
                    const SizedBox(height: 20),
                    _buildInfo(
                      'updated_at',
                      user.updatedAt != null
                          ? user.updatedAt!.toLocal().toString()
                          : '-',
                    ),
                  ],
                ),
              );
            } else if (state is GetprofileFailure) {
              return Center(
                child: Text(
                  'حدث خطأ: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: Text('لم يتم تحميل البيانات بعد'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildInfo(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            '$title : ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color2,
            ),
          ),
          Expanded(
            child: Text(
              value ?? '-',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
