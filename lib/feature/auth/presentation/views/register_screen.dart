import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulHookWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final fullName = useState<String>('');
    // final fullNameController = useTextEditingController();
    // final userNameController = useTextEditingController();
    // final emailController = useTextEditingController();
    // final phoneController = useTextEditingController();
    // final addressController = useTextEditingController();
    // final passwordController = useTextEditingController();
    // final passwordConfirmationController = useTextEditingController();
    return BaseScreen(
        pageTitle: 'Register',
        child: Container(
          height: 50.h,
          width: 100.w,
          color: Colors.red,
        ));
  }
}
