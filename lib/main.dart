import 'package:cab_booking_app/src/views/home_screen/home_screen/book_ride_screen/book_ride_screen.dart';
import 'src/constants/app_linker/app_linker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QUICK RYDE',
      debugShowCheckedModeBanner: false,
      //initialRoute: '/splash',
      //initialBinding: SplashBinding(),
      home:RideSheetDemo(), 
    );
  }
}
