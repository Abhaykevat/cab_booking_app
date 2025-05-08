import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'United States',
    example: '2015550123',
    displayName: 'United States',
    displayNameNoCountryCode: 'US',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  SizedBox(width: 8),
                  Text('Back', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Text('Sign up',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
              ),
              SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              ),
              SizedBox(height: 12),
              // Row(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         showCountryPicker(
              //           context: context,
              //           showPhoneCode: true,
              //           onSelect: (Country country) {
              //             setState(() {
              //               selectedCountry = country;
              //             });
              //           },
              //         );
              //       },
              //       child: Container(
              //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.grey),
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         child: Row(
              //           children: [
              //             Text(selectedCountry.flagEmoji),
              //             SizedBox(width: 6),
              //             Text('+${selectedCountry.phoneCode}'),
              //             SizedBox(width: 4),
              //             Icon(Icons.arrow_drop_down),
              //           ],
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 8),
              //     Expanded(
              //       child: TextField(
              //         controller: phoneController,
              //         decoration: InputDecoration(
              //           hintText: 'Your mobile number',
              //           border: OutlineInputBorder(),
              //         ),
              //         keyboardType: TextInputType.phone,
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Your mobile number',
                        border: OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      setState(() {
                                        selectedCountry = country;
                                      });
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(selectedCountry.flagEmoji),
                                    SizedBox(width: 4),
                                    Text('+${selectedCountry.phoneCode}'),
                                    Icon(Icons.arrow_drop_down, size: 18),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) =>
                        DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) => genderController.text = value!,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'By signing up, you agree to the ',
                        children: [
                          TextSpan(
                              text: 'Terms of service',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(text: ' and '),
                          TextSpan(
                              text: 'Privacy policy.',
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF6B200),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              SizedBox(height: 20),
              Row(children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("or"),
                ),
                Expanded(child: Divider()),
              ]),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(iconPath: 'assets/images/Gmail.png'),
                  SizedBox(width: 16),
                  SocialButton(iconPath: 'assets/images/Facebook.png'),
                  SizedBox(width: 16),
                  SocialButton(iconPath: 'assets/images/Apple.png'),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String iconPath;
  const SocialButton({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey[200],
      child: Image.asset(iconPath, width: 24, height: 24),
    );
  }
}
