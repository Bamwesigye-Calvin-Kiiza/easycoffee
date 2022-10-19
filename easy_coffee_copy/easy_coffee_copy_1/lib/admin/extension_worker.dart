import 'package:flutter/material.dart';

class extension_worker extends StatelessWidget {
  const extension_worker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 234, 224),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Center(child: CircularProgressIndicator())
            Text('Welcome Extension worker',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.brown, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
    ;
  }
}
