import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentpage = 0;
  final _pageController = PageController();

  List<OnbordingItem> onbordingItem = [
    OnbordingItem(
        title: 'Improved Quality of Life',
        description:
            'Technology plays an increasingly vital and transformative role in shaping the future of our society.',
        image: 'images/1.png'),
    OnbordingItem(
        title: 'Innovate, Integrate, Inspire',
        description:
            'Technology plays an increasingly vital and transformative role in shaping the future of our society.',
        image: 'images/2.png'),
    OnbordingItem(
        title: ' Helps Create More Equality in Society',
        description:
            'Technology plays an increasingly vital and transformative role in shaping the future of our society.',
        image: 'images/3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SKIP',
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: onbordingItem.length,
                      onPageChanged: (value) {
                        setState(() {
                          _currentpage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = onbordingItem[index];
                        return Column(
                          children: [
                            Image.asset(item.image),
                            SizedBox(height: 10),
                            Text(
                              item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                            ),
                            SizedBox(height: 16),
                            Center(
                              child: Text(
                                item.description,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15),
                              ),
                            )
                          ],
                        );
                      }),
                ),
                Row(
                    children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: _currentpage == index ? 30 : 10,
                      decoration: BoxDecoration(
                          color: _currentpage == index
                              ? Colors.red
                              : Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  );
                }))
              ],
            )),
      ),
    );
  }
}

class OnbordingItem {
  final String title;
  final String description;
  final String image;
  OnbordingItem(
      {required this.title, required this.description, required this.image});
}
