Class {
	#name : 'Mg113ViewIdentificacionContribuyente',
	#superclass : 'Mg113ViewIdentificacion',
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
Mg113ViewIdentificacionContribuyente class >> canBeRoot [ 

	^ true
	
]

{ #category : 'class initialization' }
Mg113ViewIdentificacionContribuyente class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: '/milligram/contrib'
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionContribuyente >> cancelar [ 

	(String streamContents: [ :stream | stream nextPutAll: 'Cancelada operación de edición del contribuyente' ]) record.
	self answer: nil
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionContribuyente >> enviar [

	(String streamContents: [ :stream |
		 stream nextPutAll: model asString ]) record.
	model errores ifNotEmpty: [
			('{1}#{2} Errores detectados en los datos del contribuyente' format:
				 { self class name . 'enviar' }) record.
			model errores do: [ :each | each record ].
			^ self ].
	(String streamContents: [ :stream |
			 stream nextPutAll:
				 ('{1}#{2} Validaciones del modelo pasadas. Se procede a responder'
	format: {
			self class name.
			'enviar' })])
		record.
	self answer: model
]

{ #category : 'initialization' }
Mg113ViewIdentificacionContribuyente >> initialize [

	super initialize.
	model := Mg113ModelContribuyente new
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionContribuyente >> paises [

	^ WALocale countryList collect: [ :c | '{1} - {2}' format: { c last . c first } ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionContribuyente >> renderContentOn: html [

	html div
		class: 'container';
		with: [
				html heading level4 with: 'Contribuyente'.
				self renderIdentificacionContribuyenteOn: html.
				self renderDomicilioEnPaisResidenciaOn: html
				"self renderButtonsOn: html" ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionContribuyente >> renderDomicilioEnPaisResidenciaOn: html [

	html heading level5 with: 'Domicilio en el país de residencia'.
	self renderFieldDomicilioOn: html.
	self renderFieldComplementoDomicilioOn: html.
	self renderEmailOn: html.
	self renderPaisOn: html
]

{ #category : 'rendering' }
Mg113ViewIdentificacionContribuyente >> renderEmailOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column column-40';
					with: [
							html label
								for: 'email';
								with: [ self renderWithMandatoryMark: 'e-mail' on: html ].
							html textInput
								id: 'email';
								on: #email of: model domicilio ].
				html div
					class: 'column column-20';
					with: [
							html label
								for: 'codigoPostal';
								with: [ self renderWithMandatoryMark: 'Código postal (ZIP)' on: html].
							html textInput
								id: 'codigoPostal';
								on: #codigoPostal of: model domicilio ].
				html div
					class: 'column column-40';
					with: [
							html label
								for: 'provincia';
								with: [ self renderWithMandatoryMark: 'Provincia/Region/Estado'  on: html ].
							html textInput
								id: 'provincia';
								on: #provincia of: model domicilio ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionContribuyente >> renderFieldComplementoDomicilioOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column column-80';
					with: [
							html label
								for: 'complemento';
								with: 'Datos complementarios del domicilio'.
							html textInput
								id: 'complemento';
								on: #complemento of: model domicilio ].
				html div
					class: 'column column-20';
					with: [
							html label
								for: 'poblacion';
								with: [ self renderWithMandatoryMark: 'Poblacion/Ciudad'  on: html ].
							html textInput
								id: 'poblacion';
								on: #poblacion of: model domicilio ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionContribuyente >> renderFieldDomicilioOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
							html label
								for: 'domicilio';
								with: [ self renderWithMandatoryMark: 'Domicilio' on: html ] .
							html textInput
								id: 'domicilio';
								on: #domicilio of: model domicilio ] ]
]

{ #category : 'rendering' }
Mg113ViewIdentificacionContribuyente >> renderPaisOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column column-40';
					with: [
							html label
								for: 'codigoPais';
								with: [ self renderWithMandatoryMark: 'Pais' on: html ].
							html select
								id: 'codigoPais';
								list: self paises;
								selected: model domicilio codigoPais;
								on: #pais of: model domicilio ].
				html div
					class: 'column column-20';
					with: [
							html label
								for: 'telefono';
								with: 'Teléfono'.
							html textInput
								id: 'telefono';
								on: #telefono of: model domicilio ].
				html div
					class: 'column column-20';
					with: [
							html label
								for: 'fax';
								with: 'Fax'.
							html textInput
								id: 'fax';
								on: #fax of: model domicilio ] ]
]

{ #category : 'as yet unclassified' }
Mg113ViewIdentificacionContribuyente >> siguiente [

	(String streamContents: [ :stream |
		 stream nextPutAll: model asString ]) record.
	model errores ifNotEmpty: [
			('{1}#{2} Errores detectados en los datos del contribuyente' format:
				 { self class name . 'enviar' }) record.
			model errores do: [ :each | each record ].
			^ self ].
	(String streamContents: [ :stream |
			 stream nextPutAll:
				 ('{1}#{2} Validaciones del modelo pasadas. Se procede a responder'
	format: {
			self class name.
			'enviar' })])
		record.
	self answer: model
]
