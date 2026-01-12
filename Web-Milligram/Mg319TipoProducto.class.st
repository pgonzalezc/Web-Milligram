Class {
	#name : 'Mg319TipoProducto',
	#superclass : 'Object',
	#instVars : [
		'codigo',
		'descripcion'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg319TipoProducto class >> codigo: aString descripcion: anotherString [

	^ self basicNew
		setCodigo: aString;
		setDescripcion: anotherString
]

{ #category : 'as yet unclassified' }
Mg319TipoProducto class >> listaProductos [

	^ OrderedCollection with: (self codigo: '01' descripcion: 'Gasolinas con plomo' )
		with: (self codigo: '02' descripcion: 'Gasolinas sin plomo de 98 I.O. o octanaje superior')
		with: (self codigo: '03' descripcion: 'Demás gasolinas sin plomo')
		with: (self codigo: '04' descripcion: 'Gasóleos de uso general')
		with: (self codigo: '05' descripcion: 'Bioetanol o biometanol para uso como carburante')
		with: (self codigo: '06' descripcion: 'Biodiesel para uso como carburante')
]

{ #category : 'accessing' }
Mg319TipoProducto >> codigo [

	^ codigo
]

{ #category : 'accessing' }
Mg319TipoProducto >> descripcion [

	^ descripcion
]

{ #category : 'printing' }
Mg319TipoProducto >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	aStream
		nextPutAll: codigo;
		nextPutAll: ' - ';
		nextPutAll: descripcion
]

{ #category : 'initialization' }
Mg319TipoProducto >> setCodigo: aString [

	codigo := aString
]

{ #category : 'initialization' }
Mg319TipoProducto >> setDescripcion: aString [

	descripcion := aString
]
