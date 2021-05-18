# My Flutter calculator [WIP]

![GitHub pull requests](https://img.shields.io/github/issues-pr/maku85/my-flutter-calculator) ![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/maku85/my-flutter-calculator) ![GitHub last commit](https://img.shields.io/github/last-commit/maku85/my-flutter-calculator) ![GitHub issues](https://img.shields.io/github/issues-raw/maku85/my-flutter-calculator) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/maku85/my-flutter-calculator)

Calculator app using Flutter [Bloc pattern](https://bloclibrary.dev/#/whybloc).

Design inspired by [Calculator](https://dribbble.com/shots/13680312-Daily-UI-004-Calcuator) (designed by [Eujue](https://dribbble.com/eujue))

<img src="https://cdn.dribbble.com/users/4672704/screenshots/13680312/media/81c9fb381d67eca6a7da0b2b0f8a2c18.jpg" />

## Screenshots

|                     Android                      |                     iOS                      |
| :----------------------------------------------: | :------------------------------------------: |
| ![](screenshots/screenshot_android.jpg?raw=true) | ![](screenshots/screenshot_ios.jpg?raw=true) |

## Directory Structure

```
lib
│─ bloc
|  │─ calculator_bloc.dart
|  │─ calculator_event.dart
|  └─ calculator_state.dart
└─ models
│  └─ key_symbol.dart
└─ screens
│  │─ widgets
│  │  │─ display.dart
│  │  │─ key.dart
│  │  └─ keypad.dart
│  └─ calculator.dart
└─ main.dart
```
