// import 'package:flutter/material.dart';

// class TabBar extends StatefulWidget {
//   const TabBar({
//     super.key,
//   });

//   @override
//   State<TabBar> createState() => _TavBarState();
// }

// class _TabBarState extends State<TabBar> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     TabController tabController = TabController(
//       length: 3,
//       vsync: this,
//     );
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: TabBar(
//         dividerColor: Colors.transparent,
//         labelColor: Colors.white,
//         unselectedLabelColor: Colors.grey,
//         // isScrollable: true,
//         indicator: CircleTabIndicator(color: Colors.white, radius: 4),
//         controller: tabController,
//         tabs: const [
//           Tab(text: 'Популярные'),
//           Tab(text: 'Наивысший рейтинг'),
//           Tab(text: 'Предстоящие'),
//         ],
//       ),
//     );
//     TabBarWidget(tabController: tabController);
//   }
// }
