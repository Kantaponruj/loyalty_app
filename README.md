# Loyalty Demo App

## Flutter Loyalty Rewards App

A sample Flutter application demonstrating a loyalty rewards system with a login page and a home page displaying redeemable rewards. The app is built following the MVVM (Model-View-ViewModel) architectural pattern and uses Provider for state management.

## Getting Started

Follow these steps to get the project up and running on your local machine.

### Prerequisites

- Flutter SDK installed (version 3.x.x or higher recommended).

- A code editor (VS Code, Android Studio).

### Installation

1. **Clone the repository (or open the existing project):**

   ```
   git clone <repository_url>
   ```

   Then run:

   ```
   flutter pub get
   ```

2. **Copy the code:**
   Replace the entire content of your `lib` folder with the code provided in the previous responses. Ensure the file structure matches the one described above (create `models`, `services`, `viewmodels`, `views`, and `views/widgets` directories as needed).

### Running the App

1. **Connect a device or start an emulator/simulator.**

2. **Run the application:**
   ```
   flutter run
   ```

## Usage

1. **Login Page:**

- Use the mock credentials:

  - **Email:** `test@example.com`

  - **Password:** `password`

- Click the "Login" button.

2. **Home Page:**

- Upon successful login, you will be redirected to the home page displaying a list of mock loyalty rewards.

- Each reward card shows its name, image, points required, and a description.

- Clicking "Redeem Reward" will show a snackbar notification (mock redemption).

- Use the "Logout" button in the AppBar to return to the login screen.
