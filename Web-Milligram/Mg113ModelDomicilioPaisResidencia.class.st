Class {
	#name : 'Mg113ModelDomicilioPaisResidencia',
	#superclass : 'Object',
	#instVars : [
		'errores',
		'domicilio',
		'complemento',
		'poblacion',
		'email',
		'codigoPostal',
		'provincia',
		'pais',
		'telefono',
		'fax'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> codigoPais [

	^ ($- split: self pais) last trim
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> codigoPostal [

	^ codigoPostal ifNil: [ codigoPostal := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> codigoPostal: anObject [

	(anObject isNil or: [ anObject isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #codigoPostal
					 descripcion: 'Código postal sin informar. Es obligatorio') ].
	codigoPostal := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> complemento [

	^ complemento ifNil: [ complemento := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> complemento: anObject [

	complemento := anObject
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> domicilio [

	^ domicilio ifNil: [ domicilio := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> domicilio: aString [

	(aString isNil or: [ aString trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #domicilio
					 descripcion: 'Domicilio no informado. Es obligatorio') ].
	domicilio := aString
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> email [

	^ email ifNil: [ email := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> email: aString [

	(aString isNil or: [aString trim isEmpty]) ifTrue: [ 
		errores add: (MgError widgetId: #email descripcion: 'Email no informado. Es obligatorio' ) ].
	(aString matchesRegex: '^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+$') ifFalse: [ 
		errores add: (MgError widgetId: #email descripcion: 'Email incorrecto. No tiene un formato válido') ].
	email := aString
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> errores [

	^ errores
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> fax [

	^ fax ifNil: [ fax := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> fax: anObject [

	fax := anObject
]

{ #category : 'initialization' }
Mg113ModelDomicilioPaisResidencia >> initialize [

	super initialize.
	errores := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Mg113ModelDomicilioPaisResidencia >> nombrePais [

	^ ($- split: self pais) first trim
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> pais [

	^ pais ifNil: [ pais := 'SPAIN - ES' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> pais: aString [

	 (aString isNil or: [aString trim isEmpty]) ifTrue: [ 
		errores add: (MgError widgetId: #pais descripcion: 'Pais no informado. Es obligatorio') ].
	pais := aString
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> poblacion [

	^ poblacion ifNil: [ poblacion := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> poblacion: aString [

	(aString isNil or: [aString trim isEmpty]) ifTrue: [ 
		errores add: (MgError widgetId: #poblacion descripcion: 'Poblacion/Ciudad no informada. Es obligatorio')
		 ].
	poblacion := aString
]

{ #category : 'printing' }
Mg113ModelDomicilioPaisResidencia >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' domicilio: ';
		print: domicilio.
	aStream
		nextPutAll: ' complemento: ';
		print: complemento.
	aStream
		nextPutAll: ' poblacion: ';
		print: poblacion.
	aStream
		nextPutAll: ' email: ';
		print: email.
	aStream
		nextPutAll: ' codigoPostal: ';
		print: codigoPostal.
	aStream
		nextPutAll: ' provincia: ';
		print: provincia.
	aStream
		nextPutAll: ' pais: ';
		print: pais.
	aStream
		nextPutAll: ' telefono: ';
		print: telefono.
	aStream
		nextPutAll: ' fax: ';
		print: fax
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> provincia [

	^ provincia ifNil: [ provincia := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> provincia: aString [

	(aString isNil or: [aString trim isEmpty]) ifTrue: [ 
		errores add: (MgError widgetId: #provincia descripcion: 'Provincia/Region/Estado no informada. Es obligatorio' )
		 ].
	provincia := aString
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> telefono [

	^ telefono ifNil: [ telefono := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> telefono: anObject [

	telefono := anObject
]
