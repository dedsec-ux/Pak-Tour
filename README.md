# Travel App - Flutter Mobile Application

A modern, elegant travel booking app built with Flutter featuring Material 3 design components. The app provides users with an intuitive interface to discover destinations, manage bookings, and customize their travel experience.

## 📱 Screenshots

<!-- Add your app screenshots here -->

## ✨ Key Features

- **🏠 Home Screen**: Swipeable destination cards with search functionality and regional filters (Asia, Europe, etc.)
- **📋 Booking Management**: Complete booking system with status tracking (Confirmed, Pending, Cancelled) and search capabilities
- **⚙️ Settings Panel**: Comprehensive user preferences including notifications, dark mode, language selection, and profile management
- **🧭 Animated Navigation**: Smooth bottom navigation bar with Home, Bookings, and Settings tabs

## 🚀 Technical Highlights

- ✅ Material 3 UI components with custom theming
- ✅ Provider state management pattern
- ✅ Responsive design with proper error handling
- ✅ Clean architecture with separate view models
- ✅ Custom widgets for reusable components
- ✅ Transparent white styling with black accent colors

## 🛠️ Tech Stack

- **Flutter SDK**: 3.6.0+
- **State Management**: Provider
- **Navigation**: GetX
- **Fonts**: Google Fonts integration
- **UI Components**: Animated bottom navigation bar
- **Card Interaction**: Card swiper for destination browsing

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  get: ^4.7.2
  provider: ^6.1.5+1
  flutter_card_swiper: ^7.0.2
  google_fonts: ^6.3.0
  font_awesome_flutter: ^10.9.1
  animated_bottom_navigation_bar: ^1.3.3
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.6.0 or higher)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/dedsec-ux/Pak-Travel.git
   cd Pak-Travel
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── features/
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── home_view_model.dart
│   ├── bookings/
│   │   ├── booking_screen.dart
│   │   └── booking_view_model.dart
│   ├── settings/
│   │   ├── settings_screen.dart
│   │   └── settings_view_model.dart
│   └── details/
│       ├── destination_detail_screen.dart
│       └── destination_detail_view_model.dart
├── widgets/
│   ├── custom_searchbar.dart
│   ├── custom_tabbar.dart
│   ├── custom_destination_card.dart
│   ├── custom_tour_card.dart
│   ├── custom_circle_button.dart
│   ├── custom_bottom_nav.dart
│   └── main_navigation.dart
└── main.dart
```

## 🎨 Design System

- **Primary Colors**: Black (#000000) and White (#FFFFFF)
- **Background**: Light Gray (#F4F6F8)
- **Accent**: Transparent white with opacity
- **Typography**: Google Fonts - Instrument Sans
- **UI Framework**: Material 3 Components

## 🔧 Features in Detail

### Home Screen
- Interactive destination cards with swipe gestures
- Search functionality for destinations
- Regional filter tabs (Asia, Europe, etc.)
- Personalized greeting with user profile

### Booking Management
- View all bookings with status indicators
- Search and filter bookings
- Status tracking (Confirmed, Pending, Cancelled)
- Booking details with images and information

### Settings
- User profile management
- Notification preferences
- Dark mode toggle (ready for implementation)
- Language selection
- Privacy and security options

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Talal Rafiq**
- GitHub: [@dedsec-ux](https://github.com/dedsec-ux)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for the design system
- All the package contributors

---

⭐ **If you found this project helpful, please give it a star!** ⭐
