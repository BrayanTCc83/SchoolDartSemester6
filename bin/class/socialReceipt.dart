import './receipt.dart';
class SocialReceipt extends Receipt{
  SocialReceipt( 
    emmiter,
    socialReason,
    rfc,
    description,
    sessionNumber,
    amount
  ) : super(emmiter, socialReason, rfc, description, sessionNumber, amount);

  //Calculate IVA method, receive an object instance of receipt class
  double calculateIVA ( Receipt receipt ) {
    double pay;
    pay = receipt.amount + receipt.amount * 0.16;
    return pay;
  }

  //Constructor for JSON
  SocialReceipt.fromSocialReceipt(Map<String, String> jsonData) : this(
      jsonData[ 'emmiter' ], 
      jsonData[ 'socialReason' ], 
      jsonData[ 'rfc' ], 
      jsonData[ 'description' ], 
      int.parse(jsonData[ 'sessionNumber' ]),
      double.parse(jsonData[ 'amount' ])
  );

  //Calculate ISR method, receive an object from receipt
  double calculateISR ( Receipt receipt ) {
    double isr;
    var amountLimits = [ 0, 1001, 2001, 3001, 4001, 5001 ];
    var cuotes = [
      { 'cuote' : 0,  'percentaje' : 0.02 },
      { 'cuote' : 20, 'percentaje' : 0.04 },
      { 'cuote' : 40, 'percentaje' : 0.06 },
      { 'cuote' : 60, 'percentaje' : 0.08 },
      { 'cuote' : 80, 'percentaje' : 0.1  },
      { 'cuote' : 90, 'percentaje' : 0.12 }
    ];
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
  @override
  double getTotalAmount(Receipt receipt) {
    double totalAmount;
    totalAmount = receipt.amount + calculateIVA(receipt) + calculateISR(receipt);
    return totalAmount;
  }
}