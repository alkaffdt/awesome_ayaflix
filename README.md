# 🎬 Awesome Ayaflix: AYANA Cross-Platform Movie Discovery App

## ✨ Project Overview

This project aims to deliver a high-performance, visually appealing, and feature-rich application deployable across iOS, Android, and Web platforms.

## 🚀 Features

-   **Movie Browsing**: Explore a comprehensive list of popular movies fetched from a public API.
-   **Detailed Movie Information**: View in-depth details for each movie, including title, description, cast, and trailer.
-   **Search Functionality**: Efficiently search for movies by title.
-   **Favorites/Watchlist**: Locally save and manage a personalized list of favorite movies.

## 🛠️ Technical Stack & Architecture

Awesome Ayaflix is engineered with:

-   **Framework**: Flutter (latest stable) - For beautiful, natively compiled applications from a single codebase.
-   **State Management**: Riverpod - A robust and testable state management solution, promoting reactive and maintainable code.
-   **Networking**: Dio - A powerful HTTP client for Dart, used for efficient and flexible API interactions.
-   **Local Storage**: Hive
-   **Architecture**: Clean Architecture (Domain, Data, Presentation Layers) - Ensures clear separation of concerns, testability, and maintainability, making the codebase scalable and easy to understand.


## 🌐 API Integration
The application consumes data from [The Movie Database (TMDB) API](https://developers.themoviedb.org/3), utilizing a Bearer Token for authentication. Key endpoints include:

-   Popular Movies List
-   Movie Search
-   Movie Details
-   Favorite Movie Management

## 📈 Development Guidelines & Best Practices

-   **Caching Strategy**: Implements a cache-first approach using Hive for local storage, significantly improving app performance and responsiveness by reducing reliance on network calls.
-   **Performance & Efficiency**: Optimized for smooth animations, quick data loading, and efficient resource usage.
-   **Code Structure**: Organized, maintainable project structure with clear separation of concerns, adhering to industry best practices.
-   **Code Efficiency & Cleanliness**: Follows Dart/Flutter coding conventions, promoting readable, efficient, and clean code.
-   **Cross-Platform Compatibility**: Deployable to Android (API level 29+), iOS (12.0+), and Web.
-   **Unit Testing**: currently 33% coverage

## ⚙️ Getting Started
To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK installed (ensure you have the latest stable version).
-   Dart SDK (comes with Flutter).
-   A code editor like VS Code or Android Studio.

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/awesome_ayaflix.git
    cd awesome_ayaflix
    ```
2.  Get Flutter packages:
    ```bash
    flutter pub get
    ```
3.  Run the application:
    ```bash
    flutter run
    ```

## 📞 Contact

Muhammad Alkaff - alkaffdt3@gmail.com

