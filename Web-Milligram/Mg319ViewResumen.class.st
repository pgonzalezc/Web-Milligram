Class {
	#name : 'Mg319ViewResumen',
	#superclass : 'MgViewBase',
	#instVars : [
		'models'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> adjustLeft: aString to: anInteger with: aCharacter [

	^ (aString padLeftTo: anInteger with: aCharacter) copyFrom: 1 to: anInteger

	
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> adjustRight: aString to: anInteger with: aCharacter [

	^ (aString padRightTo: anInteger with: aCharacter) copyFrom: 1 to: anInteger
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> complementaria: aNumber [

	^ aNumber > 1 ifTrue: [ 'C' ] ifFalse: [ ' ' ]
]

{ #category : 'accessing' }
Mg319ViewResumen >> errors [

	^ OrderedCollection new 
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> generaAux [

	^ String streamContents: [ :stream |
			  stream
				  nextPutAll: '<AUX>';
				  space: 70;
				  nextPutAll: 'ssd1';
				  space: 4;
				  nextPutAll: '89890001K';
				  space: 213;
				  nextPutAll: '</AUX>' ]
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> generaFichero [

	| devengo |
	devengo := models second.
	^ String streamContents: [ :stream |
		stream 
			nextPutAll: '<T3190';
			nextPutAll: (devengo ejercicio printPaddedWith: $0 to: 4);
			nextPutAll: '0A0000>';
			nextPutAll: self generaAux;
			nextPutAll: self generaRegistros;
			nextPutAll: '</T319';
			nextPutAll: (devengo ejercicio printPaddedWith: $0 to: 4);
			nextPutAll: '0A0000>'
			
		 ]
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> generaLiquidacion: aCollection [

	"aCollection es un OrderedCollection con los productos introducidos en la liquidación"
	|liqStr|
	aCollection inspect.
	liqStr := aCollection inject: '' into: [ :str :each | str, (String streamContents: [ :out | 
			out 
				nextPutAll: each tipo codigo;
				nextPutAll: (((each volumen round: 0) floor ) printPaddedWith: $0 to: 9 );
				nextPutAll: (((each precioLitro round: 3) * 100) floor printPaddedWith: $0 to: 7);
				nextPutAll: (self importe: each cuotaIva to: 15) 
			 ]) ].
	
	^ liqStr padLeftTo: 198 with: Character space
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> generaRegistros [

	| liquidacion identificacion devengo tributacionTerritorial productosPorPagina registros |
	"Genera registro/s del modelo 319 a partir de los datos contenidos los modelos"
	registros := OrderedCollection new.
	identificacion := models first.
	devengo := models second.
	liquidacion := models third.
	tributacionTerritorial := models fourth.
	productosPorPagina := liquidacion productos groupsOf:
		                      self productosPorRegistro.
	1 to: productosPorPagina size do: [ :pagina |
			registros add: 
			(String streamContents: [ :aStream |
					aStream
						nextPutAll: '<T319';
						nextPutAll: (pagina printPaddedWith: $0 to: 2);
						nextPutAll: '000>';
						nextPutAll: (self complementaria: pagina);
						nextPutAll: ' ';
						nextPutAll: (self adjustRight: identificacion nif to: 9 with: $0);
						nextPutAll: (self adjustLeft: identificacion denominacion to: 80 with: Character space);
						
						nextPutAll: '0A';
						nextPutAll: (self adjustRight: liquidacion depositoFiscal to: 13 with: Character space);
						nextPutAll:
							(self generaLiquidacion: (productosPorPagina at: pagina));
						nextPutAll: (String new: 132 withAll: Character space);
						nextPutAll:
							(self importe: liquidacion cuotaTotal to: 15);
						nextPutAll:
							(self importe: liquidacion resultado to: 15);
						nextPutAll:
							(self generaTributacionTerritorial: tributacionTerritorial);
						nextPutAll: (String new: 197 withAll: Character space);
						nextPutAll: '</T319';
						nextPutAll: (pagina printPaddedWith: $0 to: 2);
						nextPutAll: '000>']) ].
				
		^ Character lf join: registros
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> generaTributacionTerritorial: tributacionTerritorial [

	^ String streamContents: [ :out |
			  out
				  nextPutAll:
					  (((tributacionTerritorial porcentajeAlava round: 3) * 100)
						   floor printPaddedWith: $0 to: 7);
				  nextPutAll:
					  (self importe: tributacionTerritorial pagoACuentaAlava to: 15);
				  nextPutAll:
					  (((tributacionTerritorial porcentajeGuipuzcoa round: 3) * 100)
						   floor printPaddedWith: $0 to: 7);
				  nextPutAll:
					  (self importe: tributacionTerritorial pagoACuentaGuipuzcoa to: 15);
				  nextPutAll:
					  (((tributacionTerritorial porcentajeVizcaya round: 3) * 100)
						   floor printPaddedWith: $0 to: 7);
				  nextPutAll:
					  (self importe: tributacionTerritorial pagoACuentaVizcaya to: 15);
				  nextPutAll:
					  (((tributacionTerritorial porcentajeNavarra round: 3) * 100)
						   floor printPaddedWith: $0 to: 7);
				  nextPutAll:
					  (self importe: tributacionTerritorial pagoACuentaNavarra to: 15);
				  nextPutAll:
					  (((tributacionTerritorial porcentajeTerritorioComun round: 3)
					    * 100) floor printPaddedWith: $0 to: 7);
				  nextPutAll:
					  (self importe:
							   tributacionTerritorial pagoACuentaTerritorioComun to: 15) ]
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> importe: aNumber to: aInteger [

	^ aNumber negative
		  ifTrue: [
				  'N'
				  ,
				  (((aNumber round: 2) abs * 100) floor
					   printPaddedWith: $0
					   to: aInteger - 1) ]
		  ifFalse: [
		  ((aNumber round: 2) * 100) floor printPaddedWith: $0 to: aInteger ]
]

{ #category : 'accessing' }
Mg319ViewResumen >> models: aCollection [

	models := aCollection
]

{ #category : 'as yet unclassified' }
Mg319ViewResumen >> productosPorRegistro [

	"Número de productos que se pueden almacenar en un registro"
	^ 6
]

{ #category : 'rendering' }
Mg319ViewResumen >> renderContentOn: html [

	|fichero|
	fichero := self generaFichero.
	html paragraph: 'Estos son los datos que se van a enviar'.
	html textArea readonly: true; rows: 16; with: fichero.
]
