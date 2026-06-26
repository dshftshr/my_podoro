# MyPodoro 🍅

MyPodoro is a modern, gamified productivity application built with **Flutter** and **Riverpod**. It blends the proven Pomodoro technique with RPG-like progression elements, helping you stay focused while earning rewards!

## 👥 Team Members

- Desi Hafita Ashri
- Dwi Yulianti
- Mustika Weni

## 🚀 Features

- **Dynamic Pomodoro Timer**: Seamlessly switch between Focus sessions (25 minutes) and Rest modes (5 minutes).
- **Mission & Sub-Task Management**: Choose your target cycles (e.g., 2, 4, or 8) and list your specific sub-tasks dynamically before starting a session.
- **Gamification & Economy**: Earn **Diamonds** 💎 by completing focus cycles. Use your hard-earned diamonds to unlock exclusive avatars in the Avatar Shop.
- **Streak Tracking**: Complete at least one full mission a day to build and maintain your daily streak 🔥!
- **Calendar & History**: Keep track of your past achievements. Tap on a calendar date to view the detailed history of the tasks and sub-tasks you completed on that day.
- **Cloud Sync**: Integrated with **Supabase** to securely sync your profile, diamonds, unlocked avatars, and streaks across devices.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **State Management**: [Riverpod](https://riverpod.dev/) (with Riverpod Generator)
- **Backend & Auth**: [Supabase](https://supabase.com/) (PostgreSQL, Row-Level Security, Authentication)
- **Local Persistence**: SharedPreferences / Isar
- **UI Components**: `table_calendar`, `audioplayers` (for focus background music)

## 📸 Screenshots

*(You can add your application screenshots here)*

## 🏃‍♂️ Getting Started

### Prerequisites
- Flutter SDK (stable channel)
- Dart SDK
- A Supabase Project (for backend services)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/my_podoro.git
   cd my_podoro
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Generate Riverpod Providers:**
   Since this project uses `riverpod_annotation`, run the build runner to generate the necessary `.g.dart` files:
   ```bash
   dart run build_runner build -d
   ```

4. **Environment Setup:**
   Make sure you have configured your `lib/main.dart` or an `.env` file with your **Supabase URL** and **Anon Key**.

5. **Run the App:**
   ```bash
   flutter run
   ```

## 🏗 Project Structure

- `lib/features/timer/`: Contains the core Pomodoro logic, Timer UI, Mission tracking, and History Provider.
- `lib/features/avatar/`: Contains the economy provider, avatar state, and the Catalog UI.
- `lib/features/calendar/`: Contains the Calendar UI and integrates with the History/Streak providers.
- `lib/features/auth/`: Contains Supabase authentication and user profile syncing logic.

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check [issues page](https://github.com/yourusername/my_podoro/issues).

## 📝 License
This project is [MIT](https://choosealicense.com/licenses/mit/) licensed.
