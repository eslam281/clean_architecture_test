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
;.;
## 🎯 Purpose
This project is a **practice project** to apply Clean Architecture principles in Flutter.
It demonstrates:
- Layered architecture (Data, Domain, Presentation).
- State management with `flutter_bloc`.
- Dependency injection with `get_it`.
- Local database with `floor`.
- REST API integration with `retrofit` + `dio`.


This is a project to demonstrate my practice in a clean architecture, picturing a certain distribution
## 🗂️ Project Structure
lib/
├─ config/ # Theme, app config
├─ core/ # Constants, resources, usecases
├─ features/
│ └─ daily_news/
│ ├─ data/ # Models, repository, sources
│ ├─ domain/ # Entities, repository, usecases
│ └─ presentation/ # Bloc, pages, widgets
      
I use state management "flutter_bloc"

## ⚙️ Tech Stack

And I use some packages
advanced as "floor" and "retrofit" => floor: ^1.5.0 &&  retrofit: ^4.7.1
and many packages 
- **State Management**: flutter_bloc (v9.1.1)
- **Dependency Injection**: get_it (v8.2.0)
- **Networking**: dio (v5.9.0) + retrofit (v4.7.1)
- **Database**: floor (v1.5.0) + sqflite (v2.4.2)
- **Utilities**: equatable, intl, cached_network_image, flutter_hooks

