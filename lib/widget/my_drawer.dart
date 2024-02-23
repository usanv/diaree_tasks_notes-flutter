import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../screens/tasks/add_task_screen.dart';
import '../screens/notes/add_note_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<UserProvider>(context);
    return Drawer(
      width: 250,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      elevation: 10,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const SizedBox(
            height: 60,
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(
              'Add Task',
              style: TextStyle(
                color: darkTheme.isDark ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                AddTask.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: Text(
              'Add Notes',
              style: TextStyle(
                color: darkTheme.isDark ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(
                context,
                AddNote.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.nightlight),
            title: Text(
              'Dark Mode',
              style: TextStyle(
                color: darkTheme.isDark ? Colors.white : Colors.black,
              ),
            ),
            trailing: Switch(
              activeTrackColor: Colors.white,
              value: darkTheme.isDark,
              onChanged: (value) {
                setState(() {
                  darkTheme.setTheme(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
