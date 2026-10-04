# Mini E-Commerce App

A simple Flutter mini e-commerce application built as a technical assignment.

The app includes a mock login flow, product browsing, cart management, quantity controls, total
price calculation, and a simple checkout confirmation dialog.

## Features

* Mock login with email and password validation
* Home screen with a collection of products
* Add products to cart
* Increase and decrease product quantity
* Remove products from cart
* Automatic total price calculation
* Cart state preserved while navigating between screens
* Empty cart state
* Simple checkout confirmation dialog
* Cart is cleared after checkout

## Tech Stack

* Flutter
* Dart
* Material Design

## Architecture

The project uses a simple feature-based structure to keep the code organized without adding
unnecessary complexity for a small application.

```text
lib/
├── core/
│   ├── theme/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── home/
│   └── cart/
└── main.dart
```

## State Management

No external state management package was used.

The cart state is managed locally inside the `HomeScreen` using a list of products.

The cart is passed to the `CartScreen`, where quantity updates, product removal, total calculation,
and checkout actions are handled.

This approach was chosen because the application is small and does not require the additional
complexity of Provider, BLoC, or another state management solution.

## Technical Decisions

* **Mock Authentication:** No real backend is required for the login flow.
* **Local Cart State:** The cart is managed locally using Flutter's `setState`.
* **Feature-Based Structure:** Related screens and widgets are grouped by feature.
* **Reusable Widgets:** Common UI elements such as buttons and text widgets are reused.
* **Mock Checkout:** Checkout is simulated using a confirmation dialog.

## Challenges

The main challenge was keeping the cart data consistent while navigating between the Home and Cart
screens.

The cart is maintained in the Home screen and passed to the Cart screen, allowing quantity changes
and removals to update the same cart data.

## Production Improvements

If this application were developed for production, I would add:

* Real authentication
* Backend API integration
* Database integration
* Proper product and cart models
* Dedicated state management
* Persistent cart storage
* Real payment integration
* Loading and error states
* Unit and widget testing
* Product search and filtering

## Getting Started

Make sure Flutter is installed and configured correctly.

Install the project dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Demo

The demo demonstrates:

1. Login
2. Browsing products
3. Adding products to the cart
4. Changing quantities
5. Removing products
6. Viewing the total
7. Completing checkout
8. Clearing the cart after checkout

Built with Flutter and Dart.