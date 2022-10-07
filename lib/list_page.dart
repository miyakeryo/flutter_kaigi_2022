import 'package:flutter/material.dart';

import 'my_list_item.dart';
import 'ore_theme.dart';
import 'settings_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リストページ'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const SettingsPage(),
                fullscreenDialog: true,
              ));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, i) {
          Widget widget = MyListItem(
            title: 'タイトル',
            description: 'ここに説明がはいります。ここに説明がはいります。ここに説明がはいります。',
            createdAt: DateTime.now().subtract(Duration(minutes: i)),
          );
          if (i % 3 == 2) {
            widget = OreTheme(
              data: OreTheme.of(context).copyWith(
                listTitleColor: Colors.green,
                listDescriptionColor: Colors.deepPurpleAccent,
                listCreatedAtColor: Colors.orange,
              ),
              child: widget,
            );
          }
          return widget;
        },
      ),
    );
  }
}
