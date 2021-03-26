# sirius_flutter

A new Flutter project.

## 01 Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 02 Installing tools for Chrome

$ flutter channel master
$ flutter upgrade
$ flutter config --enable-web

$ flutter devices  //downloads sky_engine and sdk tools then shows a list of devices including chrome

$ flutter create test_app
$ flutter run -d chrome  //local host will run chrome
$ flutter run -d chrome --web-port=42457 // always run on same port

## Create User
# issues a GET request to retrieve tasks with no JWT
# HTTP 403 Forbidden status is expected
curl https://localhost:8080/api/domain/address

# registers a new user
curl -k -H "Content-Type: application/json" -X POST -d '{
    "username": "admin1",
    "password": "admin1",
    "email": "admin1@email.com"
}' https://localhost:8080/api/domain/user/sign_up

# logs into the application (JWT is generated)
curl -i -H "Content-Type: application/json" -X POST -d '{
    "username": "admin123",
    "password": "password",
    "email": "admin123@email.com"
}' https://localhost:8080/login

# issue a POST request, passing the JWT, to create a task
# remember to replace xxx.yyy.zzz with the JWT retrieved above
curl -H "Content-Type: application/json" \
-H "Authorization: Bearer xxx.yyy.zzz" \
-X POST -d '{
    "description": "Buy watermelon"
}'  https://localhost:8080/tasks

# issue a new GET request, passing the JWT
# remember to replace xxx.yyy.zzz with the JWT retrieved above
curl -H "Authorization: {tokken}

## Kill every process that uses port
sudo kill -9 $(sudo lsof -t -i:{port_num})

## Before running flutter in Android studio with emulator
You need to accept the licences before building.
> flutter doctor --android-licenses
and y (accept) on all licencess
## TO DO
# Criteria window
1. Dropdown menu on list will be used for doc. export .pdf, .docx, xlsm

# User settings
1. Settings will allow user to access his current JWT that can be later used for sending curl operations directly. auth will be required.

