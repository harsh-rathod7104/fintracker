import 'package:fintracker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTimeRange _range = DateTimeRange(
      start: DateTime.now().subtract(Duration(days: DateTime.now().day - 1)),
      end: DateTime.now());

  // Date and time Range
  void handleChooseDateRange() async {
    final selected = await showDateRangePicker(
      context: context,
      initialDateRange: _range,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        _range = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi! Good Morning"),
                  Text(
                    "Harsh",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 190,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 170,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      onPageChanged: (int index) {},
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              stops: const [0.1, 0.9],
                              colors: [
                                Colors.teal.shade700,
                                Colors.teal,
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$ 1",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.merge(TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  GoogleFonts.jetBrainsMono()
                                                      .fontFamily,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Text(
                                      "Balance",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.apply(
                                              color: Colors.white
                                                  .withValues(alpha: 0.9)),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Cash",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.apply(
                                                  color: Colors.white
                                                      .withValues(alpha: 1),
                                                  fontWeightDelta: 2),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Icon(
                                          Icons.wallet,
                                          color: Colors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(1, (context) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                          height: 6,
                          width: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(60)),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Text(
                    "Payments",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const Expanded(child: SizedBox()),
                  MaterialButton(
                    height: double.minPositive,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      handleChooseDateRange();
                    },
                    child: Row(
                      children: [
                        Text(
                          "${DateFormat("dd MMM").format(_range.start)} - ${DateFormat("dd MMM").format(_range.end)}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: ThemeColors.success.withValues(alpha: 0.2),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Income",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 5),
                            Text("50,000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: ThemeColors.success,
                                  fontFamily:
                                      GoogleFonts.jetBrainsMono().fontFamily,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: ThemeColors.error.withValues(alpha: 0.2),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Income",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 5),
                            Text("50,000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: ThemeColors.error,
                                  fontFamily:
                                      GoogleFonts.jetBrainsMono().fontFamily,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueAccent,
                    ),
                    child: Icon(Icons.house),
                  ),
                  title: Text(
                    "Recharge",
                    style: Theme.of(context).textTheme.bodyMedium?.merge(
                          const TextStyle(fontWeight: FontWeight.w500),
                        ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: Colors.grey.withAlpha(25),
                  height: 1,
                  margin: const EdgeInsets.only(left: 75, right: 20),
                );
              },
              itemCount: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
