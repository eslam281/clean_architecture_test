# 🧹 Clean Architecture Practice (Flutter)

## 🎯 Purpose
This project is a **practice project** to apply Clean Architecture principles in Flutter.  
It demonstrates:
- Layered architecture (Data, Domain, Presentation).
- State management with `flutter_bloc`.
- Dependency injection with `get_it`.
- Local database with `floor`.
- REST API integration with `retrofit` + `dio`.

---
## ✨ Features
- Fetch latest daily news from REST API
- Save news articles locally using Floor
- Dark/Light theme support
- Offline mode with cached data
- Clean Architecture (Data, Domain, Presentation)


## 🗂️ Project Structure
```
lib/
├─ config/ # Theme, app config
├─ core/ # Constants, resources, usecases
├─ features/
│ └─ daily_news/
│ ├─ data/ # Models, repository, sources
│ ├─ domain/ # Entities, repository, usecases
│ └─ presentation/ # Bloc, pages, widgets
```
---

## ⚙️ Tech Stack

- **State Management**: flutter_bloc (v9.1.1)  
- **Dependency Injection**: get_it (v8.2.0)  
- **Networking**: dio (v5.9.0) + retrofit (v4.7.1)  
- **Database**: floor (v1.5.0) + sqflite (v2.4.2)  
- **Utilities**: equatable, intl, cached_network_image, flutter_hooks  

---

## 🚀 Usage
Clone the repo and run:
```bash
flutter pub get
flutter run
```

## 📌 Notes
This project is for educational purposes only (not production).
My main goal is to demonstrate clean code + clean architecture practices.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

