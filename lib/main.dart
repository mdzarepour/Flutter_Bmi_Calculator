import 'core/imports/import_core.dart';
import 'screens/input_screen/input_screen.dart';

void main(List<String> args) => runApp(const BmiCalculator());

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const InputScreen(),
    );
  }
}
