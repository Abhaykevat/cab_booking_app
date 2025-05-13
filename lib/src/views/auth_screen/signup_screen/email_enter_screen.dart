import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'email_controller.dart';

class EmailScreen extends StatelessWidget {
  final controller = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: OutlinedButton(onPressed: (){},
            style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: Text('Sign in',style: TextStyle(color: Colors.green),)),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your email address",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Add your email to aid in account recovery"),
            SizedBox(height: 30),
            Text("Email address",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() => TextField(
                  controller: controller.emailController,
                  onChanged: controller.validateEmail,
                  decoration: InputDecoration(
                    hintText: "you@example.com",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: controller.isValidEmail.value
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: controller.isValidEmail.value
                            ? Colors.green
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                )),
            Spacer(),
            Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isValidEmail.value ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Continue", style: TextStyle(fontSize: 16)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
