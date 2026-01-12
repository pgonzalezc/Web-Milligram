Class {
	#name : 'Mg319ViewEditProducto',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg319ViewEditProducto >> cancelar [ 

	self answer: nil
]

{ #category : 'as yet unclassified' }
Mg319ViewEditProducto >> crear [

	self answer: model
]

{ #category : 'accessing' }
Mg319ViewEditProducto >> errors [

	^ OrderedCollection new
]

{ #category : 'initialization' }
Mg319ViewEditProducto >> initialize [

	super initialize.
	model := Mg319ModelProducto new
]

{ #category : 'rendering' }
Mg319ViewEditProducto >> renderBotoneraOn: html [

	html div
		class: 'float-right';
		with: [
				html button class: 'button button-outline'; id: #cancelar; callback: [ self cancelar ]; value: 'Cancelar'.
				html button
					id: #crear;
					class: 'button';
					callback: [ self crear ];
					value: 'Crear' ]
]

{ #category : 'rendering' }
Mg319ViewEditProducto >> renderContentOn: html [

	self renderFieldSetOn: html.
	self renderBotoneraOn: html
]

{ #category : 'rendering' }
Mg319ViewEditProducto >> renderFieldCuotaIvaOn: html [
	
	html label for: #cuotaIva; with: 'Cuota IVA'.
	html textInput disabled id: #cuotaIva; value: ( self ppImp: model cuotaIva ) 
]

{ #category : 'rendering' }
Mg319ViewEditProducto >> renderFieldPrecioLitroOn: html [

	html label
		for: #precioLitro;
		with: 'Precio/litro'.
	html textInput
		id: #precioLitro;
		onChange: (html jQuery ajax
				 callback: [ :value | model setPrecioLitro: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: #createProducto) html: [ :r |
								 self renderFieldSetOn: html ] ]);
		value: model precioLitro
]

{ #category : 'rendering' }
Mg319ViewEditProducto >> renderFieldSetOn: html [

	html fieldSet
		id: #createProducto;
		with: [
				self renderFieldTipoOn: html.
				self renderFieldVolumenOn: html.
				self renderFieldPrecioLitroOn: html.
				self renderFieldCuotaIvaOn: html ]
]

{ #category : 'rendering' }
Mg319ViewEditProducto >> renderFieldTipoOn: html [

	html label
		for: #tipo;
		with: #tipo capitalized.
	html select
		list: Mg319TipoProducto listaProductos ;
		selected: model tipo;
		on: #tipo of: model.
		"
	html textInput
		id: #tipo;
		onChange: (html jQuery ajax
				 callback: [ :value | model setTipo: value ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: #createProducto) html: [ :r |
								 self renderFieldSetOn: html ].
						s << (html jQuery id: #volumen) triggerSelect  ]);
		value: model tipo"
]

{ #category : 'rendering' }
Mg319ViewEditProducto >> renderFieldVolumenOn: html [

	html label
		for: #volumen;
		with: #volumen capitalized.
	html textInput
		id: #volumen;
		onChange: (html jQuery ajax
				 callback: [ :value | model setVolumen: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: #createProducto) html: [ :r |
								 self renderFieldSetOn: r ].
						 s << (html jQuery id: #precioLitro) triggerSelect ]);
		value: model volumen
]
