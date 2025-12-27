Class {
	#name : 'Mg113ViewEditComunicacionVariacion',
	#superclass : 'MgViewBase',
	#instVars : [
		'entidad'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg113ViewEditComunicacionVariacion >> cancelar [

	self answer: nil
]

{ #category : 'accessing' }
Mg113ViewEditComunicacionVariacion >> entidad [

	^ entidad ifNil: [ entidad := Mg113EntidadComunicacionVariacion new ]
]

{ #category : 'accessing' }
Mg113ViewEditComunicacionVariacion >> errors [

	^ OrderedCollection new
]

{ #category : 'accessing' }
Mg113ViewEditComunicacionVariacion >> fields [

	^ #( #denominacion #porcentajeTitularidad #valorMercado #valorTransmision
	     #valorAdquisicion)
]

{ #category : 'as yet unclassified' }
Mg113ViewEditComunicacionVariacion >> hecho [

	self answer: self entidad.
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderContentOn: html [

	html div
		class: 'container';
		with: [
				html heading
					level: 4;
					with: 'Nueva comunicación de variación de circunstancias'.
				html heading
					level: 6;
					with: 'Introduzca los siguientes datos:'.
				self renderFormFieldsOn: html.
				html div
					class: 'float-right';
					with: [
							html button
								class: 'button button-outline';
								on: #cancelar of: self.
							html button
								class: 'button';
								on: #hecho of: self ] ]
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderFieldDenominacionOn: html [

	self renderStringField: #denominacion withDescription: 'Denominación' on: html. 
	"
	html label
		for: #denominacion;
		with: 'Denominación'.
	html textInput
		id: #denominacion;
		on: #denominacion of: self entidad
	"
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderFieldGananciaPatrimonialOn: html [

	html label
		for: #gananciaPatrimonial;
		with: 'Ganancia Patrimonial'.
	html textInput
		id: #gananciaPatrimonial;
		disabled;
		on: #gananciaPatrimonial of: self entidad
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderFieldPorcentajeTitularidadOn: html [

	self renderNumericField: #porcentajeTitularidad withDescription: '% de titularidad' on: html.
	"
	html label
		for: #porcentajeTitularidad;
		with: '% de titularidad'.
	html textInput
		id: #porcentajeTitularidad;
		onChange: (html jQuery ajax
				 callback: [ :value |
					 entidad perform: #porcentajeTitularidad: with: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'form-fields') html: [ :canvas |
								 self renderFormFieldsOn: canvas ].
						 s << (html jQuery id: #valorMercado) triggerSelect ]);
		on: #porcentajeTitularidad of: self entidad
	"
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderFieldValorAdquisicionOn: html [

	self renderNumericField: #valorAdquisicion  withDescription: 'Valor de Adquisición' on: html.
	"
	html label
		for: #valorAdquisicion;
		with: 'Valor de Adquisición'.
	html textInput
		id: #valorAdquisicion;
		onChange: (html jQuery ajax
				 callback: [ :value |
					 entidad perform: #valorAdquisicion: with: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'form-fields') html: [ :canvas |
								 self renderFormFieldsOn: canvas ].
						 s << (html jQuery id: #denominacion) triggerSelect ]);
		on: #valorAdquisicion of: self entidad
	"
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderFieldValorMercadoOn: html [

	self renderNumericField: #valorMercado withDescription: 'Valor de Mercado' on: html 
	"
	html label
		for: #valorMercado;
		with: 'Valor de Mercado'.
	html textInput
		id: #valorMercado;
		onChange: (html jQuery ajax
				 callback: [ :value |
					 entidad perform: #valorMercado: with: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'form-fields') html: [ :canvas |
								 self renderFormFieldsOn: canvas ].
						 s << (html jQuery id: #valorTransmision) triggerSelect ]);
		on: #valorMercado of: self entidad
	"
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderFieldValorTransmisionOn: html [

	self renderNumericField: #valorTransmision withDescription: 'Valor de Transmisión' on: html.
	"
	html label
		for: #valorTransmision;
		with: 'Valor de Transmisión'.
	html textInput
		id: #valorTransmision;
		onChange: (html jQuery ajax
				 callback: [ :value |
					 entidad perform: #valorTransmision: with: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'form-fields') html: [ :canvas |
								 self renderFormFieldsOn: canvas ].
						 s << (html jQuery id: #valorAdquisicion) triggerSelect ]);
		on: #valorTransmision of: self entidad
	"
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderFormFieldsOn: html [ 

	html fieldSet
		id: 'form-fields';
		with: [
				self renderFieldDenominacionOn: html.
				self renderFieldPorcentajeTitularidadOn: html.
				self renderFieldValorMercadoOn: html.
				self renderFieldValorTransmisionOn: html.
				self renderFieldValorAdquisicionOn: html.
				self renderFieldGananciaPatrimonialOn: html ]
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderNumericField: aSymbol withDescription: aString on: html [

	html label
		for: aSymbol;
		with: aString.
	html textInput
		id: aSymbol;
		onChange: (html jQuery ajax
				 callback: [ :value |
					 entidad perform: aSymbol , ':' with: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'form-fields') html: [ :canvas |
								 self renderFormFieldsOn: canvas ].
						 s << (html jQuery id: (self succesorOf: aSymbol)) triggerSelect ]);
		on: aSymbol of: self entidad
]

{ #category : 'rendering' }
Mg113ViewEditComunicacionVariacion >> renderStringField: aSymbol withDescription: aString on: html [

	html label
		for: aSymbol;
		with: aString.
	html textInput
		id: aSymbol;
		onChange: (html jQuery ajax
				 callback: [ :value | entidad perform: aSymbol , ':' with: value ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'form-fields') html: [ :canvas |
								 self renderFormFieldsOn: canvas ].
						 s << (html jQuery id: (self succesorOf: aSymbol)) triggerSelect ]);
		on: aSymbol of: self entidad
]

{ #category : 'as yet unclassified' }
Mg113ViewEditComunicacionVariacion >> succesorOf: aSymbol [

	| next |
	next := (self fields indexOf: aSymbol) \\ self fields size + 1.
	^ self fields at: next
]

{ #category : 'instance creation' }
Mg113ViewEditComunicacionVariacion >> with: unaEntidad [

	entidad := unaEntidad
]
