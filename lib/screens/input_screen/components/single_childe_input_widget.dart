import '../../../core/imports/import_core.dart';

class SingleChildInputWidget extends StatelessWidget {
  const SingleChildInputWidget({
    super.key,
    required this.heightValue,
    required this.slider,
  });

  final Widget slider;

  final double heightValue;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 21),
      child: SizedBox(
        height: size.height * 0.22,
        width: size.width,
        child: CardWidget(
          cardChild: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Height', style: textTheme.titleMedium),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: textTheme.displayLarge,
                      text: heightValue.toStringAsFixed(0),
                    ),
                    TextSpan(
                      style: textTheme.displaySmall!.copyWith(
                        color: AppColors.materialWhite,
                      ),
                      text: 'cm',
                    ),
                  ],
                ),
              ),
              slider,
            ],
          ),
        ),
      ),
    );
  }
}
