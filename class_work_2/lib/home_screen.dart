import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

// Holds state for tab interface
class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  // Restores last loaded state of tabs
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  // Initialises TabController
  // Event listener
  @override
  void initState() {
    super.initState();
    // Creates 4 tabs
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  // Remover
  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

// Builds all basic structure
  @override
  Widget build(BuildContext context) {
// For the ToDo task hint: consider defining the widget and name of the tabs here
    final tabs = ['Text', 'Image', 'Button', 'List'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Tabs Demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
// hint for the to do task:Considering creating the different for different tabs
          //for (final tab in tabs)
            // Text tab
            Center(
              child: Text("This is a test"),
            ),
            
           // Image tab 
            Center(
	            child: Image.network(
	              'https://ffxivcollect.com/assets/orchestrion-1715025e27527af41fc5daa8feb192d49887fa2c1b70b2f6fc6dcc74a5570109.png',
	              width: 150,
	              height: 150,
	            ),
            ),
            
            // Button tab
            Center(
	            child: ElevatedButton(
	              onPressed: () {
	                ScaffoldMessenger.of(context).showSnackBar(
	                  SnackBar(
	                    content: Text('Button pressed in ${tabs[2]} tab!'),
	                  ),
	                );
	              },
	              child: Text('Click me'),
	            ),
            ),

            // List tab
            ListView(
              children: [
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
              ],
            ),
        ],
      ),
    );
  }
}
