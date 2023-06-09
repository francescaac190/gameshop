import 'package:gameshop/views/screens/onboard/onboard_screen.dart';
import 'package:get/get.dart';
import '../controller/others/splash_controller.dart';
import '../views/screens/auth/email_verification_screen.dart';
import '../views/screens/auth/otp_screen.dart';
import '../views/screens/auth/reset_password_screen.dart';
import '../views/screens/auth/signin_screen.dart';
import '../views/screens/auth/signup_screen.dart';
import '../views/screens/buy code/Buy (INCODE)/free_fire_incode_screen.dart';
import '../views/screens/buy code/Buy (INCODE)/incode_preview_screen.dart';
import '../views/screens/buy code/Buy (INGAME)/free_fire_ingame_screen.dart';
import '../views/screens/buy code/Buy (INGAME)/ingame_preview_screen.dart';
import '../views/screens/buy code/garena shells/garena_shells_preview.dart';
import '../views/screens/buy code/garena shells/garena_shells_screen.dart';
import '../views/screens/congratulation/congratulation_screen.dart';
import '../views/screens/dashboard/dashboard_screen.dart';
import '../views/screens/drawer/add money/add_money_preview.dart';
import '../views/screens/drawer/add money/add_money_screen.dart';
import '../views/screens/drawer/order history/order_history_screen.dart';
import '../views/screens/drawer/payment history/payment_history_screen.dart';
import '../views/screens/profile/change_password_screen.dart';
import '../views/screens/profile/edit_profile_screen.dart';
import '../views/screens/profile/profile_screen.dart';
import '../views/screens/splash screen/splash_screen.dart';
import '../views/screens/welcome screen/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onboardScreen';
  static const String welComeScreen = '/welComeScreen';
  static const String signInScreen = '/signInScreen';
  static const String otpScreen = '/otpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String congratulations = '/congratulations';
  static const String signUpScreen = '/signUpScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';
  static const String dashBoardScreen = '/dashBoardScreen';
  static const String freeFireIncodeScreen = '/freeFireIncodeScreen';
  static const String freeFireInCodePreview = '/freeFireInCodePreview';
  static const String freeFireInGamePreview = '/freeFireInGamePreview';
  static const String freeFireInGameScreen = '/freeFireInGameScreen';
  static const String garenaShellsScreen = '/garenaShellsScreen';
  static const String garenaShellsPreview = '/garenaShellsPreview';
  static const String profileScreen = '/profileScreen';
  static const String addMoneyScreen = '/addMoneyScreen';
  static const String addMoneyPreview = '/addMoneyPreview';
  static const String paymentHistoryScreen = '/paymentHistoryScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String orderHistoryScreen = '/orderHistoryScreen';
  static const String changePasswordScreen = '/changePasswordScreen';

  static var list = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: onboardScreen,
      page: () => const OnboardScreen(),
    ),
    GetPage(
      name: welComeScreen,
      page: () => const WelComeScreen(),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: otpScreen,
      page: () => OtpScreen(),
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: congratulations,
      page: () => CongratulationScreen(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: emailVerificationScreen,
      page: () => EmailVerificationScreen(),
    ),
    GetPage(
      name: dashBoardScreen,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: freeFireIncodeScreen,
      page: () => FreeFireIncodeScreen(),
    ),
    GetPage(
      name: freeFireInCodePreview,
      page: () =>  FreeFireInCodePreview(),
    ),
    GetPage(
      name: freeFireInGamePreview,
      page: () =>  FreeFireInGamePreview(),
    ),
    GetPage(
      name: freeFireInGameScreen,
      page: () => FreeFireInGameScreen(),
    ),
    GetPage(
      name: garenaShellsScreen,
      page: () => GarenaShellsScreen(),
    ),
    GetPage(
      name: garenaShellsPreview,
      page: () =>  GarenaShellsPreview(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: addMoneyScreen,
      page: () => AddMoneyScreen(),
    ),
    GetPage(
      name: addMoneyPreview,
      page: () =>  AddMoneyPreview(),
    ),
    GetPage(
      name: paymentHistoryScreen,
      page: () => const PaymentHistoryScreen(),
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: orderHistoryScreen,
      page: () => OrderHistoryScreen(),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
  ];
}
