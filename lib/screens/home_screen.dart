import 'package:flutter/material.dart';
import '../widgets/chat_list_tab.dart';
import '../widgets/stories_tab.dart';
import '../widgets/calls_tab.dart';
import '../widgets/whatsapp_app_bar.dart';
import '../widgets/whatsapp_tab_bar.dart';
import '../widgets/whatsapp_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight * 2),
        child: Column(
          children: [
            const WhatsAppAppBar(),
            WhatsAppTabBar(tabController: _tabController),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatListTab(),
          StoriesTab(),
          CallsTab(),
        ],
      ),
      floatingActionButton: WhatsAppFloatingActionButton(
        currentIndex: _currentIndex,
      ),
    );
  }
}
