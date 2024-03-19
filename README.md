## Plogathon

Pang Zi Jian Adrian <br>
Peter Febrianto Afandy <br>
Tng Jian Rong <br>
Muhammad Nur Dinie Bin Aziz <br>
Lionel Sim Wei Xian <br>
Ryan Lai Wei Shao <br>

## Overview

Welcome to our innovative Plogathon application designed to revolutionize waste management and promote recycling through the engaging activity of plogging! Our app integrates cutting-edge machine learning 'Zero Shot' to classify recyclable items in real-time during your plogging sessions, then guiding you to nearby recycling bins for proper disposal. Developed using Flutter for seamless mobile experience and leveraging cloud-native computing for efficient data processing, our project aligns with several Sustainable Development Goals (SDGs), fostering a cleaner planet and advocating for good health and personal well-being. Join us in making a Cleaner World for tomorrow, One stride at a time!

## System Architecture

![image](https://github.com/ptrpfa/CSC2102-PSD2/assets/49118372/391c82aa-7c34-4211-9ff1-ea08b9b9eadc)

## Ports and IP Addresses

### Recycling Classification Service (Not Up)
- **Service Name:** plog-classify-service
- **IP Address:** 34.73.225.113
- **Port:** 5000

### Activity Service 
- **Service Name:** plog-activity-service
- **IP Address:** 34.73.192.194
- **Port:** 5001

### User Service 
- **Service Name:** plog-user-service
- **IP Address:** 35.196.43.2
- **Port:** 5002

## Project Setup

### Flutter

1. `cd` into `plogathon` folder

```
cd plogathon
```

2. Copy config file

```
cp env/config-example.json env/config.json
```

3. Edit `env/config.json` and add google maps api key
4. Install dependencies

```
flutter pub get
```

5. Select your device and run flutter referencing the config file

```
flutter run --dart-define-from-file env/config.json
```

_To install as an APK._
```
flutter run --dart-define-from-file env/config.json --release
```

# Archive
_This section contains archived content._

### Activity Service (runs on port 5001)

1. `cd` into `activity-service` folder

```
cd activity-service
```

2. Install dependencies

```
npm install
```

3. Run `server.js` referencing `.env` file

```
node --env-file=.env server.js
```

### User Service (runs on port 5002)

1. `cd` into `user-service` folder

```
cd user-service
```

2. Install dependencies

```
npm install
```

3. Run `server.js` referencing `.env` file

```
node --env-file=.env server.js
```
