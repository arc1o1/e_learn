import 'package:e_learn/features/widgets/section_header.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var
    List<String> topSearches = [
      'Physics',
      "Mock Form 4",
      "Algebra",
      "Chemistry",
      "Trigonometry",
      "Kiswahili",
      "Language",
      "Probability",
    ];

    List<String> categories = [
      'Nursery',
      'Primary',
      'O-Level',
      'A-Level',
      'Skill-Based Learning',
      'Exams',
      'Books',
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Search",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          // search textfield
          Container(
            color: Colors.transparent,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0x35412E81),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10000),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: "Search",
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),

          // Items to show if nothing is being typed in the search bar
          Column(
            children: [
              const SizedBox(height: 40),

              // top search section
              // section header
              SectionHeader(title: "Top Searches", showActionButton: false),

              const SizedBox(height: 20),

              // top searches them selves
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 2,
                  runSpacing: 3,
                  children: topSearches
                      .map(
                        (topSearch) => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: Colors.black45),
                          ),
                          child: Text(
                            topSearch,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              const SizedBox(height: 30),

              // all categories section
              // section header
              SectionHeader(title: "Categories", showActionButton: false),

              const SizedBox(height: 10),

              // categories
              Container(
                height: 350,
                color: Colors.transparent,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 5),
                  itemBuilder: (_, index) => Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(bottom: BorderSide(color: Colors.black12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // category name
                        Text(
                          categories[index],
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                        ),

                        // icon
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // all lessons
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(1000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 5,
                  ),
                  child: Text(
                    "See all lessons",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorStrings.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
