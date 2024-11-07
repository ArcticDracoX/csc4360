import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  // text fields' controllers
  final TextEditingController amountController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final CollectionReference inventory = FirebaseFirestore.instance.collection('Inventory');

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async
  {
    String action = 'create';
    if (documentSnapshot != null)
    {
      action = 'update';
      amountController.text = documentSnapshot['amount'].toString();
      itemController.text = documentSnapshot['item'];
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx)
      {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),

              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: itemController,
                decoration: const InputDecoration(
                  labelText: 'Item',
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                child: Text(action == 'create' ? 'Create' : 'Update'),
                onPressed: () async {
                  int amount = int.parse(amountController.text);
                  String item = itemController.text;
                  if (amount != null && item.isNotEmpty)
                  {
                    if (action == 'create')
                    {
                      // Persist a newn itemController from inventory to Firestore
                      await inventory.add({"amount": amount, "item": item});
                    }

                    if (action == 'update')
                    {
                      // Update then itemController from inventory
                      await inventory.doc(documentSnapshot!.id).update({
                        "amount": amount,
                        "item": item,
                      });
                    }

                    amountController.text = '';
                    itemController.text = '';
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  // Deleting an itemController from inventory by id
  Future<void> _deleteProduct(String itemId) async
  {
    inventory.doc(itemId).delete;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You have successfully deleted an itemController from inventory'),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD operations'),
      ),

      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
        stream: inventory.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index)
              {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['amountController'].toString()),
                    subtitle: Text(documentSnapshot['itemController']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children:
                        [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _createOrUpdate(documentSnapshot),
                          ),

                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteProduct(documentSnapshot.id),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      // Add newn itemController from inventory
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
