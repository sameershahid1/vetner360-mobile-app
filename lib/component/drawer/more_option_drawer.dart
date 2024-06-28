import 'package:vetner360/screen/pet-owner/bookings/doctor_bookings.dart';
import 'package:vetner360/screen/pet-owner/sell-pet/sell_pet.dart';
import 'package:vetner360/screen/profile/user_profile.dart';
import 'package:vetner360/screen/buying/buy_pet.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:flutter/material.dart';

class MoreOptionDrawer extends StatelessWidget {
  const MoreOptionDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;

    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: ListView(
        children: [
          ListTile(
            key: ValueKey(1),
            title: Row(
              children: [
                Image.asset(
                  DoctorPngimage.profile,
                  height: height / 36,
                  color: DoctorColor.textgrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Profile")
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UserProfile();
                },
              ));
            },
          ),
          ListTile(
            key: ValueKey(2),
            title: Row(
              children: [
                Image.asset(
                  DoctorPngimage.calendar,
                  height: height / 36,
                  color: DoctorColor.textgrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Booking')
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DoctorBookings();
                },
              ));
            },
          ),
          ListTile(
            key: ValueKey(3),
            title: Row(
              children: [
                Icon(
                  Icons.store,
                  color: DoctorColor.textgrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Buy')
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const BuyPet();
                },
              ));
            },
          ),
          ListTile(
            key: ValueKey(4),
            title: Row(
              children: [
                Icon(
                  Icons.sell,
                  color: DoctorColor.textgrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Sell')
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SellPet();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
