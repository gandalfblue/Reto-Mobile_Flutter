import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reto_mobile/credit_card_controller.dart';
import 'package:reto_mobile/credit_card_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My card presentation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: ReactiveForm(
            formGroup: controller.creditCardForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _textFormNameComplete(),
                SizedBox(height: 10),
                _textFormProfession(),
                SizedBox(height: 10),
                _dropDown(),
                SizedBox(height: 10),
                _textFormNumber(),
                SizedBox(height: 5),
                _addData("Add"),
                SizedBox(height: 5),
                _clearData("Clear"),
                Divider(),
                StreamBuilder(
                    stream: controller.creditCardForm.valueChanges,
                    builder: (context, snapshot) {
                      return CreditCardWidget(
                          cardHolder: controller.getNameCreditCardForm,
                          profession: controller.getProfessionForm,
                          typeDocument: controller.getTypeDocumentForm,
                          cardNumber: controller.getNumberCreditCardForm);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFormNameComplete() {
    return ReactiveTextField(
      formControlName: 'inputNameComplete',
      validationMessages: (control) =>
          {'required': 'El nombre no puede estar vacío'},
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orangeAccent),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
        labelText: "Nombre y apellido",
      ),
    );
  }

  Widget _textFormProfession() {
    return ReactiveTextField(
      formControlName: 'inputProfession',
      validationMessages: (control) =>
          {'required': 'El nombre no puede estar vacío'},
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orangeAccent),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
        labelText: "Profesión o rol",
      ),
    );
  }

  Widget _textFormNumber() {
    return ReactiveTextField(
      formControlName: 'inputDocumentNumber',
      validationMessages: (control) =>
          {'required': 'El documento de identidad no puede estar vacío'},
      keyboardType: TextInputType.number,
      inputFormatters: [],
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
        labelText: "Documento de identidad",
      ),
    );
  }

  Widget _dropDown() {
    var _lista = [
      'Cedula de ciudadania',
      'Cedula de extranjeria',
      'Tarjeta de identidad',
      'Numero de pasaporte'
    ];
    return ReactiveDropdownField<String>(
      formControlName: 'typeDocument',
      validationMessages: (control) =>
          {'required': 'Debe seleccionar una opción de documento'},
      hint: Text('Seleccione un tipo de documento'),
      items: _lista.map((String element) {
        return DropdownMenuItem(value: element, child: Text(element));
      }).toList(),
      /* onChanged: (_value) => {
        setSta(() {
          _vista = _value;
        }
      }, */
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        labelStyle: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _addData(String text) {
    return ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        icon: Icon(Icons.add),
        label: Text(text));
  }

  Widget _clearData(String text) {
    return ElevatedButton.icon(
        onPressed: () {},
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        icon: Icon(Icons.clear),
        label: Text(text));
  }
}
