import 'package:e_learn/features/auth/notifier/auth_notifier.dart';
import 'package:e_learn/features/auth/signup/widgets/basic_information_stepper_form.dart';
import 'package:e_learn/features/auth/signup/widgets/scholar_information_stepper_form.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(
      builder: (context, authNotifier, child) {
        // var
        List<Step> steps = [
          // basic information stepper
          Step(
            isActive: authNotifier.currentStep >= 0,
            state: authNotifier.currentStep > 0
                ? StepState.complete
                : StepState.indexed,
            title: Text(
              "Basic Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            content: BasicInformationStepperForm(),
          ),

          // scholar details stepper
          Step(
            isActive: authNotifier.currentStep >= 0,
            title: Text(
              "Scholar Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            content: ScholarInformationStepperForm(),
          ),
        ];

        bool isFirstStep = authNotifier.currentStep == 0;
        bool isLastStep = authNotifier.currentStep == steps.length - 1;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "SIGN-UP",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: Stepper(
            steps: steps,
            currentStep: authNotifier.currentStep,
            type: StepperType.horizontal,
            onStepContinue: () {
              if (isLastStep) {
                router.go("/");
              } else {
                authNotifier.setCurrentStep(step: authNotifier.currentStep + 1);
              }
            },
            onStepCancel: isFirstStep
                ? null
                : () => authNotifier.setCurrentStep(
                    step: authNotifier.currentStep - 1),
            onStepTapped: (step) => authNotifier.setCurrentStep(step: step),
            controlsBuilder: (context, details) => Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(isLastStep ? "Sign Up" : "Next"),
                    ),
                  ),

                  // spacing
                  if (!isFirstStep) SizedBox(width: 20),

                  if (!isFirstStep)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isFirstStep ? null : details.onStepCancel,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorStrings.secondary),
                        child: Text("Back"),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
