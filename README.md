# Menoreh Library (Flutter)

Menoreh library is an open source developed by Panemu Solusi Industri.

## Documentation

For Example web preview for this project, please enter this website [Menoreh Library](https://menoreh.codemagic.app/)

For more information about [SOLID Principle](https://www.notion.so/nanang-prasetya/Flutter-with-SOLID-Principle-b8c313db71b84dea9c8b689b07c14c9e).

## Installation

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

* Flutter version : `3.0.5`
* Dart version : `2.17.6`

**Step 1:**

Clone or download this repo by using the code below:

```bash
git clone https://github.com/panemu/menoreh.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```bash
flutter pub get
```

**Step 3:**

Run the Flavor:

```bash
flutter run --flavor development --target main_development.dart
flutter run --flavor production --target main_production.dart
```

## Architecture

![Architecture](/assets/docs/SOLID.jpg)

### Feature Layer

Feature Layers a design pattern that separates a software application's architecture into two layers: a feature layer and a solid layer.

```bash
├── lib
│   ├── core
│   │   ├── extensions
│   │   ├── languages
│   │   ├── themes
│   │   ├── utils
│   │   └── values
│   └── presentation
│       ├── routes
│       ├── widgets
│       ├── bloc
│       └── pages
│           ├── main
│           └── app
├── packages
│   ├── menoreh_domain
│   └── menoreh_data
├── assets
└── test
```

### Domain layer

Domain Layer is the topmost layer of the architecture, which contains the business logic of the application.

```bash
├── lib
│   └── src
│       ├── entities
│       ├── repositories
│       └── usecases
└── test
```

### Data layer

Data Layer is the layer of the architecture that is responsible for managing the application's data.

```bash
├── lib
│   ├── core
│   │   ├── config
│   │   ├── exception
│   │   ├── failure
│   │   ├── usecase
│   │   └── values
│   ├── helper
│   ├── service
│   └── src
│       ├── datasource
│       ├── models
│       └── repositories
└── test
```

## Social Media

* [Linkedin Nanang Prasetya](https://www.linkedin.com/in/nanang-prasetya-bekti-000612142/)
* [Telegram Nanang Prasetya](https://t.me/biscuit_uiux)
* [Instagram Nanang Prasetya](https://www.instagram.com/biscuit_uiux/)
* [Dribbble Nanang Prasetya](https://dribbble.com/biscuit_uiux)