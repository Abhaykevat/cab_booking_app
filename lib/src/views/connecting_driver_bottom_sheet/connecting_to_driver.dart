import 'package:cab_booking_app/src/common_widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:cab_booking_app/src/common_widgets/custom_button/custom_button.dart';
import 'package:cab_booking_app/src/common_widgets/loading_bar/loading_bar.dart';

import '../../constants/app_linker/app_linker.dart';

class ConnectingToDriverBottomSheet extends StatelessWidget {
  const ConnectingToDriverBottomSheet({super.key});

  void showMyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomBottomSheet(
          title: 'Connecting to Driver',
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: LoadingBar()),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'We are connecting you to a driver',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: const Text(
                  'Estimated time of arrival: 5 minutes',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xffA0A0A0),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child:
                              Icon(Icons.hourglass_empty, color: Colors.white)),
                      const SizedBox(width: 10),
                      const Text(
                        'Drop off by 10:00 AM',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text(
                    'PickUp',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text('Pendrikan Kedul Park'),
                  trailing: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CustomButton(
                    text: 'Split Flare',
                    textColor: Colors.black,
                    borderColor: Colors.grey.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 50,
                    width: 150,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 25),
                  CustomButton(
                    text: 'Share Trips',
                    textColor: Colors.white,
                    borderColor: Colors.grey.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 50,
                    buttonColor: Colors.green.withOpacity(0.9),
                    width: 150,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Cancel Ride',
                textColor: Colors.red,
                borderColor: Colors.grey.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 50,
                width: double.infinity,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showMyBottomSheet(context);
          },
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}
