import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //to use shared prefrence
  //set counter
  setCount(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('counter', value);
    getValues();
  }

  //set time
  setTime(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('time', value);
    getValues();
  }

  //set target
  setTarget(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('target', value);
    getValues();
  }

//get counter
  getValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
      time = prefs.getInt('time') ?? 0;
      target = prefs.getInt('target') ?? 0;
    });
  }

  @override
  void initState() {
    getValues();
    super.initState();
  }

  int radio = 0;

  int appColor = 0xffC62828;
  TextDirection textDecoration = TextDirection.rtl;
  int counter = 0;
  int time = 0;
  int target = 0;
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(appColor);
    return Directionality(
      textDirection: textDecoration,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            setState(() {
              counter = 0;
            });
          },
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.color_lens,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(color: mainColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Text(
                      'الهدف',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setTarget(target + 1);
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$target',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setTarget(target - 1);
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setTarget(target + 1000);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '1000+',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setTarget(target + 100);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '100+',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setTarget(target = 100);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '100',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setTarget(target = 33);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '33',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setTarget(target = 0);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '0',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'الاستغفار',
                  style: TextStyle(
                      fontSize: 24,
                      color: mainColor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$counter',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 6.0,
                  percent: counter / 33,
                  center: IconButton(
                    iconSize: 50.0,
                    color: mainColor,
                    onPressed: () {
                      setState(
                        () {
                          if (counter == 33) {
                            setTime(time + 1);
                            setCount(counter = 0);
                          }
                          setCount(counter + 1);
                        },
                      );
                    },
                    icon: const Icon(Icons.touch_app),
                  ),
                  backgroundColor: mainColor.withOpacity(0.2),
                  progressColor: mainColor,
                ),
                Text(
                  'مرات التكرار : $time',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'المجموع : ${time * target + counter}',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xffC62828),
                      ),
                      value: 0xffC62828,
                      groupValue: appColor,
                      onChanged: (val) {
                        setState(() {
                          appColor = val!;
                        });
                      }),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xff1565C0),
                    ),
                    value: 0xff1565C0,
                    groupValue: appColor,
                    onChanged: (val) {
                      setState(
                        () {
                          appColor = val!;
                        },
                      );
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xff2E7D32),
                    ),
                    value: 0xff2E7D32,
                    groupValue: appColor,
                    onChanged: (val) {
                      setState(
                        () {
                          appColor = val!;
                        },
                      );
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xffF9A825),
                    ),
                    value: 0xffF9A825,
                    groupValue: appColor,
                    onChanged: (val) {
                      setState(
                        () {
                          appColor = val!;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
