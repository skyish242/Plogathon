import 'package:flutter/material.dart';
import 'package:plogathon/pages/home.dart';
import 'package:plogathon/services/grpc/activity/activity.pb.dart';
import 'package:plogathon/services/activity_service.dart';
import 'package:plogathon/services/provider.dart';
import 'package:plogathon/services/strava_service.dart';
import 'package:strava_client/strava_client.dart' as stravalib;

class EndPage extends StatefulWidget {
  final int userID = Provider().userId;
  final double distance;
  final int time;
  final int wasteCount;
  final int stepCount;

  EndPage({
    Key key = const Key('defaultKey'),
    required this.distance,
    required this.time,
    required this.wasteCount,
    required this.stepCount,
  }) : super(key: key);

  @override
  State<EndPage> createState() {
    return _EndPageState();
  }
}

class _EndPageState extends State<EndPage> {
  final activityService = ActivityService();
  final _thoughtsController = TextEditingController();
  final _activityNameController = TextEditingController();
  stravalib.ActivityTypeEnum _selectedActivityType =
      stravalib.ActivityTypeEnum.Run;

  final _focusNode = FocusNode();

  bool _isUploading = false;

  double convertDistance() {
    // Assuming meters
    if (widget.distance > 1000) {
      double distanceInKm = (widget.distance / 1000);
      return distanceInKm;
    }

    return widget.distance.toDouble();
  }

  String convertTime() {
    // Convert to seconds
    int seconds = (widget.time / 1000).floor();
    int minutes = 0;
    if (seconds > 60) {
      // Get minutes
      minutes = (seconds / 60).floor();
    }
    seconds = seconds - minutes * 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void uploadActivity() async {
    try {
      setState(() {
        _isUploading = true;
      });

      final newActivity = Activity(
        userID: widget.userID,
        name: _activityNameController.text,
        type: _selectedActivityType.name,
        description: _thoughtsController.text,
        datetime: DateTime.now().toIso8601String(),
        routeMap: 'Test Route Map',
        distance: convertDistance(),
        steps: widget.stepCount,
        wasteCount: widget.wasteCount,
        duration: (widget.time / 1000).floor(),
      );

      await activityService.createActivity(newActivity);

      // DB uploaded
      // Try to Upload Strava, if user is linked with strava
      if (StravaService().checkStravaAuthenticated()) {
        StravaService()
            .postAthleteActivity(stravalib.CreateActivityRequest(
                _activityNameController.text,
                _selectedActivityType,
                DateTime.now(),
                (widget.time / 1000).floor(),
                _thoughtsController.text,
                convertDistance(),
                false,
                false))
            .catchError((onError) {
          throw onError;
        });
      }
      ;
      setState(() {
        _isUploading = false;
      });

      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Activity uploaded!',
                style: TextStyle(color: Colors.white)),
            content: const Text('Your activity has been successfully saved.',
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Upload Failed',
                style: TextStyle(color: Colors.white)),
            content:
                Text(e.toString(), style: const TextStyle(color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          // Unfocus the text field when tapped outside
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  "assets/onboarding.gif",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: IntrinsicHeight(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 140),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Every step counts",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: const Color(0xFFEDFB92)),
                          ),
                          Text(
                            "Every Piece Picked Up,\nA Cleaner World Awaits.",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(height: 40),
                          Card(
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Eco-effort",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Text("+${widget.wasteCount}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        )
                                      ],
                                    ),
                                    const VerticalDivider(
                                      width: 20,
                                      thickness: 0.5,
                                      endIndent: 0,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Mileage",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Text(
                                              "${convertDistance() > 100 ? convertDistance() ~/ 1000 : convertDistance()} ${convertDistance() > 100 ? 'km' : 'm'}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        )
                                      ],
                                    ),
                                    const VerticalDivider(
                                      width: 20,
                                      thickness: 0.5,
                                      endIndent: 0,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Time",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Text(convertTime(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 64,
                              child: TextField(
                                controller: _activityNameController,
                                cursorColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: const Color(0xFFB3B3B3),
                                      ),
                                  fillColor: const Color(0xFFEEEEEE),
                                  filled: true,
                                  hintText: 'Activity name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 12, bottom: 12.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 64,
                              child: DropdownButtonFormField<
                                  stravalib.ActivityTypeEnum>(
                                value: _selectedActivityType,
                                onChanged:
                                    (stravalib.ActivityTypeEnum? newValue) {
                                  setState(() {
                                    _selectedActivityType = newValue!;
                                  });
                                },
                                // cursorColor: Theme.of(context).colorScheme.onPrimary,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      // Set the text color here
                                      color: const Color(
                                          0xFFB3B3B3), // Change it to the desired color
                                    ),
                                decoration: InputDecoration(
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: const Color(0xFFB3B3B3),
                                      ),
                                  fillColor: const Color(0xFFEEEEEE),
                                  filled: true,
                                  hintText: 'Activity type',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                items: ['Walk', 'Run', 'Wheelchair', 'Workout']
                                    .map((String activityType) {
                                  return DropdownMenuItem<
                                      stravalib.ActivityTypeEnum>(
                                    value: stravalib.ActivityTypeEnumHelper
                                        .getType(activityType),
                                    child: Text(activityType),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _thoughtsController,
                                      focusNode: _focusNode,
                                      keyboardType: TextInputType.multiline,
                                      maxLength: 200,
                                      minLines: 5,
                                      maxLines: 5,
                                      cursorColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(20.0),
                                        counterStyle: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: const Color(0xFFB3B3B3),
                                            ),
                                        fillColor: const Color(0xFFEEEEEE),
                                        filled: true,
                                        hintText: 'Share Your Thoughts..',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              "* Remember to Dispose Your Trash Appropriately",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: const Color(0xFFEDFB92)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: _isUploading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ElevatedButton(
                                    onPressed: () {
                                      convertTime();
                                      uploadActivity();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                    child: Text("Upload",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
