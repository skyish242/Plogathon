## Plogathon

Pang Zi Jian Adrian <br>
Peter Febrianto Afandy <br>
Tng Jian Rong <br>
Muhammad Nur Dinie Bin Aziz <br>
Lionel Sim Wei Xian <br>
Ryan Lai Wei Shao <br>

## Overview

_oh ma gawd_

## System Architecture


## Project Info

## Ports and IP Addresses

### Recycling Classification Service 
- **Service Name:** plog-classify-service
- **IP Address:** 34.73.225.113
- **Port:** 5000

### Activity Service 
- **Service Name:** plog-activity-service
- **IP Address:** 34.23.233.168
- **Port:** 5001

### User Service 
- **Service Name:** plog-user-service
- **IP Address:** 34.73.60.176
- **Port:** 5002

### Strava Service 
- **Service Name:** plog-strava-service
- **IP Address:** 35.237.20.97
- **Port:** 5003

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
