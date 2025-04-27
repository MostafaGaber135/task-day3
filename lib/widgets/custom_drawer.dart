import 'package:flutter/material.dart';
import 'package:task_day3/widgets/custom_list_item_drawer.dart';

class CustomDrawer extends StatefulWidget {
  final String userName;
  final List<Map<String, dynamic>> tasks;

  const CustomDrawer({super.key, required this.userName, required this.tasks});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    int doneTasks = widget.tasks.where((task) => task['isCompleted']).length;
    int leftTasks = widget.tasks.where((task) => !task['isCompleted']).length;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          spacing: 12,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color(0XFFe0e0e0),
              ),
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                height: 85,
                width: 85,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.userName,
              style: const TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color(0XFFe0e0e0),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 58,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color(0XFF363636),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '$leftTasks Task left',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 58,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color(0XFF363636),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '$doneTasks Task done',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomListItemDrawer(
              title: 'Settings',
              subTitle: 'App Settings',
              icon: Icons.settings_outlined,
            ),
            CustomListItemDrawer(
              title: 'Account',
              subTitle: 'Change account name',
              icon: Icons.person_outline,
            ),
            CustomListItemDrawer(
              subTitle: 'Change account password',
              icon: Icons.key_outlined,
            ),
            CustomListItemDrawer(
              subTitle: 'Change account Image',
              icon: Icons.image_outlined,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 15,
                  children: [
                    Icon(Icons.wb_sunny_outlined, color: Color(0XFF767E8C)),
                    Text(
                      'Change Mode',

                      style: TextStyle(
                        color: Color(0XFF767E8C),
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Switch(
                  activeTrackColor: Color(0XFF24a19c),
                  activeColor: Color(0XFFffffff),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                ),
              ],
            ),

            CustomListItemDrawer(
              title: 'Uptodo',
              subTitle: 'About US',
              icon: Icons.workspaces_outline,
            ),
            CustomListItemDrawer(subTitle: 'FAQ', icon: Icons.info_outline),
            CustomListItemDrawer(
              subTitle: 'Help & Feedback',
              icon: Icons.flash_on_outlined,
            ),
            CustomListItemDrawer(
              subTitle: 'Support US',
              icon: Icons.thumb_up_outlined,
            ),
            Row(
              spacing: 15,
              children: [
                Icon(Icons.logout, color: Color(0XFFFF4949)),
                Text(
                  'Log out',

                  style: TextStyle(
                    color: Color(0XFFFF4949),
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
