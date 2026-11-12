# Build a signed Android App Bundle

The GitHub Actions workflow `.github/workflows/android-release.yml` builds on pushes to `main` and can also be started manually from the Actions tab. Its output is uploaded as the `investlearn-release-aab` artifact.

Configure these repository secrets in **Settings → Secrets and variables → Actions**:

- `ANDROID_KEYSTORE_BASE64`: upload keystore encoded as one-line Base64
- `ANDROID_KEY_ALIAS`: signing key alias
- `ANDROID_KEY_PASSWORD`: key password
- `ANDROID_STORE_PASSWORD`: keystore password
- `GOOGLE_SERVICES_JSON`: Firebase Android configuration for `com.gladstargtschool6.investlearn`

Do not commit the keystore or signing passwords, or post them in chat. Generate and encode a keystore locally, then add the Base64 output directly as a GitHub secret. The workflow generates the Gradle wrapper on the runner and configures the Flutter SDK path from the installed Flutter action.
