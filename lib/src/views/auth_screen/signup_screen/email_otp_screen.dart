// import 'package:cab_booking_app/src/views/auth_screen/signup_screen/email_otp_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OtpScreen extends StatelessWidget {
//   final OtpController controller = Get.put(OtpController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   BackButton(),
//                   Spacer(),
//                   TextButton(onPressed: () {}, child: Text("Sign in")),
//                 ],
//               ),
//               SizedBox(height: 40),
//               Text("Enter OTP code", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Text("Enter the 4-digit code sent to you at +1-876-0002"),
//               SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(4, (index) {
//                   return Obx(() => SizedBox(
//                         width: 50,
//                         child: TextFormField(
//                           controller: controller.textControllers[index],
//                           textAlign: TextAlign.center,
//                           keyboardType: TextInputType.number,
//                           maxLength: 1,
//                           decoration: InputDecoration(
//                             counterText: '',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onChanged: (val) {
//                             controller.updateOtp(index, val);
//                           },
//                         ),
//                       ));
//                 }),
//               ),
//               SizedBox(height: 16),
//               Obx(() => Text(
//                   "I didn't receive a code (0:${controller.countdown.value.toString().padLeft(2, '0')})")),
//               Spacer(),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.greenAccent.shade400),
//                   onPressed: () {
//                     String otp = controller.getOtp();
//                     print("Entered OTP: $otp");
//                     // Add verification logic
//                   },
//                   child: Text("Continue"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cab_booking_app/src/views/auth_screen/signup_screen/email_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButton(),
                  Spacer(),
                  OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.green),
                      )),
                ],
              ),
              SizedBox(height: 40),
              Text(
                "Enter OTP code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Enter the 4-digit code sent to you at you@gmail.com"),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: controller.textControllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        // ),
                      ),
                      onChanged: (val) {
                        controller.updateOtp(index, val);
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),
              Obx(() => Text(
                    "I didn't receive a code (0:${controller.countdown.value.toString().padLeft(2, '0')})",
                  )),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade400,
                  ),
                  onPressed: () {
                    String otp = controller.getOtp();
                    print("Entered OTP: $otp");
                    // TODO: Add verification logic
                  },
                  child: Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
