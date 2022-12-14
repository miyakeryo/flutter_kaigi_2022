import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ore_theme.dart';

class MyListItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime createdAt;
  const MyListItem({
    super.key,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  static final _datetimeFormat = DateFormat('yyyy/M/d H:mm');

  @override
  Widget build(BuildContext context) {
    final oreTheme = Theme.of(context).oreTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  'https://www.dummyimage.online/180x180/666666/ffffff',
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: oreTheme.listTitleColor,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: oreTheme.listDescriptionColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _datetimeFormat.format(createdAt),
                    style: TextStyle(
                      fontSize: 10,
                      color: oreTheme.listCreatedAtColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Divider(height: 1),
      ],
    );
  }
}
