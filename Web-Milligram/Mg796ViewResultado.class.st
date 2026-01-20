Class {
	#name : 'Mg796ViewResultado',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
Mg796ViewResultado class >> withModel: aModel [

	^ self new 
		setModel: aModel
]

{ #category : 'initialization' }
Mg796ViewResultado >> initialize [

	super initialize
	
]

{ #category : 'accessing' }
Mg796ViewResultado >> model [ 

	^ model
]

{ #category : 'rendering' }
Mg796ViewResultado >> renderContentOn: html [

	html fieldSet
		id: #'fs-resultado';
		with: [
				self renderPartida13On: html.
				self renderPartidaNro: 14 on: html.
				self renderPartida15On: html ]
]

{ #category : 'rendering' }
Mg796ViewResultado >> renderPartida13On: html [
	"partia13 - Resultado del pago anticipado"
	
	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: model textoPartida13 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida13;
								class: #importe;
								value: model partida13;
								disabled ] ]
]

{ #category : 'rendering' }
Mg796ViewResultado >> renderPartida15On: html [
	"partia15 - Resultado del pago anticipado"

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: model textoPartida15 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida15;
								class: #importe;
								value: model partida15;
								disabled ] ]
]

{ #category : 'rendering' }
Mg796ViewResultado >> renderPartidaNro: idx on: html [

	| partida partidaSiguiente getterTextoPartida setter getter |
	partida := 'partida' , (idx asString padLeftTo: 2 with: $0).
	partidaSiguiente := 'partida'
	                    , ((idx + 1) asString padLeftTo: 2 with: $0).
	getterTextoPartida := 'textoPartida'
	                      , (idx asString padLeftTo: 2 with: $0).
	getter := partida asSymbol.
	setter := (partida , ':') asSymbol.
	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
							html text: (model perform: getterTextoPartida asSymbol).
							html small:
									' (Sólo en caso de autoliquidación complementaria; resultado a ingresar procedente de autoliquidaciones anteriores coorespondientes al mismo ejercicio' ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: partida;
								class: #importe;
								disabled: model enablePartida14 ;
								onChange: (html jQuery ajax
										 callback: [ :value |
											 model perform: setter with: value asNumber ]
										 value: html jQuery this value;
										 script: [ :s |
												 s << (html jQuery id: #'m796-liquidacion') replaceWith: [
														 :r | self renderContentOn: r ].
												 s << (html jQuery id: partidaSiguiente) triggerSelect ]);
								value: (self ppImp: (model perform: getter));
								callback: [ :value |
								model perform: setter with: value asNumber ] ] ]
]

{ #category : 'initialization' }
Mg796ViewResultado >> setModel: aModel [

	model := aModel
]
