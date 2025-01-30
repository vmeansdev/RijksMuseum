# RijksMuseum App

This app was developed as a technical assignment for Albert Heijn. It runs on both iPhone and iPad, supporting light and dark themes as well as dynamic fonts.

## How to Run the App

To avoid committing secrets to the repository, the API key must be provided manually. You can do this in one of two ways:

1. Run the `update_api_key.sh` script with the API key as an argument:
   ```sh
   ./update_api_key.sh aWes0MeAp1Key
   ```
2. Manually replace the placeholder value in `RijksMuseum/App/Configuration/Production.xcconfig`:
   ```
   API_KEY_GOES_HERE
   ```

## App Dependencies

### Dependencies created for the app

- **RijksData**: Handles network requests, response models, and services.
- **RijksUI**: Contains views, view models, table cells, loading, and error screens.

### Dependencies used by but not created within and specificatlly for the app

- **AppHttpKit**: A custom HTTP client I previously created to avoid relying on third-party solutions or using `URLSession` directly.
- **PlistReader**
- **AnyCodable**: A dependency of `AppHttpKit`.
- **Kingfisher**: Used for efficient image loading and caching.

## Architecture

The app follows the **VIP (View-Interactor-Presenter) architecture** with **coordinators** for navigation management.

## Dependency Injection (DI)

A basic "poor man's DI" approach is implemented. While this isn't ideal for a real-world production app, where a dependency injection framework like **Swinject** would be preferred, this approach demonstrates an enterprise-style setup with extendability, flexibility, and testability in mind.

## Features

The app consists of two main screens:

- **Main Screen (Overview)**:

  - Supports infinite scroll (pagination)
  - Handles loading and error states with retry functionality

- **Details Screen**:

  - Displays an artwork image with relevant information below

## Tests
Almost everything is covered with tests except ArtworkDetails but we can discuss 

## Nice to have but not added
- SwiftLint
- SwiftFormat
- Sourcery

---

This project demonstrates best practices in architecture, dependency management, and UI design while keeping the implementation scalable and testable.

