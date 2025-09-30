Class {
	#name : 'Mg113ModelComunicacionVariacion',
	#superclass : 'Object',
	#instVars : [
		'opcionA',
		'opcionB',
		'opcionC',
		'entidades'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> entidades [ 

	^ entidades
]

{ #category : 'initialization' }
Mg113ModelComunicacionVariacion >> initialize [

	super initialize.
	entidades := OrderedCollection with: (Mg113EntidadComunicacionVariacion new
		denominacion: 'Una entidad';
		porcentajeTitularidad: 100.00;
		valorMercado: 123231.32;
		valorTransmision: 150234.54;
		valorAdquisicion: 78342.78)
]

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> opcionA [

	^ opcionA ifNil: [ opcionA := false ]
]

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> opcionA: anObject [

	opcionA := anObject
]

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> opcionB [

	^ opcionB
]

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> opcionB: aBoolean [

	opcionB := aBoolean
]

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> opcionC [

	^ opcionC
]

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> opcionC: aBoolean [
	opcionC := aBoolean
]

{ #category : 'printing' }
Mg113ModelComunicacionVariacion >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' opcionA: ';
		print: opcionA.
	aStream
		nextPutAll: ' opcionB: ';
		print: opcionB.
	aStream
		nextPutAll: ' opcionC: ';
		print: opcionC
]

{ #category : 'accessing' }
Mg113ModelComunicacionVariacion >> totalGananciasPatrimoniales [

	^ entidades
		  inject: 0.00
		  into: [ :total :each | total + each gananciaPatrimonial ]
]
