import 'package:first_job/Theme/Colors/colors.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(context),
        body: ListView(
          children: [
            Column(
              children: [
                const StepWidget(),
                DateTimeWidget(),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sender details',
                            style: TextStyle(
                              color: Color(0xFF172027),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              height: 0.08,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ThemeColor.mainOrange),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Add adress',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0.10,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ThemeColor.displayGray),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Select address',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF919DAB),
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0.10,
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Container DateTimeWidget() {
    return Container(
      color: ThemeColor.displayWhite,
      width: double.infinity,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Start date',
                style: TextStyle(
                  color: ThemeColor.textBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              readOnly: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.date_range,
                  color: ThemeColor.mainGray,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.50, color: Color(0xFFA9B5C1)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                hintText: "Date",
              ),
              onTap: _selectDate,
              controller: _dateController,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (date != null) {
      setState(() {
        _dateController.text = date.toString().split(' ')[0];
      });
    }
  }

  AppBar AppBarWidget(BuildContext context) {
    return AppBar(
        centerTitle: true,
        toolbarHeight: 56,
        leading: SizedBox(
            width: 20,
            height: 20,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_left,
                  size: 30,
                  weight: 600,
                  color: ThemeColor.textBlackColor,
                ))),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text(
          'Ordering',
          style: TextStyle(
            color: ThemeColor.textBlackColor,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(
            height: 2,
            color: ThemeColor.displayGray,
          ),
        ));
  }
}

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.displayWhite,
      width: double.infinity,
      height: 45,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'Step 1',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ThemeColor.mainBlack,
            fontSize: 16,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.16,
          ),
        ),
      ),
    );
  }
}
