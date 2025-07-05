import '../../../core/imports/import_core.dart';
import '../../../models/bmi_model.dart';
import '../../resualt_screen/resualt_screen.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        style: Theme.of(context).filledButtonTheme.style,
        onPressed: () {
          navigateToResualtScreen(context);
        },
        child: const Text(AppStrings.inputCalculateButtonText),
      ),
    );
  }

  void navigateToResualtScreen(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => ResualtScreen(bmiModel: bmiModel),
    );
    Navigator.of(context).push(route);
  }
}
