# Flutter Secrets Demo

A simple Flutter application that demonstrates how to securely manage configuration values using Dart compile-time environment variables.

## Features

- Read API keys and configuration values from environment variables.
  
- Avoid hardcoding sensitive information in source code.
  
- Display configuration values in the app UI.
  
- Print configuration values to the console during startup.

## Security Benefits

- Keeps secrets out of source code.
  
- Prevents accidental exposure of API keys in Git repositories.
  
- Allows different configurations for development, staging, and production environments.

## Output

Console:

```text
API Key: 123456789
Base URL: https://newsapi.org
```

App Screen:

```text
Secrets Demo
API Key: 123456789
```

## Technologies Used

- Flutter
  
- Dart
  
- Material Design

