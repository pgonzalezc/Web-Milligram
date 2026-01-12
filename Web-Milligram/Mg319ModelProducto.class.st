Class {
	#name : 'Mg319ModelProducto',
	#superclass : 'Object',
	#instVars : [
		'tipo',
		'volumen',
		'precioLitro'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg319ModelProducto class >> porcentajeIva [

	^ 21.0
]

{ #category : 'as yet unclassified' }
Mg319ModelProducto class >> withTipo: aString volumen: aNumber precioLitro: anotherNumber [

	^ self basicNew
		setTipo: aString;
		setVolumen: aNumber;
		setPrecioLitro: anotherNumber
]

{ #category : 'as yet unclassified' }
Mg319ModelProducto >> cuotaIva [

	^ self volumen * self precioLitro * self porcentajeIva / 100.0
]

{ #category : 'as yet unclassified' }
Mg319ModelProducto >> porcentajeIva [
	^ self class porcentajeIva
]

{ #category : 'accessing' }
Mg319ModelProducto >> precioLitro [

	^ precioLitro ifNil: [ precioLitro := 0.0 ]
]

{ #category : 'printing' }
Mg319ModelProducto >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' tipo: ';
		print: tipo.
	aStream
		nextPutAll: ' volumen: ';
		print: volumen.
	aStream
		nextPutAll: ' precioLitro: ';
		print: precioLitro.
	aStream 
		nextPutAll: ' cuotaIva; ';
		print: self cuotaIva
]

{ #category : 'accessing' }
Mg319ModelProducto >> setPrecioLitro: aNumber [

	precioLitro := aNumber
]

{ #category : 'accessing' }
Mg319ModelProducto >> setTipo: aString [

	tipo := aString
]

{ #category : 'accessing' }
Mg319ModelProducto >> setVolumen: aNumber [

	volumen := aNumber
]

{ #category : 'accessing' }
Mg319ModelProducto >> tipo [

	^ tipo ifNil: [ tipo := '' ]
]

{ #category : 'accessing' }
Mg319ModelProducto >> tipo: unProducto319 [

	tipo := unProducto319
]

{ #category : 'accessing' }
Mg319ModelProducto >> volumen [

	^ volumen ifNil:  [ volumen := 0.0 ]
]
