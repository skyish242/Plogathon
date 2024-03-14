import 'package:flutter/material.dart';
import 'package:plogathon/db/db.dart';
import 'package:plogathon/model/entry.dart';
import 'package:plogathon/pages/nearby.dart';
import 'package:plogathon/widgets/entry_card.dart';
import 'package:plogathon/services/grpc/activity/activity.pb.dart';
import 'package:plogathon/services/grpc/user/user.pb.dart';
import 'package:plogathon/services/activityservice.dart';
import 'package:plogathon/services/userservice.dart';

class HomePage extends StatefulWidget {
  final int userID;

  const HomePage({Key key = const Key('defaultKey'), required this.userID}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Entry>? _data;
  List<EntryCard> _cards = [];
  final userService = UserService();
  final activityService = ActivityService();
  late String name;

  @override
  void initState() {
    super.initState();
    _fetchUser();
    DB.init().then((value) => _fetchEntries());
  }

  /*
  void _fetchEntries() async {
    _cards = [];
    List<int> cardColors = [0xFFEBFFEE, 0xFFF7FFD6, 0xFFEDFAFF];

    List<Map<String, dynamic>> results = await DB.query(Entry.table);
    _data = results.map((item) => Entry.fromMap(item)).toList();

    /// Each element in data should include:
    /// * Name
    /// * Time
    /// * eco-effort
    /// * mileage
    /// * duration

    int index = 0;
    _data?.forEach((element) {
      _cards.add(
        EntryCard(
          entry: element,
          cardColor: Color(cardColors[index % 3]),
        ),
      );

      index++;
    });

    setState(() {});
  }
  */

  void _fetchUser() async {
    try {
        ProtoUser user = await userService.findOneUser(widget.userID);

        name = user.firstName + " " + user.lastName;
    } catch (e) {
      // Handle login failure
      print('Fetching user failed: $e');
    }
  }
  
  void _fetchEntries() async {
  _cards = [];
  List<int> cardColors = [0xFFEBFFEE, 0xFFF7FFD6, 0xFFEDFAFF];

  try {
    Activities fetchedActivities = await activityService.findAllActivities();
    List<ProtoActivity> activities = fetchedActivities.activities;

    for (int i = 0; i < activities.length; i++) {
      ProtoActivity activity = activities[i];
      ProtoUser tempUser = await userService.findOneUser(activity.userID);

      Entry entry = Entry(
        name: tempUser.firstName + " " + tempUser.lastName,
        wasteCount: activity.wasteCount,
        distance: activity.distance,
      );

      int colorIndex = i % cardColors.length;

      _cards.add(
        EntryCard(
          entry: entry,
          name: tempUser.firstName + " " + tempUser.lastName,
          wasteCount: activity.wasteCount,
          distance: activity.distance,
          cardColor: Color(cardColors[colorIndex]),
        ),
      );
    }

    setState(() {});
  } catch (e) {
    print('Failed to fetch activities: $e');
    // Handle error fetching activities
  }
}

  void _addEntries(Entry en) async {
    DB.insert(Entry.table, en);
    _fetchEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  top: 72.0, left: 12.0, right: 12.0, bottom: 18),
              width: double.infinity,
              child: Card(
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "hello",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF747474),
                            ),
                      ),
                      Text(
                        "drake",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Card(
                                margin: const EdgeInsets.only(
                                    left: 0, right: 0, top: 12),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 20),
                                  child: Column(children: <Widget>[
                                    Text(
                                      "Eco-Effort",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "192",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Text(
                                      "Litter Cleared\nOff The Streets",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ]),
                                )),
                          ),
                          SizedBox(
                            width: 150,
                            child: Card(
                                margin: const EdgeInsets.only(
                                    left: 0, right: 0, top: 12),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 20),
                                  child: Column(children: <Widget>[
                                    Text(
                                      "Mileage",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "452",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Text(
                                      "Kilometers\nTravelled",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ]),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NearbyPage())),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 5,
                            ),
                            child: Text("Start Plogging",
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20.0),
                children: _cards,
              ),
            )
          ],
        ),
      ),
    );
  }
}
