import 'package:carotv/core/presentation/components/base_screen.dart';
import 'package:carotv/feature/auth/presentation/views/login_screen.dart';
import 'package:carotv/feature/dashboard/presentation/components/bottom_nav_bar.dart';
import 'package:carotv/feature/more/views/more_screen.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    Text('Home', style: TextStyle(color: Colors.white)),
    Text('Search', style: TextStyle(color: Colors.white)),
    LoginScreen(),
    MoreScreen()
  ];

  void _onItemTappedBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   FirebaseMessaging.instance.getToken().then((fcmToken) {
  //     if (kDebugMode) {
  //       print('FCM TOKEN: $fcmToken');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      pageTitle: 'Caro TV',
      noBackButton: true,
      // drawer: Drawer(
      //   backgroundColor: AppColors.primaryBackground,
      //   width: MediaQuery.of(context).size.width * 0.75,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(20.r),
      //       bottomRight: Radius.circular(20.r),
      //     ),
      //   ),
      //   child: ListView(
      //     children: [
      //       DrawerItem(
      //         title: 'Login',
      //         onTap: () {
      //           context.goNamed(AppRoutes.loginScreen);
      //         },
      //         icon: Icons.login,
      //       ),
      //       DrawerItem(
      //         title: 'Register',
      //         onTap: () {
      //           context.goNamed(AppRoutes.registerScreen);
      //         },
      //         icon: Icons.person,
      //       ),
      //       DrawerItem(
      //         title: 'Verify KYC',
      //         onTap: () {},
      //         icon: Icons.verified_outlined,
      //       ),
      //       DrawerItem(
      //         title: 'Logout',
      //         onTap: () {},
      //         icon: Icons.logout,
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar:
          BottomNavBar(_selectedIndex, _onItemTappedBottomNavBar),
      // floatingActionButton: const SearchButton(),
      child: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
