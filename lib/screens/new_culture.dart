import 'package:flutter/material.dart';
import 'package:pc2i_app/components/button.dart';
import 'package:pc2i_app/components/input.dart';

class NewCultureScreen extends StatefulWidget {
  const NewCultureScreen({Key? key}) : super(key: key);

  @override
  _NewCultureScreenState createState() => _NewCultureScreenState();
}

class _NewCultureScreenState extends State<NewCultureScreen> {
  IconData _icon = Icons.add_circle_outline;
  bool _rotate = false;
  List<String> dropdownItems = ['Semanas', 'Meses'];
  String currentDropdownItem = '';

  void updateIcon() {
    setState(() {
      _icon = Icons.autorenew_outlined;
      _rotate = true;
    });
  }

  List<DropdownMenuItem<String>> generateDropdownItems(items) {
    return items.map<DropdownMenuItem<String>>((item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    currentDropdownItem = dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Adicionar Cultura',
            style: TextStyle(color: Color(0xffffffff)),
          ),
          backgroundColor: Color(0xff2D9AF7),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Input(icon: Icon(Icons.park), placeholder: 'Nome'),
                  SizedBox(height: 20),
                  Input(icon: Icon(Icons.notes), placeholder: 'Descrição'),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Input(
                          icon: Icon(Icons.today),
                          placeholder: 'Idade',
                          keyboardType: TextInputType.number,
                          action: TextInputAction.done,
                        ),
                      ),
                      SizedBox(width: 15),
                      DropdownButton(
                        value: currentDropdownItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            currentDropdownItem = newValue!;
                          });
                        },
                        items: generateDropdownItems(dropdownItems),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(MediaQuery.of(context).size.width / 2),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Color(0xff2d9af7),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(Icons.note_add),
                          SizedBox(width: 10),
                          Text('Adicionar imagem'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Button(
                    text: 'Adicionar',
                    icon: _icon,
                    action: () {
                      updateIcon();
                    },
                    rotate: _rotate,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
