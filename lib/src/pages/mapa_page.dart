import 'package:flutter/material.dart';



class MapaPage extends StatefulWidget {
  MapaPage() : super();
  @override
  _MapaPageState createState() => _MapaPageState();
}


class Company {
  int id;
  String name;
 
  Company(this.id, this.name);
 
  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Ford'),
      Company(2, 'Chevrolet'),
      Company(3, 'Kia'),
      Company(4, 'Korando'),
      Company(5, 'Mercedes'),
    ];
  }
}


class _MapaPageState extends State<MapaPage> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
  _dropdownMenuItems = buildDropdownMenuItems(_companies);
  _selectedCompany = _dropdownMenuItems[0].value;
  super.initState();
}

List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
  List<DropdownMenuItem<Company>> items = List();
  for (Company company in companies) {
    items.add(
      DropdownMenuItem(
        value: company,
        child: Text(company.name),
      ),
    );
  }
  return items;
}

onChangeDropdownItem(Company selectedCompany) {
  setState(() {
    _selectedCompany = selectedCompany;
  });
}

@override
Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Selecciona tu vehículo"),
              SizedBox(
                height: 20.0,
              ),
              DropdownButton(
                value: _selectedCompany,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Tu vehículo: ${_selectedCompany.name}'),
            ],
          ),
        ),
      ),
    );
  }
}


