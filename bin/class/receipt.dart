import 'dart:convert';
//Declaration of receipt class, methods and properties
abstract class Receipt {
  String _emmiter;
  String socialReason;
  String _rfc;
  String description;
  int sessionNumber;
  double amount;

  //Class constructor
  Receipt (
    emmiter,
    this.socialReason,
    rfc,
    this.description,
    this.sessionNumber,
    this.amount
  ){
    _emmiter = emmiter;
    _rfc = rfc;
  }

  //Setters and getters
  set emmiter(String emmiter){
    this._emmiter = emmiter;
  }
  String get emmiter {
    return _emmiter;
  }
  set rfc(String rfc){
    this._rfc = rfc;
  }
  String get rfc{
    return _rfc;
  }

  //Abstract methods for implement
  double getTotalAmount ( Receipt receipt );

  //Overriding to string
  @override
  String toString(){
    var objData = '"emmiter":"$emmiter", '
      '"socialReason":"$socialReason", '
      '"rfc":"$rfc", '
      '"description":"$description", '
      '"sessionNumber":$sessionNumber, '
      '"amount":$amount';
    return objData; 
  }

  //Parsing object to Json
  Map< String, dynamic > parseJSON ( Receipt receipt ){
    Map< String, dynamic > jsonData = {};
    List<dynamic> dataList = receipt.toString().replaceAll('"', '').replaceAll(':', ',').split(',');
    for ( num i = 1; i <= dataList.length / 2 ; i++ ) {
      jsonData.addAll( {'${dataList[i*2-2]}' : dataList[i*2-1]} );
    }
    return jsonData;
  }
}