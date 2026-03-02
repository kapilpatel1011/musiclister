# MusicLister

**MusicLister** is a functional and user-friendly Flutter application designed to help users curate, manage, and enjoy their personal music collections. 

---

## Key Features

* **Dynamic Playlist Creation:** Organize your music by creating custom playlists with specific names.
* **Track Management:** Add songs with details including Song Name, Composer/Artist, and a direct Music Link.
* **In-App Redirection:** Clickable music links redirect users to the source (e.g., YouTube) using an internal webview to keep the experience contained within the app.
* **Real-time Updates:** Users can update the composer and music link of any song already in their list.
* **Persistent Storage:** Powered by **GetStorage**, your playlists remain saved even after closing or restarting the application.
* **Modern UI:** High-fidelity interface built with `flutter_screenutil` to ensure responsiveness across all Android devices (SDK 26 to 32).

---

## Tech Stack & Architecture

* **Framework:** Flutter
* **State Management:** GetX (Reactive Controller pattern)
* **Local Storage:** GetStorage (NoSQL key-value persistence)
* **URL Handling:** `url_launcher` (In-App WebView mode)
* **Design Pattern:** Clean Architecture (Separation of UI, Controllers, and Data Models)

---

## Project Structure

```plaintext
lib/
├── models/
│   └── song_model.dart          # Data blueprint for song objects
├── controllers/
│   ├── home_controller.dart     # Manages global state and storage sync
│   └── playlist_controller.dart # Handles form visibility and validation
├── views/
│   ├── home_screen.dart         # Dashboard showing playlist summary
│   └── create_screen.dart       # Interface for adding and viewing tracks
└── utils/
    └── app_constants.dart       # Centralized theme colors and styling

Gemini said
Here is the structured Markdown syntax for your README.md file. I have organized it to be professional, scannable, and easy to navigate for anyone visiting your repository.

Markdown
# MusicLister

**MusicLister** is a functional and user-friendly Flutter application designed to help users curate, manage, and enjoy their personal music collections. Developed with a focus on clean code and reactive state management, the app allows for dynamic playlist creation and seamless in-app music playback.

---

## Key Features

* **Dynamic Playlist Creation:** Organize your music by creating custom playlists with specific names.
* **Track Management:** Add songs with details including Song Name, Composer/Artist, and a direct Music Link.
* **In-App Redirection:** Clickable music links redirect users to the source (e.g., YouTube) using an internal webview to keep the experience contained within the app.
* **Real-time Updates:** Users can update the composer and music link of any song already in their list.
* **Persistent Storage:** Powered by **GetStorage**, your playlists remain saved even after closing or restarting the application.
* **Modern UI:** High-fidelity interface built with `flutter_screenutil` to ensure responsiveness across all Android devices (SDK 26 to 32).

---

## Tech Stack & Architecture

* **Framework:** Flutter
* **State Management:** GetX (Reactive Controller pattern)
* **Local Storage:** GetStorage (NoSQL key-value persistence)
* **URL Handling:** `url_launcher` (In-App WebView mode)
* **Design Pattern:** Clean Architecture (Separation of UI, Controllers, and Data Models)

---

## Project Structure

```plaintext
lib/
├── models/
│   └── song_model.dart          # Data blueprint for song objects
├── controllers/
│   ├── home_controller.dart     # Manages global state and storage sync
│   └── playlist_controller.dart # Handles form visibility and validation
├── views/
│   ├── home_screen.dart         # Dashboard showing playlist summary
│   └── create_screen.dart       # Interface for adding and viewing tracks
└── utils/
    └── app_constants.dart       # Centralized theme colors and styling
    
    
Application Flow
Dashboard: On launch, the HomeScreen displays the active playlist name and a total count of songs currently saved.

Navigation: Users navigate to the CreatePlaylistScreen to manage the contents of their list.

Form Toggle: To maintain a clean UI, the "Add Song" form is hidden by default. Clicking "+ Add a new song" reveals the input fields.

Persistence: When a song is added, the PlaylistController updates the GetStorage instance, which automatically reflects in the HomeScreen summary.

Playback: Tapping any song entry triggers the launchUrl method, opening the link in a secure, internal browser window.


Installation & Setup
Prerequisites
Ensure Flutter is installed on your machine.

Target Android SDK: 26 to 32.

Clone the repository:

Bash
git clone https://github.com/kapilpatel1011/musiclister
Install dependencies:

Bash
flutter pub get
Permissions:
Ensure INTERNET permissions and <queries> for https are present in your AndroidManifest.xml.

Run the application:

Bash
flutter run