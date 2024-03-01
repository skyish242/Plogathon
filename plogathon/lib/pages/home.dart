import 'package:flutter/material.dart';
import 'package:plogathon/db/db.dart';
import 'package:plogathon/model/entry.dart';
import 'package:plogathon/pages/maps.dart';
import 'package:plogathon/widgets/entry_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key = const Key('defaultKey')}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Entry>? _data;
  List<EntryCard> _cards = [];

  @override
  void initState() {
    super.initState();
    DB.init().then((value) => _fetchEntries());
  }

  void _fetchEntries() async {
    _cards = [];
    List<Map<String, dynamic>> results = await DB.query(Entry.table);
    _data = results.map((item) => Entry.fromMap(item)).toList();
    _data?.forEach((element) => _cards.add(EntryCard(entry: element)));
    setState(() {});
  }

  void _addEntries(Entry en) async {
    DB.insert(Entry.table, en);
    _fetchEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Strava"),
      ),
      body: ListView(
        children: _cards,
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => (),
        onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MapPage()))
            .then((value) => _addEntries(value)),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
