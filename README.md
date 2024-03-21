![image](https://github.com/skyish242/CSC2102-PSD2/assets/99416793/cf865b91-f40c-4f87-a310-c6bbcefa53c4)

## Plogathon
- Pang Zi Jian Adrian (*2200692*)
- Peter Febrianto Afandy (*2200959*)
- Muhammad Nur Dinie Bin Aziz (*2200936*)
- Tng Jian Rong (*2201014*)
- Lionel Sim Wei Xian (*2201132*)
- Ryan Lai Wei Shao (*2201159*)

## Overview
Plogathon is an innovative mobile application designed to revolutionize waste management and promote recycling through plogging - an exercise introduced in Sweden back in 2016 that combines both jogging and picking up litter. Despite the [increased interest](https://www.straitstimes.com/singapore/environment/plogging-more-keeping-fit-while-clearing-litter) of plogging in Singapore, activities are currently organised using manual means such as Facebook groups. Plogathon aims to streamline this process to promote the adoption of plogging, together with recycling.

Plogathon integrates cutting-edge technologies to guide users to nearby recycling bins for proper waste disposal, as well as machine learning to determine the recyclability of items in real-time during plogging sessions. The mobile application is developed using Flutter to provide a seamless mobile experience, and leverages on cloud-native computing for efficient data processing.

Plogathon aligns with several of the United Nations' Sustainable Development Goals (SDGs), fostering a cleaner planet and advocating for good health and personal well-being. 


| Goal   |      Implementation      | 
|----------|-------------|
| <img src="https://github.com/skyish242/CSC2102-PSD2/assets/99416793/cbe65a80-d4e2-4804-82b1-10b21d9620ff" alt="drawing" width="200"/> |  _**Good Health and Wellbeing**_<br>Plogathon encourages users to engage in physical activities such as running while also cleaning up the environment. Regular physical activity is essential for maintaining good health and preventing various diseases, including heart disease, stroke, diabetes, and various types of cancer. By motivating users to get active outdoors, Plogathon can contribute to improved physical health.| 
|  <img src="https://github.com/skyish242/CSC2102-PSD2/assets/99416793/ec37f3f1-7476-4aff-aae7-3daf610a7a28" alt="drawing" width="200"/> |    _**Quality Education**_<br>Through Plogathon, users not only participate in physical activities but also learn about recycling and proper waste disposal. When they take photos of recyclable items, Plogathon classifies them and provides information on how to correctly recycle each item. This educational component helps users understand the importance of waste segregation and recycling, fostering environmental stewardship.| 
|  <img src="https://github.com/skyish242/CSC2102-PSD2/assets/99416793/e5e72add-e005-4e94-bf99-8b1bff4e9722" alt="drawing" width="200"/> | _**Responsible Consumption and Production**_<br>Plogathon promotes responsible consumption and production by encouraging users to pick up and properly dispose of litter and recylables. By teaching users how to recycle various materials correctly, Plogathon helps reduce waste and promote recycling, leading to more sustainable consumption patterns. Moreover, by highlighting available recycling bins, Plogathon makes recycling more accessible and convenient, encouraging users to incorporate waste reduction practices into their daily lives. |
|   <img src="https://github.com/skyish242/CSC2102-PSD2/assets/99416793/8a5542ae-3f26-419d-bbe2-464e1b101d42" alt="drawing" width="200"/> | _**Climate Action**_<br>By reducing litter and promoting recycling, Plogathon helps decrease the amount of waste that ends up in landfills and incinerators, which are significant sources of greenhouse gas emissions. Moreover, by fostering a culture of sustainability and environmental responsibility, Plogathon can inspire users and communities to adopt more eco-friendly practices in other areas of their lives, contributing to broader efforts to combat climate change. |

<br>
<p align="center"><i>Join us in creating a Cleaner World for tomorrow, One stride at a time!</i></p>

## System Architecture

![image](https://github.com/ptrpfa/CSC2102-PSD2/assets/49118372/391c82aa-7c34-4211-9ff1-ea08b9b9eadc)

## Features

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
