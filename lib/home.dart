import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reto_mobile/controllerProfile.dart';
import 'package:reto_mobile/cardProfile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reto_mobile/imageProfile.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final textControllerName = TextEditingController();
  final textControllerProfession = TextEditingController();
  final textControllerDocument = TextEditingController();

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
                ImageProfile(),
                SizedBox(height: 10),
                _textFormNameComplete(),
                SizedBox(height: 10),
                _textFormProfession(),
                SizedBox(height: 10),
                _dropDown(),
                SizedBox(height: 10),
                _textFormNumber(),
                SizedBox(height: 5),
                _addButtonData("Add"),
                SizedBox(height: 5),
                _clearButtonData("Clear"),
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
      controller: textControllerName,
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
      controller: textControllerProfession,
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
      controller: textControllerDocument,
      validationMessages: (control) => {
        'required': 'El documento de identidad no puede estar vacío',
        'number': 'El documento de identidad solo puede ser numeros',
        'minLength': 'El documento de identidad debe tener minimo 7 digitos',
        'maxLength': 'El documento de identidad debe tener maximo 10 digitos'
      },
      keyboardType: TextInputType.number,
      inputFormatters: [],
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
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
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
    var _hint = '';
    return ReactiveDropdownField<String>(
      formControlName: 'typeDocument',
      validationMessages: (control) =>
          {'required': 'Debe seleccionar una opción de documento'},
      hint: Text(_hint),
      items: _lista.map((String element) {
        return DropdownMenuItem(value: element, child: Text(element));
      }).toList(),
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
        labelStyle: TextStyle(fontSize: 15),
        labelText: "Tipo de documento",
      ),
    );
  }

  Widget _addButtonData(String text) {
    return ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        icon: Icon(Icons.add),
        label: Text(text));
  }

  Widget _clearButtonData(String text) {
    return ElevatedButton.icon(
        onPressed: () {
          textControllerName.clear();
          textControllerProfession.clear();
          textControllerDocument.clear();
        },
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        icon: Icon(Icons.clear),
        label: Text(text));
  }
}
