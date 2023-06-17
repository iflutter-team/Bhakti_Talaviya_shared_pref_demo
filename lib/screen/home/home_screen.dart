import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_pref_demo/model/models.dart';
import 'package:shared_pref_demo/model/photosModel.dart';
import 'package:shared_pref_demo/model/product_model.dart';
import 'package:shared_pref_demo/screen/home/home_screen_api.dart';
import 'package:shared_pref_demo/screen/login_api/login_apis_screen.dart';
import 'package:shared_pref_demo/services/pref_service.dart';
import 'package:shared_pref_demo/utils/prefrence_res.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllerEmailUpdate = TextEditingController();
  TextEditingController controllerPassUpdate = TextEditingController();
  TextEditingController controllerAgeUpdate = TextEditingController();
  TextEditingController controllerNameUpdate = TextEditingController();

  User? loginUser;
  List<User> userList = [];
  List<PhotsModel>? photosList;
  // List<ProductModel>? productList;
  bool isload = false;
  ProductModel? productlist;

  //Single User mate
  void getUserLogin() {
    String loginUSerStr = PrefService.getString(PrefResources.loginUser);
    loginUser = User.fromJson(json.decode(loginUSerStr));
    setState(() {});
  }

  //Multiple User mate
  void getAllUserStr() {
    String allUSerStr = PrefService.getString(PrefResources.isGetString);
    userList = userFromJson(allUSerStr);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageList();
    // getUserLogin();
    // getAllUserStr();
  }

  Future<void> getImageList() async {
    productlist = await HomeScreenApi.getData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                PrefService.clearPref();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginApiscreen(),
                    ),
                    (route) => false);
              },
              icon: const Icon(Icons.logout_sharp),
            )
          ],
          title: const Text('HomePage'),
        ),
        body: productlist == null
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: productlist!.products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 2)]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              productlist!.products![index].images.first),
                        ),
                      ),
                      Text(
                        productlist!.products![index].brand,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productlist!.products![index].price.toString(),
                            style: TextStyle(
                                color: Colors.yellow.shade700,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            productlist!.products![index].rating.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
        // : ListView.builder(
        //     itemCount: productlist!.products!.length,
        //     itemBuilder: (context, index) => ListTile(
        //       leading: Image(
        //         image: NetworkImage(
        //             productlist!.products![index].images.first.toString()),
        //       ),
        //       title: Text(productlist!.products![index].brand),
        //       subtitle: Text(productlist!.products![index].price.toString()),
        //     ),

        //     //  Container(
        //     //   height: 400,
        //     //   width: 400,
        //     //   child: Text(photosList![index].title),
        //     //   // child: Image.network(photosList![index].url),
        //     // ),
        //   ),
        );
  }
}
