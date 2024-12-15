# Animal Flutter Project

Welcome to the **Animal** Flutter project! This Flutter application serves as a platform for managing and exploring animal-related content. The app leverages robust state management techniques, efficient network requests, and Firebase integration to provide a seamless user experience. Whether it's displaying animal data, managing user preferences, or handling push notifications, this app is designed with scalability and maintainability in mind.

## Project Overview

- **Project Name:** Animal
- **Description:** A Flutter application to explore and manage animal-related content.
- **Flutter Version:** `>=2.12.0 <3.0.0`
- **Version:** 1.0.0+1

## Features

- State management with **Provider**, **MobX**, and **GetIt**.
- Firebase integration for messaging and core functionality.
- JSON serialization/deserialization using **json_serializable** and **json_annotation**.
- Network calls with **Dio**.
- Beautiful shimmer loading effects using **Shimmer**.
- Shared preferences for local storage.

## Folder Structure

A well-organized folder structure ensures maintainability and scalability. Below is the detailed folder structure for the project:

```plaintext
lib/
├── main.dart             # Entry point of the application
├── core/
│   ├── utils/            # Utility classes and functions (e.g., date formatting, validators)
│   ├── constants/        # Constant values and keys (e.g., API endpoints, color palettes)
│   ├── services/         # Service classes (e.g., API services, local storage handlers)
│   └── di/               # Dependency injection using GetIt
├── models/
│   ├── entities/         # Plain Dart models representing app data (e.g., Animal, User)
│   └── serializers/      # JSON serializers and deserialization logic
├── state_management/
│   ├── mobx/             # MobX store files for reactive state management
│   └── provider/         # Provider-related state management and context files
├── views/
│   ├── screens/          # All app screens (e.g., HomeScreen, DetailScreen)
│   └── widgets/          # Reusable UI components (e.g., CustomButton, LoadingIndicator)
├── assets/
│   ├── images/           # Application images and graphics
├── test/                 # Unit and widget tests for the application
```

## Dependencies

Below is a list of dependencies used in this project:

### Runtime Dependencies

- **[Flutter](https://flutter.dev/):** Core SDK for developing mobile apps.
- **[Cupertino Icons](https://pub.dev/packages/cupertino_icons):** iOS-style icons.
- **[Shared Preferences](https://pub.dev/packages/shared_preferences):** For saving key-value pairs locally.
- **[GetIt](https://pub.dev/packages/get_it):** Service locator for dependency injection.
- **[Copy With Extension](https://pub.dev/packages/copy_with_extension):** Generate `copyWith` methods for classes.
- **[JSON Serializable](https://pub.dev/packages/json_serializable):** JSON serialization.
- **[JSON Annotation](https://pub.dev/packages/json_annotation):** Annotations for JSON serialization.
- **[MobX](https://pub.dev/packages/mobx):** Reactive state management.
- **[Flutter MobX](https://pub.dev/packages/flutter_mobx):** Flutter integration for MobX.
- **[Provider](https://pub.dev/packages/provider):** State management for Flutter.
- **[Dio](https://pub.dev/packages/dio):** HTTP client for network requests.
- **[Shimmer](https://pub.dev/packages/shimmer):** Loading placeholder effect.
- **[Loggy](https://pub.dev/packages/loggy):** Logging library.
- **[Firebase Messaging](https://pub.dev/packages/firebase_messaging):** Push notifications.
- **[Firebase Core](https://pub.dev/packages/firebase_core):** Core Firebase SDK.
- **[Intl](https://pub.dev/packages/intl):** Internationalization and localization.

### Development Dependencies

- **[Flutter Test](https://pub.dev/packages/flutter_test):** Unit testing framework.
- **[Build Runner](https://pub.dev/packages/build_runner):** Code generation tool.
- **[MobX Codegen](https://pub.dev/packages/mobx_codegen):** Code generator for MobX stores.
- **[Copy With Extension Gen](https://pub.dev/packages/copy_with_extension_gen):** Code generator for `copyWith` methods.

## Getting Started

Follow these steps to get the project running locally:

### Prerequisites

- Install [Flutter SDK](https://flutter.dev/docs/get-started/install).
- Set up a code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
- Install Dart plugins in your editor.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-repository-url/animal
   cd animal
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:

   ```bash
   flutter run
   ```

### Build Runner Commands

To generate code for MobX and CopyWith extensions, run:

```bash
flutter pub run build_runner build
```

## Assets

The project uses assets stored in the `assets/images/` directory. Ensure your assets are added to the project as follows:

```yaml
flutter:
  assets:
    - assets/images/
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin feature-name`.
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, please contact [your email or GitHub profile].

