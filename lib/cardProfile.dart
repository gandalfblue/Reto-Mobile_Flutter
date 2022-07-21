import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String profession;
  final String typeDocument;

  const CreditCardWidget(
      {Key? key,
      required this.cardNumber,
      required this.profession,
      required this.typeDocument,
      required this.cardHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 100.0,
      color: Colors.white,
      /* decoration: InputDecoration(
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
      ), */
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width * 0.80,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: (cardNumber == "")
                  ? Text(
                      'XXXX XXXX XXXX XXXX',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                      ),
                    )
                  : Text(
                      '$cardNumber',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                      ),
                    ),
            ),
            _buildIconAndNameCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: (cardHolder == '')
                      ? _buildDetail(
                          'NOMBRES APELLIDOS',
                        )
                      : _buildDetail(
                          cardHolder,
                        ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: (profession == '')
                      ? _buildDetail(
                          'PROFESION',
                        )
                      : _buildDetail(
                          profession,
                        ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: (typeDocument == '')
                      ? _buildDetail(
                          'TIPO DE DOCUMENTO',
                        )
                      : _buildDetail(
                          typeDocument,
                        ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: (cardNumber == '')
                      ? _buildDetail(
                          'NUMERO DE DOCUMENTO',
                        )
                      : _buildDetail(
                          cardNumber,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildIconAndNameCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Colaborador',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            )),
      ],
    );
  }

  Column _buildDetail(String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${value!.toUpperCase()}',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
