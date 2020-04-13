# Chative

<img src="https://raw.githubusercontent.com/suryadarmana/chative/master/images/logo.png" alt="Logo of Chative" style="max-width:20%;">

A simple group chat app that has a purpose to demonstrate how to integrate firebase inside flutter app.

## Features
* Login with email and password (Firebase Auth)
* Register New User
* Multiple Person Chat Room

## Screenshot
![Screenshot of Chative](https://raw.githubusercontent.com/suryadarmana/chative/master/screenshot/screenshot.gif)

## How To Clone in Android studio
* Simply copy the repository uri
* Create New Project > Project from version control > Git
* Don't automatically create android project if the dialog shows up
* Open existing project > choose the project directory > open
* After the project open run the ```pub get``` or click the "Get Dependencies" button on the top corner

## Firebase Setup
* This project already configured in order to use firebase but you have to add the google-services.json manually with your own
* To get the google-service.json file please setup your firebase project via firebase console by using this project application id on ```android/app/build.gradle```
* Place the google-services.json in : ```android/app```

## Flutter Project Structure

chative/
 - lib/
  - components/
    - form_button.dart
    - form_input.dart
    - message_box.dart
    - message_bubble.dart
    - message_stream.dart
  - screens/
    - chat_screen.dart
    - login_screen.dart
    - register_screen.dart
    - welcome_screen.dart
  - utils/
    - constants.dart
    - dateutils.dart
  - main.dart



## Status
**[DEMO]**

## Built With

* **Language:** *Dart*
* **Framework:** *Flutter*
* **IDE:** *Android Studio*

## Author

* **Surya Darmana** - *Initial Work* - igm.surya@ui.ac.id



