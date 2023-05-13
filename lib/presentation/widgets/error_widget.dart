import 'package:bloc_sample/application/errors/error.dart' as e;

import '../presentation.dart';

class MyErrorWidget extends StatelessWidget {
  final e.Error? error;

  const MyErrorWidget({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error?.message ?? 'Error happened'),
      ),
    );
  }
}
