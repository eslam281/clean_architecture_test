# cleanarchitecture

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

This is a project to demonstrate my practice in a clean architecture, picturing a certain distribution
lib:
  config: theme:
  core: constants: || resources: || usecases:
  features:
    daily_news:
      data: models: || repository: || sources
      domain: entities: || repository: || usecase:
      presentation: bolc: || pages: || widgets:
      
I use state management "flutter_bloc"

And I use some packages
advanced as "floor" and "retrofit" => floor: ^1.5.0 &&  retrofit: ^4.7.1
and many packages 
flutter_bloc: ^9.1.1
  equatable: ^2.0.7
  get_it: ^8.2.0
  intl: ^0.20.2
  flutter_hooks: ^0.21.3
  cached_network_image: ^3.4.1
  dio: ^5.9.0
  sqflite: ^2.4.2
