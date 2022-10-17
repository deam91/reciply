import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/dashboard/controllers/recipes_providers.dart';
import 'package:recipe_app/dashboard/models/constants.dart';

class FilterModal extends ConsumerStatefulWidget {
  const FilterModal({super.key});

  @override
  ConsumerState<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends ConsumerState<FilterModal> {
  int selectedTimeChoice = -1;
  int selectedRateChoice = -1;
  int selectedTagChoice = -1;

  @override
  void initState() {
    super.initState();
    final filter = ref.read(searchFilters);
    if (filter.time != null) {
      selectedTimeChoice = TimeEnum.values.indexOf(filter.time!);
    }
    if (filter.tag != null) {
      selectedTagChoice = TagEnum.values.indexOf(filter.tag!);
    }
    if (filter.star != null) {
      selectedRateChoice = StarsEnum.values.indexOf(filter.star!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          const Text('Filter search'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Time'),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: TimeEnum.values.length,
                  itemBuilder: (_, index) {
                    final isSelected = selectedTimeChoice == index;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedTimeChoice = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Chip(
                          shape: const StadiumBorder(),
                          backgroundColor: isSelected
                              ? const Color(0xff129575)
                              : Colors.white,
                          elevation: 0,
                          side: const BorderSide(color: Color(0xff129575)),
                          label: Text(
                            TimeEnum.values[index].value,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xff129575),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Text('Rate'),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: StarsEnum.values.length,
                  itemBuilder: (_, index) {
                    final isSelected = selectedRateChoice == index;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedRateChoice = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Chip(
                          shape: const StadiumBorder(),
                          backgroundColor: isSelected
                              ? const Color(0xff129575)
                              : Colors.white,
                          elevation: 0,
                          side: const BorderSide(color: Color(0xff129575)),
                          avatar: Icon(
                            Icons.star_rounded,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xff129575),
                          ),
                          label: Text(
                            StarsEnum.values[index].value,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xff129575),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Text('Tags'),
              Wrap(
                children: List.generate(TagEnum.values.length, (index) {
                  final isSelected = selectedTagChoice == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedTagChoice = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Chip(
                        shape: const StadiumBorder(),
                        backgroundColor:
                            isSelected ? const Color(0xff129575) : Colors.white,
                        elevation: 0,
                        side: const BorderSide(color: Color(0xff129575)),
                        label: Text(
                          TagEnum.values[index].value,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xff129575),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: MaterialButton(
                  elevation: 0,
                  // minWidth: double.infinity - 60,
                  height: 50,
                  color: const Color(0xff129575),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(5),
                  onPressed: () {
                    final searchFilter = SearchFilter(
                        tag: selectedTagChoice > -1
                            ? TagEnum.values[selectedTagChoice]
                            : null,
                        star: selectedRateChoice > -1
                            ? StarsEnum.values[selectedRateChoice]
                            : null,
                        time: selectedTimeChoice > -1
                            ? TimeEnum.values[selectedTimeChoice]
                            : null);
                    context.router.pop(searchFilter);
                  },
                  child: const Text(
                    'Filter',
                    style: TextStyle(color: Colors.white),
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
