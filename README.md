# Movie App 🎬

[![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)](https://firebase.google.com/)
[![BLoC](https://img.shields.io/badge/BLoC-02569B?style=for-the-badge&logo=bloc&logoColor=white)](https://bloclibrary.dev/)
[![TMDB](https://img.shields.io/badge/TMDB-01D277?style=for-the-badge&logo=themoviedatabase&logoColor=white)](https://www.themoviedb.org/)
[![Easy Localization](https://img.shields.io/badge/Localization-0175C2?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dev/packages/easy_localization)

A feature-rich movie discovery application built with Flutter. Browse trending movies, search films, save favorites, and get personalized recommendations.

## Features ✨

- **Authentication** 🔒
  - Email/Password login
  - Google Sign-In
- **Movie Discovery** 🎥
  - Trending movies
  - Popular/Upcoming/Top Rated categories
  - Movie details
- **Search** 🔍
  - Find movies by title
- **Favorites** ❤️
  - Save favorite movies (persisted with Firestore)
- **Localization** 🌍
  - Multi-language support (English, Arabic)
- **Dark Mode** 🌗
  - Beautiful dark and light themes
- **Responsive UI** 📱
  - Clean and intuitive design suitable for different device sizes

## Technologies 🛠️

- **State Management**: BLoC (Cubit)
- **Backend Services**: 
  - Firebase Authentication (Email/Password & Google Sign-In)
  - Cloud Firestore (User data & Favorites)
- **Movie API**: [The Movie Database (TMDB)](https://www.themoviedb.org/)
- **Localization**: Easy Localization (JSON-based)
- **Additional Packages**:
  - Cached Network Image (Image caching)
  - Google Sign-In (Firebase integration)
  - Firebase Core, Auth, Firestore
  - Easy Localization
  - fluttertoast
  - animate_do
  - animated_toggle_switch
  - loader_overlay
  - google_fonts
  - http
