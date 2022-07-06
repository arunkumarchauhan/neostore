import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/models/drawer_item.dart';
import 'package:neostore/feature/home/pages/widgets/carousel_slider_widget.dart';
import 'package:neostore/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        title: Text(
          "NeoSTORE",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CarouselSliderWidget(),
            SizedBox(
              height: 45.h,
            ),
            _buildCategoryGridView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGridView(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 13,
        crossAxisSpacing: 13,
      ),
      children: [
        buildCategoryStack(context,
            text: "Tables",
            assetLocation: "assets/images/dinner-table.png",
            textRight: 16,
            textTop: 16,
            imageBottom: 16,
            imageLeft: 16),
        buildCategoryStack(
          context,
          text: "Sofas",
          assetLocation: "assets/images/couch.png",
          textBottom: 16,
          textLeft: 16,
          imageRight: 15,
          imageTop: 16,
        ),
        buildCategoryStack(
          context,
          text: "Chairs",
          assetLocation: "assets/images/office-chair.png",
          textTop: 16,
          textLeft: 16,
          imageRight: 16,
          imageBottom: 16,
        ),
        buildCategoryStack(
          context,
          text: "Cupboards",
          assetLocation: "assets/images/cupboard.png",
          textBottom: 16,
          textRight: 16,
          imageLeft: 16,
          imageTop: 16,
        ),
      ],
    );
  }

  Widget buildCategoryStack(BuildContext context,
      {String text = "",
      String assetLocation = "",
      double? imageTop,
      double? imageBottom,
      double? imageLeft,
      double? imageRight,
      double? textRight,
      double? textLeft,
      double? textTop,
      double? textBottom}) {
    return GestureDetector(
      onTap: () {
        print("Pressed");
      },
      child: Stack(
        children: [
          Container(
            color: kMainRedColor,
          ),
          Positioned(
            right: textRight,
            top: textTop,
            bottom: textBottom,
            left: textLeft,
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Positioned(
              bottom: imageBottom,
              left: imageLeft,
              top: imageTop,
              right: imageRight,
              child: Image.asset(
                assetLocation,
                color: Colors.white,
                height: 120,
                width: 120,
              ))
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: kDrawerBackGroundColour,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  child: CircleAvatar(
                    backgroundImage: Image.asset(
                      "assets/images/profile.jpeg",
                      fit: BoxFit.fill,
                    ).image,
                    minRadius: 45,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Kinjal Jain",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "kinjal.jain@wwindia.com",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
              height: 2,
            ),
            _buildDrawerListView(context)
          ],
        ),
      ),
    );
  }

  ListView _buildDrawerListView(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          DrawerItems item = DrawerItems.drawers[index];
          return _buildDrawerListTile(item, context, index);
        },
        separatorBuilder: (ctx, index) {
          return const Divider(
            color: Colors.black,
            thickness: 2,
            height: 2,
          );
        },
        itemCount: DrawerItems.drawers.length);
  }

  ListTile _buildDrawerListTile(
      DrawerItems item, BuildContext context, int index) {
    return ListTile(
        onTap: () {},
        leading: Icon(
          item.icon,
          size: 40,
          color: Colors.white,
        ),
        title: Text(
          item.name,
          style: Theme.of(context).textTheme.headline2,
        ),
        trailing: index == 0
            ? Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor.fromHex("#e91c1a"),
                ),
                child: Text(
                  "2",
                  style: Theme.of(context).textTheme.headline2,
                ))
            : null);
  }
}