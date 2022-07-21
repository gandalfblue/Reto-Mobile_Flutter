import 'package:reactive_forms/reactive_forms.dart';

class CreditCardController {
  final FormGroup creditCardForm = FormGroup({
    'inputNameComplete':
        FormControl<String>(validators: [Validators.required], value: ''),
    'inputProfession':
        FormControl<String>(validators: [Validators.required], value: ''),
    'typeDocument':
        FormControl<String>(validators: [Validators.required], value: ''),
    'inputDocumentNumber': FormControl(validators: [
      Validators.required,
      Validators.number,
      Validators.minLength(7),
      Validators.maxLength(10),
    ], value: ''),
  });

  String get getNameCreditCardForm =>
      this.creditCardForm.control('inputNameComplete').value;
  String get getProfessionForm =>
      this.creditCardForm.control('inputProfession').value;
  String get getTypeDocumentForm =>
      this.creditCardForm.control('typeDocument').value;
  String get getNumberCreditCardForm =>
      this.creditCardForm.control('inputDocumentNumber').value;

  void cleanCreditCardForm() {
    this.creditCardForm.control('inputNameComplete').value = '';
    this.creditCardForm.control('inputProfession').value = '';
    this.creditCardForm.control('typeDocument').value = '';
    this.creditCardForm.control('inputDocumentNumber').value = '';
  }
}

final controller = CreditCardController();
