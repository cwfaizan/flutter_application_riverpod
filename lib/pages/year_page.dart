import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/hello_provider.dart';

class YearPage extends StatelessWidget {
  const YearPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) => Text(
            '${ref.watch(yearProvider)}',
          ),
        ),
      ),
    );
  }
}
