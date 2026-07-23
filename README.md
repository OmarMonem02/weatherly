# Weatherly

A modern Flutter weather app that shows real-time conditions for any city, with weather-driven Lottie animations and gradients. Built with **Clean Architecture**, **BLoC**, and **GetIt** for a clear, testable structure.

**API:** [WeatherAPI](https://www.weatherapi.com/) · **Repo:** [OmarMonem02/weatherly](https://github.com/OmarMonem02/weatherly)

---

## Features

- **City search** — Look up current weather worldwide (temp, condition, humidity, wind, and more)
- **Dynamic visuals** — Lottie animations and gradients that follow conditions (sunny, cloudy, rainy, storm, snow, windy)
- **Glassmorphic UI** — Header and info cards with a clean Material 3 look
- **Offline cache** — Last result stored with `SharedPreferences` so data still shows without a network
- **Last city restore** — Reloads the previously searched city on launch
- **Solid error handling** — Network and invalid-query failures surface as clear UI states

---

## Tech stack

| Area | Choice |
|------|--------|
| Framework | Flutter / Dart |
| State management | `flutter_bloc` + `equatable` |
| Architecture | Feature-first Clean Architecture (data / domain / presentation) |
| DI | `get_it` |
| Networking | `dio` + `pretty_dio_logger` |
| Config | `flutter_dotenv` (API key in `.env`) |
| Local cache | `shared_preferences` |
| Animations | `lottie` |
| Functional errors | `dartz` |

---

## Project structure

```text
lib/
├── main.dart
├── core/
│   ├── di/                 # GetIt service locator
│   ├── error/              # Failure types
│   ├── network/            # Dio client & API constants
│   └── theme/              # Colors & typography
└── features/
    └── weather/
        ├── data/
        │   ├── datasources/    # Remote (WeatherAPI) & local cache
        │   ├── models/         # WeatherModel + JSON mapping
        │   └── repositories/   # WeatherRepositoryImpl
        ├── domain/
        │   └── repositories/   # Abstract WeatherRepository
        └── presentation/
            ├── bloc/           # Events, states, WeatherBloc
            ├── screens/        # WeatherScreen
            ├── utils/          # Condition → Lottie / status helpers
            └── widgets/        # Header, search field, info cards
```

---

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK ^3.12)
- A free [WeatherAPI](https://www.weatherapi.com/) key

### Setup

1. **Clone the repo**

```bash
git clone https://github.com/OmarMonem02/weatherly.git
cd weatherly
```

2. **Add your API key**

Create a `.env` file in the project root:

```env
API_KEY=your_weatherapi_key_here
```

> `.env` is loaded at startup via `flutter_dotenv` and must stay out of version control.

3. **Install dependencies**

```bash
flutter pub get
```

4. **Run the app**

```bash
flutter run
```

---

## Assets

Lottie files live under `assets/lottie/` and are declared in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - .env
    - assets/lottie/
```

Included animations: sunny, cloudy, rainy, storm, snow, windy.

---

## Architecture notes

- **Presentation** talks only to `WeatherBloc`; UI never calls the API directly.
- **Domain** defines the repository contract; data layer implements it.
- **Remote** hits WeatherAPI current weather; **local** caches the last successful response.
- **GetIt** wires Dio, data sources, repository, and bloc in `core/di/service_locator.dart`.

---

## Author

**Omar Abdelmonem** — Mobile Flutter Developer

- GitHub: [OmarMonem02](https://github.com/OmarMonem02)
- Project: [weatherly](https://github.com/OmarMonem02/weatherly)
