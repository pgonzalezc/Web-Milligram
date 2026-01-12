Class {
	#name : 'MgViewIdentificacion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'converting' }
MgViewIdentificacion >> asAcronim: aSymbol [

	^ aSymbol inject: '' into: [ :acc :c | acc,c uppercase asString,'.'].
]

{ #category : 'accessing' }
MgViewIdentificacion >> errors [

	^ model valida
]

{ #category : 'initialization' }
MgViewIdentificacion >> initialize [

	super initialize.
	model := MgModelIdentificacion new addCheck: [ :value |
			         value size = 9
				         ifTrue: [ "OK" ]
				         ifFalse: [
						         MgError
							         widgetId: #nif
							         descripcion:
							         'El NIF debe tener una longitud de 9 caracteres' ] ] for: #nif
]

{ #category : 'accessing' }
MgViewIdentificacion >> model [

	^ model
]

{ #category : 'rendering' }
MgViewIdentificacion >> renderContentOn: html [

	html fieldSet: [ 
		html div class: 'row'; with: [ 
		html div class: 'column column-20'; with: [self renderFieldNifOn: html].
		html div class: 'column column-50'; with: [self renderFieldApellidosOn: html].
		html div class: 'column'; with: [ self renderFieldNombreOn: html ]
		 ] ]
]

{ #category : 'rendering' }
MgViewIdentificacion >> renderFieldApellidosOn: html [

	html label
		for: 'apellidos';
		with: 'Apellidos'.
	html textInput
		id: 'apellidos';
		on: #apellidos of: model
]

{ #category : 'rendering' }
MgViewIdentificacion >> renderFieldNifOn: html [

	html label for: #nif; with: (self asAcronim: #nif).
	html textInput id: #nif; maxLength: 9; on: #nif of: model
]

{ #category : 'rendering' }
MgViewIdentificacion >> renderFieldNombreOn: html [

	html label for: #nombre; with: #nombre asString capitalized.
	html textInput id: #nombre; on: #nombre of: model
]
