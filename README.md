# YouDo! app

This project is a sample project to demonstrate a simple ToDO app in Flutter.

It gives a basic architecture for the project.

## Project Structure

Main packages:

- **bloc:** State management
- **flutter_secure_storage:** Secure storage
- **hive:** Local storage
- **go_router:** Routing

```

lib
├── application
│   ├── config
│   ├── errors
│   └── utils
├── data
│   ├── cubits
│   ├── entities
│   │   └── hive
│   ├── repositories
│   └── services
└── presentation
    ├── home
    ├── person
    ├── settings
    └── widgets
```

## Development environment setup

- Flutter >= v3.10.0
- Dart >= 3.0

Tested Working environments:

- Web
- Android and iOS
- MacOS Desktop

## Build and Run

First, define the environment variable `dotenvFileName` to the name of the environment file you want to use.

### Build (Staging)

- **Web:** `flutter build -d chrome --dart-define dotenvFileName=env.staging`
- **MacOS:** `flutter build -d macos --dart-define dotenvFileName=env.staging`

### Run (Staging)

- **Web:** `flutter run -d chrome --dart-define dotenvFileName=env.staging`
- **MacOS:** `flutter run -d macos --dart-define dotenvFileName=env.staging`

## Launcher icon replacement

1. Copy the 512x512 px image to the `assets/icons/launcher_icon.png` path

2. Generate the Launcher icon by running the following command
   `flutter pub run flutter_launcher_icons:main`





