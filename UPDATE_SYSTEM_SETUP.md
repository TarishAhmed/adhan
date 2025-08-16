# Update System Setup Guide

This guide will help you set up the complete update system for your Flutter app, including GitHub Actions CI/CD, Firebase Remote Config, and the update UI.

## Prerequisites

1. **Firebase Project**: You need a Firebase project with Remote Config enabled
2. **GitHub Repository**: Your Flutter project should be in a GitHub repository
3. **Firebase CLI**: Install Firebase CLI for local development

## Step 1: Firebase Setup

### 1.1 Enable Remote Config
1. Go to your Firebase Console: https://console.firebase.google.com/
2. Select your project: `adhan-ahmadiyya`
3. Navigate to **Engage** > **Remote Config**
4. Enable Remote Config if not already enabled

### 1.2 Create Service Account
1. Go to **Project Settings** > **Service Accounts**
2. Click **Generate new private key**
3. Download the JSON file
4. **IMPORTANT**: Keep this file secure and never commit it to your repository

### 1.3 Get Firebase Configuration
1. Go to **Project Settings** > **General**
2. Scroll down to **Your apps** section
3. Add your Android app if not already added
4. Download the `google-services.json` file
5. Place it in `android/app/` directory

## Step 2: Update Firebase Configuration

Replace the placeholder values in `firebase_options.dart` with your actual Firebase configuration:

```dart
// Get these values from your Firebase Console
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR-ACTUAL-API-KEY',
  appId: 'YOUR-ACTUAL-APP-ID',
  messagingSenderId: 'YOUR-ACTUAL-SENDER-ID',
  projectId: 'adhan-ahmadiyya',
  storageBucket: 'adhan-ahmadiyya.appspot.com',
);
```

## Step 3: GitHub Secrets Setup

In your GitHub repository, go to **Settings** > **Secrets and variables** > **Actions** and add these secrets:

### 3.1 FIREBASE_SERVICE_ACCOUNT_KEY
- **Name**: `FIREBASE_SERVICE_ACCOUNT_KEY`
- **Value**: The entire content of your Firebase service account JSON file
- **Type**: Secret

Example:
```json
{
  "type": "service_account",
  "project_id": "adhan-ahmadiyya",
  "private_key_id": "...",
  "private_key": "...",
  "client_email": "...",
  "client_id": "...",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "..."
}
```

## Step 4: Version Management

### 4.1 Update pubspec.yaml
The version in your `pubspec.yaml` follows semantic versioning:
```yaml
version: 1.0.0+1  # major.minor.patch+build
```

- **Major version change** (1.0.0 → 2.0.0): Force update required
- **Minor version change** (1.0.0 → 1.1.0): Force update required  
- **Patch version change** (1.0.0 → 1.0.1): General update suggested

### 4.2 Version Update Process
1. Update the version in `pubspec.yaml`
2. Commit and push to master branch
3. GitHub Actions will automatically:
   - Build the APK
   - Create a GitHub release
   - Update Firebase Remote Config

## Step 5: Testing the Update System

### 5.1 Test Force Update
1. Update `pubspec.yaml` version to a higher major/minor version (e.g., 2.0.0+1)
2. Push to master
3. Wait for GitHub Actions to complete
4. Install the current version on a device
5. The app should show the force update screen

### 5.2 Test General Update
1. Update `pubspec.yaml` version to a higher patch version (e.g., 1.0.1+1)
2. Push to master
3. Wait for GitHub Actions to complete
4. Install the current version on a device
5. The app should show a dismissible update dialog

## Step 6: Firebase Remote Config Structure

The system automatically creates these Remote Config parameters:

- `force_update_version`: Version that requires force update
- `force_update_url`: Download URL for force update
- `general_update_version`: Version that suggests general update
- `general_update_url`: Download URL for general update

## Step 7: Manual Remote Config Updates

If you need to manually update Remote Config values:

1. Go to Firebase Console > Remote Config
2. Add or modify the parameters
3. Publish the changes

## Troubleshooting

### Common Issues

1. **Firebase initialization fails**
   - Check that `firebase_options.dart` has correct values
   - Ensure `google-services.json` is in the correct location

2. **GitHub Actions fails**
   - Check that `FIREBASE_SERVICE_ACCOUNT_KEY` secret is properly set
   - Verify the JSON content is complete and valid

3. **Update not showing**
   - Check Firebase Remote Config values
   - Verify version comparison logic
   - Check network connectivity

4. **APK download fails**
   - Verify GitHub release was created successfully
   - Check the download URL in Remote Config

### Debug Information

To debug update issues, check the app logs for:
- Firebase initialization messages
- Remote Config fetch status
- Version comparison results
- Update check results

## Security Considerations

1. **Service Account Key**: Never commit the Firebase service account key to your repository
2. **API Keys**: The Firebase API keys in `firebase_options.dart` are safe to commit as they are public
3. **Download URLs**: GitHub release URLs are public and safe to use

## Maintenance

1. **Regular Updates**: Keep Firebase dependencies updated
2. **Version Management**: Follow semantic versioning consistently
3. **Testing**: Test the update system before major releases
4. **Monitoring**: Monitor GitHub Actions and Firebase Remote Config usage

## Support

If you encounter issues:
1. Check the troubleshooting section above
2. Review Firebase and GitHub Actions logs
3. Verify all configuration steps were completed correctly
4. Test with a simple version change first
