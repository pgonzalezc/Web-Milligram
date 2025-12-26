Class {
	#name : 'Mg319ViewGridTributacionTerritorial',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg319ViewGridTributacionTerritorial >> errors [

	^ OrderedCollection new
]

{ #category : 'initialization' }
Mg319ViewGridTributacionTerritorial >> initialize [

	super initialize.
	model := Mg319ModelTributacionTerritorial new
]

{ #category : 'accessing' }
Mg319ViewGridTributacionTerritorial >> model [ 

	^ model
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderCabecerasOn: html [

	html div class: 'row'; with: [ 
		html div class: 'column'; with: [ 
			html text: ''
			 ].
		html div class: 'column'; with: [ html strong: 'Araba/Álava' ].
		html div class: 'column'; with: [ html strong: 'Guipuzcoa' ].
		html div class: 'column'; with: [ html strong: 'Bizcaia' ].
		html div class: 'column'; with: [ html strong: 'Navarra' ].
		html div class: 'column'; with: [ html strong: 'Territorio común' ].
		 ]
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderContentOn: html [
	"Renderizamos el panel correspondiente a la tributaxión por razón del territorio utilizando
	un grid para organizar los elementos en la página."

	html fieldSet: [
			self renderResultadoOn: html.
			self renderCabecerasOn: html.
			self renderDatosOn: html ]
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderDatosOn: html [

	html div
		id: 'tributacion-territorial';
		with: [
				(model porcentajeTerritorioComun < 0.0) ifTrue: [ 
					self renderRowWithMessage: 'Corrija los porcentajes de tributación de las comunidades forales. No puede sumar mas de 100%.' on: html
					 ].
				self renderPorcentajesTributacionOn: html.
				self renderPagosACuentaOn: html ]
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderEntryPorcentajeAlavaOn: html [

	html textInput
		id: #porcentajeAlava;
		class: 'porcentaje';
		onChange: (html jQuery ajax
				 callback: [ :value | model porcentajeAlava: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'tributacion-territorial') html: [ :r |
								 self renderDatosOn: r ].
						 s << (html jQuery id: #porcentajeGuipuzcoa) triggerSelect ]);
		value: (self ppImp: model porcentajeAlava)
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderEntryPorcentajeGuipuzcoaOn: html [

	html textInput
		id: #porcentajeGuipuzcoa;
		class: 'porcentaje';
		onChange: (html jQuery ajax
				 callback: [ :value | model porcentajeGuipuzcoa: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'tributacion-territorial') html: [ :r |
								 self renderDatosOn: r ].
						 s << (html jQuery id: #porcentajeVizcaya) triggerSelect ]);
		value: (self ppImp: model porcentajeGuipuzcoa)
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderEntryPorcentajeNavarraOn: html [

	html textInput
		id: #porcentajeNavarra;
		class: 'porcentaje';
		onChange: (html jQuery ajax
				 callback: [ :value | model porcentajeNavarra: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'tributacion-territorial') html: [ :r |
								 self renderDatosOn: r ].
						 s << (html jQuery id: #porcentajeAlava) triggerSelect ]);
		value: (self ppImp: model porcentajeNavarra)
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderEntryPorcentajeTerritorioComunOn: html [

	html textInput disabled
		class: 'porcentaje';
		value: (self ppImp: model porcentajeTerritorioComun)
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderEntryPorcentajeVizcayaOn: html [

	html textInput
		id: #porcentajeVizcaya;
		class: 'porcentaje';
		onChange: (html jQuery ajax
				 callback: [ :value | model porcentajeVizcaya: value asNumber ]
				 value: html jQuery this value;
				 script: [ :s |
						 s << (html jQuery id: 'tributacion-territorial') html: [ :r |
								 self renderDatosOn: r ].
						 s << (html jQuery id: #porcentajeNavarra) triggerSelect ]);
		value: (self ppImp: model porcentajeVizcaya)
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderPagosACuentaOn: html [

	html div class: 'row'; with: [ 
		html div class: 'column'; with: [ html strong: 'Pago a cuenta atribuible' ].
		html div class: 'column'; with: [ html textInput disabled class: 'importe'; value: (self ppImp: model pagoACuentaAlava) ].
		html div class: 'column'; with: [ html textInput disabled class: 'importe'; value: (self ppImp: model pagoACuentaGuipuzcoa) ].
		html div class: 'column'; with: [ html textInput disabled class: 'importe'; value: (self ppImp: model pagoACuentaVizcaya) ].
		html div class: 'column'; with: [ html textInput disabled class: 'importe'; value: (self ppImp: model pagoACuentaNavarra) ].
		html div class: 'column'; with: [ html textInput disabled class: 'importe'; value: (self ppImp: model pagoACuentaTerritorioComun) ].
		 ]
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderPorcentajesTributacionOn: html [

	html div class: 'row'; with: [ 
		html div class: 'column'; with: [ html strong: '% de tributación' ].
		html div class: 'column'; with: [ self renderEntryPorcentajeAlavaOn: html ].
		html div class: 'column'; with: [ self renderEntryPorcentajeGuipuzcoaOn: html ].
		html div class: 'column'; with: [ self renderEntryPorcentajeVizcayaOn: html ].
		html div class: 'column'; with: [ self renderEntryPorcentajeNavarraOn: html ].
		html div class: 'column'; with: [ self renderEntryPorcentajeTerritorioComunOn: html ]
		
		 ]
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderResultadoOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
						html div class: 'float-right'; with: [ 
						html html:  'Pago a cuenta a ingresar: <strong>' , (self ppImp: model resultado), '</strong>' ] ] ]
]

{ #category : 'rendering' }
Mg319ViewGridTributacionTerritorial >> renderRowWithMessage: aString on: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column column-offset-20';
					with: [
							html small
								style: 'color: indianred; padding-top: -10px';
								with: aString ] ]
]
