# Optimized app build instructions

Use release mode for production builds:

```bash
flutter clean
flutter pub get
flutter build appbundle --release
```

For smaller APKs split by architecture:

```bash
flutter build apk --release --split-per-abi
```

Notes:
- `minifyEnabled` and `shrinkResources` reduce app size.
- App bundles are smaller and preferred for Android publishing.
- Remove unused assets and large images to reduce install size further.
- Avoid shipping debug-only demo data or heavy resources in release builds.
