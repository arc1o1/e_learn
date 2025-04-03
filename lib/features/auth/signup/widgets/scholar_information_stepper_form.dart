import 'package:e_learn/features/auth/notifier/auth_notifier.dart';
import 'package:e_learn/features/auth/widgets/auth_field_items.dart';
import 'package:e_learn/utils/constants/subjects.dart';
import 'package:e_learn/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScholarInformationStepperForm extends StatelessWidget {
  const ScholarInformationStepperForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(
      builder: (context, authNotifier, child) => SingleChildScrollView(
        child: Column(
          children: [
            // scholar category
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Scholar Category",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),

            SizedBox(height: 5),

            SizedBox(
              // height: 40,
              child: DropdownButtonFormField<String>(
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                validator: (value) => Validators.validateEmptyText(
                    'scholar category', value.toString()),
                decoration: InputDecoration(
                  labelText: 'scholar-category',
                  isCollapsed: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                items: scholars
                    .map((scholar) => DropdownMenuItem<String>(
                          value: scholar["name"].toString(),
                          child: Text(scholar["name"].toString()),
                        ))
                    .toList(),
                onChanged: (value) =>
                    authNotifier.setRole(role: value ?? "Student"),
              ),
            ),

            SizedBox(height: 10),

            // school name
            AuthFieldItems(
              title: "School Name",
              labelText: "school-name",
              validator: (value) =>
                  Validators.validateEmptyText("school-name", value),
              keyboardType: TextInputType.name,
            ),

            SizedBox(height: 10),

            // class name
            AuthFieldItems(
              title: "Class Level",
              labelText: "class-level",
              validator: (value) =>
                  Validators.validateEmptyText("class-level", value),
              keyboardType: TextInputType.name,
            ),

            SizedBox(height: 10),

            // if teacher....nida number
            AuthFieldItems(
              title: "NIDA",
              labelText: "nida-id number",
              validator: (value) => Validators.validateEmptyText(
                'nida-id number',
                value,
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 10),

            // phone
            AuthFieldItems(
              title: "Teachers Association ID Number",
              labelText: "TAI ID",
              validator: (value) =>
                  Validators.validateEmptyText('TAI ID', value),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
