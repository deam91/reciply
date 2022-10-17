import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  String _fcmToken = '';

  NotificationService();

  init() {
    print('Initializing...');
    _requestPermissions();
    initPlatformConfigurations();
    // _subscribeToPublicChannel();
    _startListeningTokenChanges();
    _getToken();
    _startListeningMessages();
  }

  _requestPermissions() async {
    print('Requesting permissions...');
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  initPlatformConfigurations() async {
    print('Initializing platform configurations...');
    // iOS configuration
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // Android configuration
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  showNotification(RemoteMessage message) {
    print('Received message ${message.notification?.title}');
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android.smallIcon,
            // other properties...
          ),
        ),
      );
    }
  }

  _startListeningMessages() {
    print('Start listening messages...');
    FirebaseMessaging.onMessage.listen(showNotification);
  }

  _startListeningTokenChanges() {
    print('Start listening token changes...');
    _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
      print('FCM TOKEN CHANGED: $_fcmToken');
      _fcmToken = fcmToken;
    }).onError((err) {
      // Error getting token.
    });
  }

  _getToken() async {
    print('FCM TOKEN1: $_fcmToken');
    var fcmToken = await FirebaseMessaging.instance.getToken();
    if (kIsWeb) {
      fcmToken = await FirebaseMessaging.instance.getToken(
          vapidKey:
              "BCnKxRQOF-X3kv--BAzV4usbLDuJFF7FydGvVuWHPZq0YJktjeACAH6p_yu9fJ5rhO0q3sRHog4zxke45a_iSJw");

      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    }
    _fcmToken = fcmToken ?? '';
    print('FCM TOKEN2: $_fcmToken');
    return fcmToken;
  }

  _subscribeToPublicChannel() async {
    print('Subscribing to topics...');
    await _firebaseMessaging.subscribeToTopic('default');
    print('Subscribed to "weather" topic...');
  }
}
