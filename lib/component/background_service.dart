// // import 'dart:async';
// // import 'dart:ui';
// //
// // import 'package:flutter_background_service/flutter_background_service.dart';
// // import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //
// // Future initializeService() async {
// //   final service = FlutterBackgroundService();
// //
// //   AndroidNotificationChannel channel = AndroidNotificationChannel(
// //       'Satya Kabir', 'background service',
// //       importance: Importance.high);
// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();
// //
// //   await flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<
// //           AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
// //
// //   await service.configure(iosConfiguration: IosConfiguration(),
// //       androidConfiguration: AndroidConfiguration(onStart: onStart,
// //           isForegroundMode: true,
// //         autoStart: true,
// //         notificationChannelId: 'Satya Kabir',
// //         initialNotificationTitle: 'background service',
// //         initialNotificationContent: 'intializing',
// //         foregroundServiceNotificationId: 000
// //       ));
// //
// //   service.startService();
// //
// // }
// //
// // @pragma('vm-entry-point')
// // void onStart(ServiceInstance service) async {
// //   DartPluginRegistrant.ensureInitialized();
// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //   FlutterLocalNotificationsPlugin();
// //
// //   if (service is AndroidServiceInstance) {
// //     service.on('setAsForeground').listen((event) {
// //       service.setAsBackgroundService();
// //     });
// //
// //     service.on('setAsBackground').listen((event) {
// //       service.setAsBackgroundService();
// //     });
// //   }
// //
// //   service.on('stopService').listen((event){
// //     service.stopSelf();
// //   });
// //   Timer.periodic(Duration(seconds: 2), (timer)async{
// //     if(service is AndroidServiceInstance){
// //       if(await service.isForegroundService()){
// //         flutterLocalNotificationsPlugin.show(000,
// //             'SatyaKabir Chat',
// //             'Shake feature enable', NotificationDetails(
// //               android: AndroidNotificationDetails('Satya Kabir',
// //                   'background service',
// //                 ongoing: true
// //               )
// //             ));
// //       }
// //     }
// //   });
// // }
// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// Future initializeService() async {
//   final service = FlutterBackgroundService();
//
//   AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'Satya_Kabir',
//     'Background Service',
//     importance: Importance.high,
//   );
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//       AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   await service.configure(
//     iosConfiguration: IosConfiguration(),
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       isForegroundMode: true,
//       autoStart: true,
//       notificationChannelId: 'Satya_Kabir',
//       initialNotificationTitle: 'Background Service',
//       initialNotificationContent: 'Initializing',
//       foregroundServiceNotificationId: 1, // Use a non-zero value
//     ),
//   );
//
//   service.startService();
// }
//
// @pragma('vm-entry-point')
// void onStart(ServiceInstance service) async {
//   DartPluginRegistrant.ensureInitialized();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   int notificationCount = 0; // Counter to track number of notifications sent
//
//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });
//
//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }
//
//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });
//
//   Timer.periodic(Duration(seconds: 5), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService() && notificationCount < 2) {
//         flutterLocalNotificationsPlugin.show(
//           notificationCount + 1, // Unique ID for each notification
//           'SatyaKabir Chat',
//           'Shake feature enabled',
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               'Satya_Kabir',
//               'Background Service',
//               ongoing: true,
//             ),
//           ),
//         );
//         notificationCount++; // Increment the notification counter
//       }
//
//       if (notificationCount >= 2) {
//         timer.cancel(); // Stop the timer after sending two notifications
//       }
//     }
//   });
//
// }
//
//
//

import 'dart:async';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future initializeService() async {
  final service = FlutterBackgroundService();

  // Set up notification channel
  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'Satya_Kabir', // Notification Channel ID
    'Background Service',
    playSound: true,
    sound: RawResourceAndroidNotificationSound('l'),
    importance: Importance.high,
    description: 'This channel is used for background service notifications.',
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    iosConfiguration: IosConfiguration(),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
      autoStart: true,
      notificationChannelId: 'Satya_Kabir',
      initialNotificationTitle: 'Background Service',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 1, // Use a non-zero value
    ),
  );

  service.startService();
}

@pragma('vm-entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  int notificationCount = 0; // Counter to track number of notifications sent

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(Duration(seconds: 5), (timer) async {
    try {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          if (notificationCount < 2) {
            await flutterLocalNotificationsPlugin.show(
              notificationCount + 1, // Unique ID for each notification
              'SatyaKabir Chat',
              'Shake feature enabled',
              NotificationDetails(
                android: AndroidNotificationDetails(
                  'Satya_Kabir', // Notification Channel ID
                  'Background Service',
                  ongoing: true,
                  importance: Importance.high,
                  priority: Priority.high,
                ),
              ),
            );
            notificationCount++; // Increment the notification counter
          } else {
            timer.cancel(); // Stop the timer after sending two notifications
          }
        }
      }
    } catch (e) {
      print('Error showing notification: $e');
    }
  });
}
