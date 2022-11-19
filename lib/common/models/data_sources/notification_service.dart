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
    debugPrint('Initializing notification service...');
    _requestPermissions();
    initPlatformConfigurations();
    _subscribeToPublicChannel();
    _startListeningTokenChanges();
    getToken();
    _startListeningMessages();
  }

  _requestPermissions() async {
    debugPrint('Requesting permissions...');
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
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  initPlatformConfigurations() async {
    debugPrint('Initializing platform configurations...');
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
    debugPrint('Received message ${message.notification?.title}');
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
    debugPrint('Start listening messages...');
    FirebaseMessaging.onMessage.listen(showNotification);
  }

  _startListeningTokenChanges() {
    debugPrint('Start listening token changes...');
    _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
      debugPrint('FCM TOKEN CHANGED: $_fcmToken');
      _fcmToken = fcmToken;
    }).onError((err) {
      // Error getting token.
    });
  }

  Future<String?> getToken() async {
    debugPrint('FCM TOKEN1: $_fcmToken');
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
    debugPrint('FCM TOKEN2: $_fcmToken');
    return fcmToken;
  }

  _subscribeToPublicChannel() async {
    debugPrint('Subscribing to topics...');
    await _firebaseMessaging.subscribeToTopic('default');
    debugPrint('Subscribed to "public" topic...');
  }
}
