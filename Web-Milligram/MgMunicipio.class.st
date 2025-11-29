Class {
	#name : 'MgMunicipio',
	#superclass : 'Object',
	#instVars : [
		'codigoProvincia',
		'CodigoIne',
		'codigoAt',
		'nombre'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
MgMunicipio class >> from: anArray [

	"Crea un objeto de MgMunicipio a partir de los datos que constan en el array que se
	informa, los indices contiene los siguientes datos:
	
		1.- Código de provincia a la que pertence.
		2.- Código INE (Instituto Nacional de Estadística) del municipio.
		3.- Código AT (Agencia Tributaria) del municipio.
		4.- Nombre del municipio"
		
		^ (self basicNew)
			setCodigoProvincia: anArray first;
			setCodigoIneMunicipio: anArray second;
			setCodigoAtMunicipio: anArray third;
			setNombreMunicipio: anArray fourth
]

{ #category : 'comparing' }
MgMunicipio >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ CodigoIne = anObject codigoIneMunicipio and: [
		  nombre = anObject nombreMunicipio ]
]

{ #category : 'accessing' }
MgMunicipio >> codigoAtMunicipio [

	^ codigoAt
]

{ #category : 'accessing' }
MgMunicipio >> codigoIneMunicipio [

	^ CodigoIne
]

{ #category : 'accessing' }
MgMunicipio >> codigoProvincia [

	^ codigoProvincia
]

{ #category : 'comparing' }
MgMunicipio >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ CodigoIne hash bitXor: nombre hash
]

{ #category : 'accessing' }
MgMunicipio >> nombreMunicipio [

	^ nombre
]

{ #category : 'printing' }
MgMunicipio >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	aStream
		print: CodigoIne.
	aStream
		nextPutAll: ' - ';
		print: nombre
]

{ #category : 'private' }
MgMunicipio >> setCodigoAtMunicipio: anObject [

	codigoAt := anObject
]

{ #category : 'private' }
MgMunicipio >> setCodigoIneMunicipio: anObject [

	CodigoIne := anObject
]

{ #category : 'private' }
MgMunicipio >> setCodigoProvincia: anObject [

	codigoProvincia := anObject
]

{ #category : 'private' }
MgMunicipio >> setNombreMunicipio: anObject [

	nombre := anObject
]
