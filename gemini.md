# gemini.md

This document provides a standardized context for the **Flutter Movies Platform Application**. It is designed so that `gemini-cli` can understand and generate code/features consistently.

---

## 📱 Project Overview
- **Project Name**: Movies Platform App  
- **Framework**: Flutter (latest stable)  
- **State Management**: Riverpod  
- **Networking**: Dio  
- **Local Storage**: Hive (MVP), planned migration to Drift for advanced queries  
- **Architecture**: Clean Architecture (Domain, Data, Presentation)  
- **Design Pattern**: MVVM + Repository pattern  

---

## 🎬 MVP Features
- User Authentication (Email/Password, Social login optional)  
- Browse Movies List (from API)  
- Movie Details (title, description, cast, trailer)  
- Search Movies  
- Favorites / Watchlist (saved locally)  
- Basic Settings (dark/light theme)  

---

## 🌐 API Integration
- **Base URL**: https://developers.themoviedb.org/3 (Popular movies list, search, movie detail, favorite movie) 
- **Auth**: Bearer Token  
- **Endpoints** (sample):  
complete this section 

---

## 📦 Data Layer
- **RemoteDataSource**: Uses Dio for API requests  
- **LocalDataSource**: Hive for MVP, Drift later  
- **Repository**: Combines remote + local  


## Objective 
Build a Flutter application that can be deployed to iOS and Android, with web support as an additional
bonus. The application should consume a public API, showcase relevant data, and utilize best practices
for mobile app development.


## Requirements:
1. Application Features:
a. Consume data from a public API (choose one from the list below).
b. Display images and relevant information in a user-friendly interface.
c. Implement search and filtering functionality.
d. Make the application creative and visually appealing.

## Development Guidelines:
a. Minimum target SDK for Android: 10 (API level 29).
b. Minimum deployment target for iOS: 12.0.
c. The application should be pushed to a Git platform, preferably GitHub.

## Evaluation Criteria:
a. Caching: Implementation of local storage solutions for caching data (e.g., Hive,
SharedPreferences, SQLite). Use a cache-first approach.
b. App Performance/Efficiency: Overall responsiveness, smoothness, and resource usage
of the app.
c. Unit Testing: Implementation of unit tests is a plus.
d. Internationalization(i18n): Support for multiple locales and locale-aware formatting is a
plus.
e. Code Structure: Organized, maintainable project structure and clear separation of
concerns.
f. Code Efficiency and Cleanliness: Adhere to coding best practices and clean architecture
principles.
g. State Management: Riverpod.