Class {
	#name : 'MgTipoVia',
	#superclass : 'Object',
	#instVars : [
		'codigoLargo',
		'codigoCorto',
		'nombre'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
MgTipoVia class >> from: anArray [
	"Crea un objeto MgTipoVia a partir de un array con los siguientes tres datos:
		1.- Código largo.
		2.- Código corto (2 caracteres)
		3.- Nombre"

	^ self basicNew
		  setCodigoLargo: anArray first;
		  setCodigoCorto: anArray second;
		  setNombre: anArray third
]

{ #category : 'comparing' }
MgTipoVia >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ codigoLargo = anObject codigoLargo and: [ nombre = anObject nombre ]
]

{ #category : 'accessing' }
MgTipoVia >> codigoCorto [

	^ codigoCorto
]

{ #category : 'accessing' }
MgTipoVia >> codigoLargo [

	^ codigoLargo
]

{ #category : 'comparing' }
MgTipoVia >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ codigoLargo hash bitXor: nombre hash
]

{ #category : 'accessing' }
MgTipoVia >> nombre [

	^ nombre
]

{ #category : 'printing' }
MgTipoVia >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	aStream
		print: codigoLargo.
	aStream
		nextPutAll: ' - ';
		print: nombre.
	aStream
		nextPutAll: ' - ';
		print: codigoCorto
]

{ #category : 'private' }
MgTipoVia >> setCodigoCorto: aString [

	codigoCorto := aString
]

{ #category : 'private' }
MgTipoVia >> setCodigoLargo: aString [

	codigoLargo := aString
]

{ #category : 'private' }
MgTipoVia >> setNombre: aString [

	nombre := aString
]
