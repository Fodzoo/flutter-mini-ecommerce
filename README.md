# Mini E-Commerce App

A simple Flutter mini e-commerce application built as a technical assignment for AfaaqWare.

The app includes a mock login flow, product browsing, cart management, quantity controls, total price calculation, and a simulated checkout process.

## Features

- Mock login with email and password validation
- Login loading state
- Home screen displaying a collection of products
- Add products to cart
- Increase and decrease product quantities
- Remove products from cart
- Automatic total price calculation
- Shared cart state between Home and Cart screens
- Empty cart state
- Checkout confirmation dialog
- Cart cleared after checkout confirmation

## Tech Stack

- Flutter
- Dart
- Material Design
- Flutter Bloc (Cubit)
- Provider

## Architecture

The project follows a simple feature-based structure, keeping related screens, state management, and UI components organized by feature.

```text
lib/
├── core/
│   ├── theme/
│   │   └── app_color.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_text.dart
│       └── custom_textfield.dart
├── features/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── login_cubit.dart
│   │   └── login_state.dart
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── widgets/
│   │       └── product_card_item.dart
│   └── cart/
│       ├── cart_screen.dart
│       └── cart_provider.dart
└── main.dart
```

## State Management

The application uses Cubit and Provider for different responsibilities.

### Login — Cubit

`LoginCubit` manages the login flow using the following states:

- `LoginInitial`: Initial state
- `LoginLoading`: Login is in progress
- `LoginSuccess`: Login succeeds when both fields are non-empty
- `LoginError`: Represents a login validation error

`BlocBuilder` updates the UI according to the current state, while `BlocListener` handles navigation and error messages.

Authentication is mocked; no real authentication service or backend is connected.

### Cart — Provider

`CartProvider` extends `ChangeNotifier` and manages the shared cart data.

It handles:

- Adding products to the cart
- Increasing and decreasing quantities
- Removing products
- Clearing the cart
- Calculating the total price

`notifyListeners()` notifies listening widgets when the cart changes. The `CartScreen` uses `context.watch<CartProvider>()` to rebuild when the cart data updates, while `context.read<CartProvider>()` is used to execute actions without listening for changes.

The provider is registered above the `MaterialApp`, allowing the Home and Cart screens to access the same cart state while navigating between them.

## Technical Decisions

- **Mock Authentication:** Real authentication was outside the scope of the assignment.
- **Cubit for Login:** Separates login state and business logic from the UI.
- **Provider for Cart:** Shares cart data across screens and centralizes cart operations.
- **Feature-Based Structure:** Groups related files by application feature.
- **Reusable Widgets:** Common UI elements, including buttons and text widgets, are reused.
- **Mock Checkout:** A confirmation dialog simulates a successful order; no real payment is processed.

## Challenges

One of the main challenges was keeping cart data consistent between the Home and Cart screens.

This was addressed by moving cart management into `CartProvider`, allowing both screens to access the same data and react to changes.

Another consideration was managing different login states and displaying a loading indicator while the mock login process runs.

## Production Improvements

If the application were developed for production, I would consider adding:

- Real authentication and secure session handling
- Backend API integration
- Database integration
- Dedicated product and cart models
- Persistent cart storage
- Real payment integration
- Improved error handling
- Unit and widget testing
- Product search and filtering

## Getting Started

Make sure Flutter is installed and configured correctly.

Install project dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

Built with Flutter and Dart for the AfaaqWare Flutter assignment.