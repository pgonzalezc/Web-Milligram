Class {
	#name : 'MgProvincia',
	#superclass : 'Object',
	#instVars : [
		'codigo',
		'nombre',
		'codigoComunidad',
		'nombreComunidad'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
MgProvincia class >> from: anArray [
	"Define una provincia a partir del array definido en los ficheros proporcionados por
	la AT que tienen la siguientes datos segun el indice:
		1.- Código de provincia (2 dígitos)
		2.- Nombre de la provincia
		3.- Codigo de la comunidad autónoma a la que pertence
		4.- Nombre de la comunidad autónoma"

	^ self basicNew
		  setCodigoProvincia: anArray first;
		  setNombreProvincia: anArray second;
		  setCodigoComunidadAutonoma: anArray third;
		  setNombreComunidadAutonoma: anArray fourth
]

{ #category : 'comparing' }
MgProvincia >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ codigo = anObject codigoProvincia and: [
		  nombre = anObject nombreProvincia ]
]

{ #category : 'accessing' }
MgProvincia >> codigoComunidadAutonoma [

	^ codigoComunidad
]

{ #category : 'accessing' }
MgProvincia >> codigoProvincia [

	^ codigo
]

{ #category : 'comparing' }
MgProvincia >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ codigo hash bitXor: nombre hash
]

{ #category : 'accessing' }
MgProvincia >> nombreComunidadAutonoma [

	^ nombreComunidad
]

{ #category : 'accessing' }
MgProvincia >> nombreProvincia [

	^ nombre
]

{ #category : 'printing' }
MgProvincia >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."
	
	aStream
		print: codigo.
	aStream
		nextPutAll: ' - ';
		print: nombre
]

{ #category : 'accessing' }
MgProvincia >> setCodigoComunidadAutonoma: anObject [

	codigoComunidad := anObject
]

{ #category : 'accessing' }
MgProvincia >> setCodigoProvincia: anObject [

	codigo := anObject
]

{ #category : 'accessing' }
MgProvincia >> setNombreComunidadAutonoma: anObject [

	nombreComunidad := anObject
]

{ #category : 'accessing' }
MgProvincia >> setNombreProvincia: anObject [

	nombre := anObject
]
