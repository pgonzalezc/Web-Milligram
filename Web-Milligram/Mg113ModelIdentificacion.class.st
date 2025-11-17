Class {
	#name : 'Mg113ModelIdentificacion',
	#superclass : 'Object',
	#instVars : [
		'nif',
		'apellidos',
		'nombre',
		'domicilio'
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

	apellidos := aString
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> domicilio [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> errores [

	| errores | 
	
	errores := self valida.
	errores addAll: self domicilio errores.
	^ errores
	
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nif [

	^ nif ifNil: [ nif := '' ]
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nif: aString [

	nif := aString
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nombre [

	^ nombre ifNil: [ nombre := '' ]
]

{ #category : 'accessing' }
Mg113ModelIdentificacion >> nombre: aString [

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

{ #category : 'validation' }
Mg113ModelIdentificacion >> valida [

	"Valida el modelo y devuelve una lista con los errores encontrados"
	| errores |
	errores := OrderedCollection new.
	errores addAll: self validaNif.
	errores addAll: self validaNombre.
	errores addAll: self validaApellidos.
	^ errores
]

{ #category : 'validation' }
Mg113ModelIdentificacion >> validaApellidos [

	| errores |
	errores := OrderedCollection new.
	(apellidos isNil or: [ apellidos trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #apellidos
					 descripcion:
					 'Apellidos no informados. Es obligatorio informar los apellidos') ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelIdentificacion >> validaNif [

	| errores |
	errores := OrderedCollection new.
	(nif isNil or: [ nif trim isEmpty ]) ifTrue: [
			^ errores add: (MgError
					 widgetId: #nif
					 descripcion: 'NIF no informado. Es obligatorio'); yourself ].
	nif size ~= 9 ifTrue: [
			errores add: (MgError
					 widgetId: #nif
					 descripcion:
					 'NIF erróneo. Longitud incorrecta, debe ser de nueve caracteres') ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelIdentificacion >> validaNombre [

	| errores |
	errores := OrderedCollection new.
	(nombre isNil or: [ nombre trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #nombre
					 descripcion: 'Nombre no informado. Es obligatorio') ].

	^ errores
]
