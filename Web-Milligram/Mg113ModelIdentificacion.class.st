Class {
	#name : 'Mg113ModelIdentificacion',
	#superclass : 'Object',
	#instVars : [
		'nif',
		'apellidos',
		'nombre',
		'domicilio',
		'errores'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
Mg113ModelIdentificacion class >> isAbstract [

	^ self == Mg113ModelIdentificacion
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> apellidos [

	^ apellidos ifNil: [ apellidos := '' ]
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> apellidos: aString [

	(aString isNil or: [ aString trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #apellidos
					 descripcion:
					 'Apellidos no informados. Es obligatorio informar los apellidos') ].
	apellidos := aString
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> domicilio [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> errores [

	| errors |
	errors := errores copy.
	errors addAll: self domicilio errores.
	domicilio errores removeAll.
	errores removeAll.
	^ errors
]

{ #category : 'initialization' }
Mg113ModelIdentificacion >> initialize [

	super initialize.
	errores := OrderedCollection new
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nif [

	^ nif ifNil: [ nif := '' ]
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nif: aString [

	(aString isNil or: [ aString trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #nif
					 descripcion: 'NIF no informado. Es obligatorio') ].
	aString size ~= 9 ifTrue: [
			errores add: (MgError
					 widgetId: #nif
					 descripcion:
					 'NIF erróneo. Longitud incorrecta, debe ser de nueve caracteres') ].

	nif := aString
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nombre [

	^ nombre ifNil: [ nombre := '' ]
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nombre: aString [

	(aString isNil or: [ aString trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #nombre
					 descripcion: 'Nombre no informado. Es obligatorio') ].
	nombre := aString
]

{ #category : 'printing' }
Mg113ModelIdentificacion >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' nif: ';
		print: nif.
	aStream
		nextPutAll: ' apellidos: ';
		print: apellidos.
	aStream
		nextPutAll: ' nombre: ';
		print: nombre.
	aStream
		nextPutAll: ' domicilio: ';
		print: domicilio
]
