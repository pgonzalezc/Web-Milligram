Class {
	#name : 'Mg113ModelDomicilioPaisResidencia',
	#superclass : 'Object',
	#instVars : [
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

	domicilio := aString
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> email [

	^ email ifNil: [ email := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> email: aString [

	email := aString
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> errores [

	^ self valida
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

	pais := aString
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> poblacion [

	^ poblacion ifNil: [ poblacion := '' ]
]

{ #category : 'accessing' }
Mg113ModelDomicilioPaisResidencia >> poblacion: aString [

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

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> valida [
	"valida los campos del domicilio en el país de residencia y devuelve una lista de los errores encontrados"

	| errores |
	errores := OrderedCollection new.
	errores addAll: self validaDomicilio.
	errores addAll: self validaComplemento.
	errores addAll: self validaPoblacion.
	errores addAll: self validaEmail.
	errores addAll: self validaCodigoPostal.
	errores addAll: self validaProvincia.
	errores addAll: self validaTelefono.
	errores addAll: self validaFax.
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaCodigoPostal [

	| errores |
	errores := OrderedCollection new.
	(codigoPostal isNil or: [ codigoPostal isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #codigoPostal
					 descripcion: 'Código postal sin informar. Es obligatorio') ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaComplemento [

	^ #()
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaDomicilio [

	| errores |
	errores := OrderedCollection new.
	(domicilio isNil or: [ domicilio trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #domicilio
					 descripcion: 'Domicilio no informado. Es obligatorio') ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaEmail [

	| errores |
	errores := OrderedCollection new.
	(email isNil or: [ email trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #email
					 descripcion: 'Email no informado. Es obligatorio') ].
	(email matchesRegex: '^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+$') ifFalse: [
			errores add: (MgError
					 widgetId: #email
					 descripcion: 'Email incorrecto. No tiene un formato válido') ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaFax [

	| errores |
	errores := OrderedCollection new.
	(fax isNotNil and: [ fax trim isNotEmpty ]) ifTrue: [ 
		fax trim size = 9 ifFalse: [ errores add: (MgError
					 widgetId: #fax
					 descripcion:
					 'Fax invalido. Número de dígitos del fax incorrecto') ]
		 ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaPoblacion [

	| errores |
	errores := OrderedCollection new.
	(poblacion isNil or: [ poblacion trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #poblacion
					 descripcion: 'Poblacion/Ciudad no informada. Es obligatorio') ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaProvincia [

	| errores |
	errores := OrderedCollection new.
	(provincia isNil or: [ provincia trim isEmpty ]) ifTrue: [
			errores add: (MgError
					 widgetId: #provincia
					 descripcion:
					 'Provincia/Region/Estado no informada. Es obligatorio') ].
	^ errores
]

{ #category : 'validation' }
Mg113ModelDomicilioPaisResidencia >> validaTelefono [

	| errores |
	errores := OrderedCollection new.
	(telefono isNotNil and: [ telefono trim isNotEmpty ]) ifTrue: [ 
		telefono trim size = 9 ifFalse: [ errores add: (MgError
					 widgetId: #telefono
					 descripcion:
					 'Telefono invalido. Número de dígitos del teléfono incorrecto') ]
		 ].
	^ errores
]
