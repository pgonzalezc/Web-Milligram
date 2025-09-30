Class {
	#name : 'Mg113ViewComunicacionVariacion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'testing' }
Mg113ViewComunicacionVariacion class >> canBeRoot [ 

	^ true
]

{ #category : 'class initialization' }
Mg113ViewComunicacionVariacion class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: '/milligram/m113'
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> añadir [
	"Abre el comoponente para editar los datos de una nueva entidad"

	| answer |
	answer := self call: Mg113ViewEditComunicacionVariacion new.
	answer ifNotNil: [ model entidades add: answer ]
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> borrar: anIndex [

	model entidades removeAt: anIndex
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> enviar [ 

	Transcript show: model asString; cr
]

{ #category : 'as yet unclassified' }
Mg113ViewComunicacionVariacion >> headings [

	^ #( 'Denominación de los valores'
	               '% de titularidad' 'Valor de mercado (art. 95 bis 2)'
	               'Valor de transmisión (art. 95 bis 6.b)'
	               'Valor de adquisición' 'Ganancia patrimonial' ).
]

{ #category : 'initialization' }
Mg113ViewComunicacionVariacion >> initialize [ 

	super initialize.
	model := Mg113ModelComunicacionVariacion new
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionA [

	^ model opcionA
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionA: aBoolean [

	model opcionA: aBoolean
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionB [

	^ model opcionB
]

{ #category : 'accessing' }
Mg113ViewComunicacionVariacion >> opcionB: aBoolean [

	model opcionB: aBoolean
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderButtonsOn: html [

	html div
		class: 'float-right';
		with: [ html submitButton on: #enviar of: self ]
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderCheckBoxFor: aSelector withLabel: aHtmlString on: html [

	html label
		class: 'label-inline';
		for: aSelector;
		with: [ html html: aHtmlString].
	html space.
	html checkbox
		id: aSelector;
		on: aSelector of: model.
	html break
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderCheckboxesOn: html [

	html fieldSet: [
			self
				renderCheckBoxFor: #opcionA
				withLabel:
				'a) <strong>COMUNICO</strong> el cambio de Estado de residencia'
				on: html.
			self
				renderCheckBoxFor: #opcionB
				withLabel: 'b) <strong>COMUNICO</strong> el cambio de domicilio'
				on: html.
			self
				renderCheckBoxFor: #opcionC
				withLabel:
				'c) <strong>COMUNICO</strong> la transmisión intervivos de los siguientes valores'
				on: html ]
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderContentOn: html [

	html form: [
			html div
				class: 'container';
				with: [
						self renderCheckboxesOn: html.
						self renderEntidadesOn: html.
						self renderButtonsOn: html ] ]
]

{ #category : 'rendering' }
Mg113ViewComunicacionVariacion >> renderEntidadesOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
							html heading
								level4;
								with: 'Entidades' ].
				html div
					class: 'column';
					with: [
							html button
								class: 'button button-outline float-right';
								on: #añadir of: self ] ].
	html table: [
			html tableHead: [
					html tableHeading.
					self headings do: [ :each | html tableHeading: each ] ].
			html tableBody: [
					model entidades doWithIndex: [ :each :idx |
							html tableRow: [
									html tableData: [
											html anchor
												callback: [ self borrar: idx ];
												with: [
													html image url: '/static-files/img/user-trash.png' ] ].
									each renderOn: html ] ] ].
			html tableFoot: [
					html tableRow: [
							html tableData
								colSpan: 6;
								with: 'Total ganancias patrimoniales'.
							html tableData:
								(self ppImp: model totalGananciasPatrimoniales) ] ] ]
]
