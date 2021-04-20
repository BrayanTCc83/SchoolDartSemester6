import 'dart:convert';
//Declaration of receipt class, methods and properties
class Receipt {
  String emmiter;
  String socialReason;
  String rfc;
  String description;
  int sessionNumber;
  double amount;

  //Class constructor
  Receipt (
    this.emmiter,
    this.socialReason,
    this.rfc,
    this.description,
    this.sessionNumber,
    this.amount
  );

  //Calculate IVA method, receive an object instance of receipt class
  double calculateIVA ( Receipt receipt ) {
    double pay;
    pay = receipt.amount + receipt.amount * 0.16;
    return pay;
  }

  //Calculate ISR method, receive an object from receipt
  double calculateISR ( Receipt receipt ) {
    var amountLimits = [ 0, 1001, 2001, 3001, 4001, 5001 ];
    var cuotes = [
      { 'cuote' : 0,  'percentaje' : 0.02 },
      { 'cuote' : 20, 'percentaje' : 0.04 },
      { 'cuote' : 40, 'percentaje' : 0.06 },
      { 'cuote' : 60, 'percentaje' : 0.08 },
      { 'cuote' : 80, 'percentaje' : 0.1  },
      { 'cuote' : 90, 'percentaje' : 0.12 }
    ];
    double isr;
    for ( num i = 0; i < amountLimits.length - 1 ; i++ ) {
      if( receipt.amount > amountLimits[ i ] && receipt.amount < amountLimits[ i+1 ] ){
        isr = receipt.amount * cuotes[ i ][ 'percentaje' ] + cuotes[ i ][ 'cuote' ];
        break;
      } else if ( receipt.amount > amountLimits[ amountLimits.length -1 ] ) {
        isr = receipt.amount * cuotes[ amountLimits.length - 1 ][ 'percentaje' ] + cuotes[ amountLimits.length - 1 ][ 'cuote' ];
        break;
      }
    }
    return isr;
  }

  //Get total amount, must receive an receive object
  double getTotalAmount ( Receipt receipt ) {
    double totalAmount;
    totalAmount = receipt.amount + calculateIVA(receipt) + calculateISR(receipt);
    return totalAmount;
  }

  //Constructor for JSON
  Receipt.fromReceipt ( String data ){
    var jsonData = json.decode(data);
    emmiter = jsonData[ 'emmiter' ];
    socialReason = jsonData[ 'socialReason' ];
    rfc = jsonData[ 'rfc' ];
    description = jsonData[ 'description' ];
    sessionNumber = jsonData[ 'sessionNumber' ];
    amount = (jsonData[ 'amount' ]).toDouble();
  }

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