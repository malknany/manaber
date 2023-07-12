// import 'package:flutter/material.dart';

// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   List<Widget> _textFields = [];

//   @override
//   void initState() {
//     super.initState();
//     _textFields.add(TextFormField());
//   }

//   void _addTextField() {
//     setState(() {
//       _textFields.add(TextFormField());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       body: ListView(
//         children: [
//           ..._textFields,
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: _addTextField,
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:manaber/shared/components/components.dart';

// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   List<TextEditingController> _controllers = [];
//   int counter = 1;

//   @override
//   void initState() {
//     super.initState();
//     _controllers.add(TextEditingController());
//   }

//   void _addTextField() {
//     setState(() {
//       _controllers.add(TextEditingController());
//     });
//     counter++;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       body: ListView(
//         children: [
//           ..._controllers.map((controller) => TextFormFiledStepper(
//                 labelname: "plan$counter",
//                 textEditingController: controller,
//               )),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: _addTextField,
//           ),
//         ],
//       ),
//     );
//   }

// ignore_for_file: library_private_types_in_public_api

//   @override
//   void dispose() {
//     _controllers.forEach((controller) => controller.dispose());
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:manaber/shared/components/components.dart';

class HomeScreen extends StatefulWidget {
  final List<String> data;

  const HomeScreen({super.key, required this.data});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(widget.data[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DataScreen(data: widget.data, selectedIndex: index)),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyScreen()),
          );
        },
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  final List<String> data;
  final int selectedIndex;

  const DataScreen({super.key, required this.data, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Screen'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(data[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FormScreen(data: data, selectedIndex: index)),
            );
          },
          selected: selectedIndex == index,
        ),
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final List<TextEditingController> _controllers = [];
  int counter = 1;

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController());
  }

  void _addTextField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
    counter++;
  }

  void _removeTextField() {
    setState(() {
      _controllers.removeLast();
    });
    counter--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            ..._controllers.map((controller) => TextFormFiledStepper(
                  labelname: "plan$counter",
                  textEditingController: controller,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTextField,
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _removeTextField,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.data, this.selectedIndex});
  final List<String> data;
  final int? selectedIndex;

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _controller = TextEditingController();
  late String _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue =
        widget.selectedIndex != null ? widget.data[widget.selectedIndex!] : '';
    _controller.text = _currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _controller,
              onChanged: (value) => _currentValue = value,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                if (widget.selectedIndex != null) {
                  widget.data[widget.selectedIndex!] = _currentValue;
                } else {
                  widget.data.add(_currentValue);
                }
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
