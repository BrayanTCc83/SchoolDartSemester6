//Declaration of receipt class, methods and properties
class Receipt {
  String emmiter;
  String socialReason;
  String rfc;
  String description;
  int sessionNumber;
  double amount;

  //Class constructor
  Receipt ( String emmiter, String socialReason, String rfc, String description, int sessionNumber, double amount ) {
    this.emmiter = emmiter;
    this.socialReason = socialReason;
    this.rfc = rfc;
    this.description = description;
    this.sessionNumber = sessionNumber;
    this.amount = amount;
  }

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
}