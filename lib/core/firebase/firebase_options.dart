void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Natively reads android/app/google-services.json without DefaultFirebaseOptions
  await Firebase.initializeApp();

  runApp(const MyApp());
}
