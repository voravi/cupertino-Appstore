import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:cupertino_store/screens/map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currantNavigationBarIndex = 0;
  late PageController _pageController;
  DateTime? currantDate;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    currantDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 660,
            width: double.infinity,
            child: PageView(
              controller: _pageController,
              onPageChanged: (val) {
                setState(() {
                  currantNavigationBarIndex = val;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Cupertino Store",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          decoration: TextDecoration.none,
                          color: CupertinoColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 535,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return CupertinoListTile(
                              onTap: () {},
                              contentPadding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              title: Text("${products[index]["name"]}"),
                              subtitle: Text(
                                "${products[index]["price"]}",
                                style: const TextStyle(
                                    color: CupertinoColors.inactiveGray,
                                    fontSize: 13),
                              ),
                              leading:
                                  Image.asset("${products[index]["image"]}"),
                              trailing: Icon(
                                CupertinoIcons.add_circled,
                                color:
                                    CupertinoColors.activeBlue.withOpacity(0.8),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const CupertinoSearchTextField(),
                        SizedBox(
                          height: 535,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return CupertinoListTile(
                                onTap: () {},
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                title: Text("${products[index]["name"]}"),
                                subtitle: Text(
                                  "${products[index]["price"]}",
                                  style: const TextStyle(
                                      color: CupertinoColors.inactiveGray,
                                      fontSize: 13),
                                ),
                                leading:
                                    Image.asset("${products[index]["image"]}"),
                                trailing: Icon(
                                  CupertinoIcons.add_circled,
                                  color: CupertinoColors.activeBlue
                                      .withOpacity(0.8),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Shopping Cart",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            decoration: TextDecoration.none,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CupertinoTextField(
                          prefix: Icon(
                            CupertinoIcons.person_solid,
                            color:
                                CupertinoColors.inactiveGray.withOpacity(0.8),
                          ),
                          placeholder: "Name",
                          decoration: const BoxDecoration(),
                        ),
                        const Divider(),
                        CupertinoTextField(
                          prefix: Icon(
                            CupertinoIcons.mail,
                            color:
                                CupertinoColors.inactiveGray.withOpacity(0.8),
                          ),
                          placeholder: "Email",
                          decoration: const BoxDecoration(),
                        ),
                        const Divider(),
                        CupertinoTextField(
                          prefix: Icon(
                            CupertinoIcons.location,
                            color:
                                CupertinoColors.inactiveGray.withOpacity(0.8),
                          ),
                          placeholder: "Location",
                          decoration: const BoxDecoration(),
                        ),
                        const Divider(),
                        CupertinoTextField(
                          prefix: Icon(
                            CupertinoIcons.time,
                            color:
                                CupertinoColors.inactiveGray.withOpacity(0.8),
                          ),
                          placeholder: "Delivery time",
                          keyboardType: TextInputType.none,
                          suffix: Text(
                              "${currantDate.toString().split(":")[0]}:${currantDate.toString().split(":")[1]}",
                              style: const TextStyle(color: Colors.grey)),
                          decoration: const BoxDecoration(),
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: CupertinoColors.white,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (DateTime date) {
                              setState(() {
                                currantDate = date;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return CupertinoListTile(
                                onTap: () {},
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                title: Text("${products[index]["name"]}"),
                                subtitle: Text(
                                  "${products[index]["price"]}",
                                  style: const TextStyle(
                                      color: CupertinoColors.inactiveGray,
                                      fontSize: 13),
                                ),
                                leading:
                                    Image.asset("${products[index]["image"]}"),
                                trailing: Text(
                                  "${products[index]["price"]}.00",
                                  style: TextStyle(
                                    color:
                                        CupertinoColors.black.withOpacity(0.7),
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Shipping \$21.00",
                              style: TextStyle(
                                color: CupertinoColors.inactiveGray,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                             Text(
                              "Tax \$10.32",
                              style: TextStyle(
                                color: CupertinoColors.inactiveGray,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Total   \$201.32",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.black,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CupertinoTabBar(
            currentIndex: currantNavigationBarIndex,
            onTap: (val) {
              setState(() {
                currantNavigationBarIndex = val;
                _pageController.animateToPage(val,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              });
            },
            height: 60,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: "Cart",
              ),
            ],
          ),

        ],
      ),
    );
  }
}
