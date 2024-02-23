import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../widget/app_theme.dart';
import '../providers/tasks_provider.dart';
import '../screens/tasks/add_task_screen.dart';
import '../screens/tasks/user_task_screen.dart';
import '../providers/user_provider.dart';
import '../screens/tabs_screen.dart';
import '../screens/notes/user_note_screen.dart';
import '../providers/notes_provider.dart';
import '../screens/notes/add_note_screen.dart';
import '../helper/scroll_behaviour.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final deviceInfo = await DeviceInfoPlugin().deviceInfo;
  final androidSdkVersion =
      deviceInfo is AndroidDeviceInfo ? deviceInfo.version.sdkInt : 0;
  runApp(MyApp(androidSdkVersion: androidSdkVersion));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.androidSdkVersion}) : super(key: key);
  final int androidSdkVersion;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TasksProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: NotesProvider(),
        ),
      ],
      child: Consumer(
        builder: (context, __, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehavior(
              androidSdkVersion: widget.androidSdkVersion,
            ),
            theme: Provider.of<UserProvider>(context).isDark
                ? DarkTheme.darkThemeData
                : LightTheme.lightThemeData,
            home: const Tabs(),
            routes: {
              AddTask.routeName: (ctx) => const AddTask(),
              UserTaskScreen.routeName: (ctx) => const UserTaskScreen(),
              Tabs.routeName: (ctx) => const Tabs(),
              UserNoteScreen.routeName: (ctx) => const UserNoteScreen(),
              AddNote.routeName: (ctx) => const AddNote(),
            },
          );
        },
      ),
    );
  }
}
