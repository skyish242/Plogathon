import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:plogathon/model/entry.dart';
import 'package:plogathon/pages/login.dart';
import 'package:plogathon/pages/nearby.dart';
import 'package:plogathon/widgets/entry_card.dart';
import 'package:plogathon/services/grpc/activity/activity.pb.dart';
import 'package:plogathon/services/grpc/user/user.pb.dart';
import 'package:plogathon/services/activityservice.dart';
import 'package:plogathon/services/userservice.dart';

class HomePage extends StatefulWidget {
  final int userID;

  const HomePage({Key key = const Key('defaultKey'), required this.userID})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EntryCard> _cards = [];
  final userService = UserService();
  final activityService = ActivityService();
  String _name = '';
  int _userWasteCount = 0;
  double _userMileageCount = 0.0;
  bool _isAllSelected = true;

  bool _isLoading = true;
  bool _initialLoad = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _fetchUser();
    _fetchAllEntries();
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

  /*
  void _addEntries(Entry en) async {
    DB.insert(Entry.table, en);
    _fetchEntries();
  }
  */

  void _fetchUser() async {
    try {
      ProtoUser user = await userService.findOneUser(widget.userID);

      setState(() {
        _name = "${user.firstName} ${user.lastName}";
      });
    } catch (e) {
      print('Fetching user failed: $e');
    }
  }

  int _calculateTimeDifference(String savedDateTimeString) {
    DateFormat format = DateFormat("EEE MMM dd yyyy HH:mm:ss 'GMT'Z", 'en');
    DateTime savedDateTime = format.parse(savedDateTimeString);
    Duration difference = DateTime.now().difference(savedDateTime);
    int differenceInMinutes = difference.inMinutes;

    return differenceInMinutes;
  }

  void _fetchAllEntries() async {
    List<int> cardColors = [0xFFEBFFEE, 0xFFF7FFD6, 0xFFEDFAFF];

    List<EntryCard> cards = [];
    try {
      Activities fetchedActivities = await activityService.findAllActivities();
      List<ProtoActivity> activities = fetchedActivities.activities;

      for (int i = activities.length - 1; i >= 0; i--) {
        ProtoActivity activity = activities[i];
        ProtoUser tempUser = await userService.findOneUser(activity.userID);

        if (tempUser.userID == widget.userID && !_initialLoad) {
          _userWasteCount += activity.wasteCount;
          _userMileageCount += activity.distance;
          setState(() {
            _initialLoad = true;
          });
        }

        int colorIndex = i % cardColors.length;

        cards.add(
          EntryCard(
            name: "${tempUser.firstName} ${tempUser.lastName}",
            wasteCount: activity.wasteCount,
            distance: activity.distance,
            duration: activity.duration,
            time: _calculateTimeDifference(activity.datetime),
            cardColor: Color(cardColors[colorIndex]),
          ),
        );
      }
      setState(() {
        _cards = List<EntryCard>.from(cards);
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch activities: $e');
    }
  }

  void _fetchMyEntries() async {
    List<int> cardColors = [0xFFEBFFEE, 0xFFF7FFD6, 0xFFEDFAFF];
    List<EntryCard> cards = [];

    try {
      Activities fetchedActivities = await activityService.findAllActivities();
      List<ProtoActivity> activities = fetchedActivities.activities;

      for (int i = activities.length - 1; i >= 0; i--) {
        ProtoActivity activity = activities[i];
        ProtoUser tempUser = await userService.findOneUser(activity.userID);

        if (tempUser.userID == widget.userID) {
          if (!_initialLoad) {
            setState(() {
              _userWasteCount += activity.wasteCount;
              _userMileageCount += activity.distance;
              _initialLoad = true;
            });
          }

          int colorIndex = i % cardColors.length;

          cards.add(
            EntryCard(
              name: "${tempUser.firstName} ${tempUser.lastName}",
              wasteCount: activity.wasteCount,
              distance: activity.distance,
              duration: activity.duration,
              time: _calculateTimeDifference(activity.datetime),
              cardColor: Color(cardColors[colorIndex]),
            ),
          );
        }
      }
      setState(() {
        _cards = List<EntryCard>.from(cards);
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch activities: $e');
    }
  }

  void _fetchEntries() async {
    _cards = [];

    setState(() {
      _isLoading = true;
    });

    if (_isAllSelected) {
      _fetchAllEntries();
    } else {
      _fetchMyEntries();
    }
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
                  top: 64.0, left: 12.0, right: 12.0, bottom: 9),
              width: double.infinity,
              child: Card(
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 16, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "hello,",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: const Color(0xFF747474),
                                  ),
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/logout.svg",
                                semanticsLabel: 'logout',
                              ),
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                                (Route<dynamic> route) => false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 140,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 0, top: 12),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 20),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Eco-Effort",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    _initialLoad
                                        ? Text(
                                            _userWasteCount.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          )
                                        : Container(
                                            padding: const EdgeInsets.only(
                                                top: 6, bottom: 6),
                                            child:
                                                const CircularProgressIndicator(),
                                          ),
                                    Text(
                                      "Litter Cleared\nOff The Streets",
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 0, top: 12),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 20),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Mileage",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    _initialLoad
                                        ? Text(
                                            _userMileageCount
                                                .toStringAsFixed(2),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          )
                                        : Container(
                                            padding: const EdgeInsets.only(
                                                top: 6, bottom: 6),
                                            child:
                                                const CircularProgressIndicator(),
                                          ),
                                    Text(
                                      "Kilometers\nTravelled",
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        _isAllSelected = index == 0;
                        _fetchEntries();
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderColor: Theme.of(context).colorScheme.primary,
                    selectedColor: Theme.of(context).colorScheme.onPrimary,
                    selectedBorderColor: Theme.of(context).colorScheme.primary,
                    fillColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).colorScheme.onSecondary,
                    isSelected: [_isAllSelected, !_isAllSelected],
                    constraints:
                        const BoxConstraints(minHeight: 40, minWidth: 150),
                    children: const [
                      Text(
                        'All',
                      ),
                      Text(
                        'Mine',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _isLoading
                ? Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: const CircularProgressIndicator(),
                  )
                : Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: _cards,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
