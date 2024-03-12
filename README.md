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

_no wayayay_

## Project Setup

### Flutter

1. `cd` into `plogathon` folder

```
cd plogathon
```

2. Download `onboarding.gif` into `plogathon/assets`
3. Copy config file

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
