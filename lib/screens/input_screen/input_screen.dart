import '../../core/imports/import_core.dart';
import '../../models/bmi_model.dart';
import '../../core/imports/import_input_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputPageState();
}

class _InputPageState extends State<InputScreen> {
  late BmiModel bmiModel;
  @override
  void initState() {
    bmiModel = BmiModel(age: 0, gender: Gender.ungender, height: 0, weight: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inputAppBarTitle)),
      body: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox.shrink(),
          InputScreenTwinInputWidget(
            // male card -->
            leftSideWidget: GlobalCardWidget(
              cardColor: bmiModel.gender == Gender.male
                  ? colorScheme.primary
                  : colorScheme.secondary,
              cardChild: GestureDetector(
                onTap: () => genderUpdate(Gender.male),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.male),
                    Text(
                      style: textTheme.titleMedium,
                      AppStrings.inputMaleLable,
                    ),
                  ],
                ),
              ),
            ),
            // female card -->
            rightSideWidget: GlobalCardWidget(
              cardColor: bmiModel.gender == Gender.female
                  ? colorScheme.primary
                  : colorScheme.secondary,
              cardChild: GestureDetector(
                onTap: () => genderUpdate(Gender.female),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.female),
                    Text(
                      style: textTheme.titleMedium,
                      AppStrings.inputFemaleLable,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // height card -->
          InputScreenHeightInputWidget(
            heightValue: bmiModel.height,
            slider: Slider(
              min: 0,
              max: 200,
              value: bmiModel.height,
              onChanged: (value) => heightUpdate(value),
            ),
          ),
          InputScreenTwinInputWidget(
            // weight card -->
            leftSideWidget: GlobalCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    style: textTheme.titleMedium,
                    AppStrings.inputWeightLable,
                  ),
                  Text(
                    style: textTheme.displayLarge,
                    bmiModel.weight.toString(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => weightUpdate(ChangeType.increase),
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () => weightUpdate(ChangeType.decrease),
                        icon: const Icon(size: 15, Icons.arrow_downward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // age card -->
            rightSideWidget: GlobalCardWidget(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(style: textTheme.titleMedium, AppStrings.inputAgeLable),
                  Text(style: textTheme.displayLarge, bmiModel.age.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => ageUpdate(ChangeType.increase),
                        icon: const Icon(size: 15, Icons.arrow_upward),
                      ),
                      IconButton(
                        onPressed: () => ageUpdate(ChangeType.decrease),
                        icon: const Icon(size: 15, Icons.arrow_downward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InputScreenCalculationButtonWidget(bmiModel: bmiModel),
        ],
      ),
    );
  }

  void genderUpdate(Gender gender) {
    setState(() => bmiModel.updateGender(gender));
  }

  void heightUpdate(double height) {
    setState(() => bmiModel.updateHeight(height));
  }

  void weightUpdate(ChangeType changeType) {
    setState(() => bmiModel.updateWeight(changeType));
  }

  void ageUpdate(ChangeType changeType) {
    setState(() => bmiModel.updateAge(changeType));
  }
}
