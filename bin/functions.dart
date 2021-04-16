//Declarations
List<String> categories = [
  'Frutas y verduras',
  'Cereales',
  'Proteínas',
  'Leguminosas'
];
var descriptions = <String>[
  'Aportan vitaminas y minerales',
  ', energía',
  'reconstruyen el organismo, y',
  'ayudan a la adopción del calcio'
];
//I made the same program, but with a map construction
void execute() {
  impresionListFor(categories, descriptions);
}
//The original program of our teacher made it with List
void impresionListFor( List categories, List descriptions ){
  print( 'Función normal' );
  for ( num x = 0; x < categories.length; x++ ) {
    print( categories[x] );
    for ( num y = 0; y< categories.length; y++ ) {
      print( descriptions[y] );
    }
  }
}
void impresionListForeach( List categories, List descriptions ){
  print( 'Impresión con función de flecha' );
  categories.forEach( ( category ) => {
    print( category ),
    descriptions.forEach(( description ) => {
      print( description )
    } )
  } );
}
//Definition
Map< String, Map< String, String > > object = {
  'Frutas y verduras' : {
    'description' : 'Aportan vitaminas y minerales, ayudan a la formación de huesos, crecimiento y reparación de las células',
    'proportion' : '50%'
  },
  'Cereales' : {
    'description' : 'Evitan el estreñimiento y lenta absorción del colesterol',
    'proportion' : '30%'
  },
  'Proteínas' : {
    'description' : 'Parte fundamental de músculos, víceras, tejidos, huesos y células de sangre',
    'proportion' : '10%'
  },
  'Leguminosas' : {
    'description' : 'Previene enfermedades cardiovasculares, crónicas como diabetes',
    'proportion' : '10%'
  }
};
void execute2(){
  impresionPlatoMap(object);
}
void impresionPlatoMap( Map< String, Map< String, String > > object ) {
  object.keys.forEach( ( element ) => {
    print( element ),
    print( object[element]['description'] ),
    print( object[element]['proportion'] )
  }); 
}