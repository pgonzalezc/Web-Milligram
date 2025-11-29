Class {
	#name : 'MgPoblacion',
	#superclass : 'Object',
	#instVars : [
		'codigoProvincia',
		'codigoIneMunicipio',
		'codigoAtMunicipio',
		'nombre',
		'nombreMunicipio'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
MgPoblacion class >> from: anArray [

	"Genera un objeto de la clase MgPoblación a partir de lo datos del array recibido. Los indices del array 
	contienen los siguientes datos:
	
		1.- Código de provincia a la que pertenece la población
		2.- Código INE (Instituto Nacional de Estadistica) al que pertenece la población
		3.- Código AT (Agencia Tributaria) al que pertenece la población
		4.- Nombre de la población
		5.- Nombre del municipio al que pertence la población"
		
	^ self basicNew
		setCodigoProvincia: anArray first;
		setCodigoIneMunicipio: anArray second ;
		setCodigoAtMunicipio: anArray third ;
		setNombrePoblacion: anArray fourth ;
		setNombreMunicipio: anArray fifth 
		
]

{ #category : 'comparing' }
MgPoblacion >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ codigoIneMunicipio = anObject codigoIneMunicipio and: [
		  nombre = anObject nombrePoblacion ]
]

{ #category : 'accessing' }
MgPoblacion >> codigoAtMunicipio [

	^ codigoAtMunicipio
]

{ #category : 'accessing' }
MgPoblacion >> codigoIneMunicipio [

	^ codigoIneMunicipio
]

{ #category : 'accessing' }
MgPoblacion >> codigoProvincia [

	^ codigoProvincia
]

{ #category : 'comparing' }
MgPoblacion >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ codigoIneMunicipio hash bitXor: nombre hash
]

{ #category : 'accessing' }
MgPoblacion >> nombreMunicipio [

	^ nombreMunicipio
]

{ #category : 'accessing' }
MgPoblacion >> nombrePoblacion [

	^ nombre
]

{ #category : 'printing' }
MgPoblacion >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."
	aStream
		print: nombre.
	aStream
		nextPutAll: ' - ';
		print: nombreMunicipio
]

{ #category : 'private' }
MgPoblacion >> setCodigoAtMunicipio: anObject [

	codigoAtMunicipio := anObject
]

{ #category : 'private' }
MgPoblacion >> setCodigoIneMunicipio: anObject [

	codigoIneMunicipio := anObject
]

{ #category : 'private' }
MgPoblacion >> setCodigoProvincia: anObject [

	codigoProvincia := anObject
]

{ #category : 'private' }
MgPoblacion >> setNombreMunicipio: anObject [

	nombreMunicipio := anObject
]

{ #category : 'private' }
MgPoblacion >> setNombrePoblacion: anObject [

	nombre := anObject
]
