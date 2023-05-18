import '../../application/application.dart';
import '../presentation.dart';

const appBarTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

class AppBarColorize extends StatelessWidget {
  const AppBarColorize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.appBarGradientStop1,
            AppColors.appBarGradientStop2,
            AppColors.appBarGradientStop3,
          ],
          transform: GradientRotation(3),
        ),
      ),
    );
  }
}
