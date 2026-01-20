Class {
	#name : 'Mg796ViewLiquidacion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'initialization' }
Mg796ViewLiquidacion >> initialize [

	super initialize.
	model := Mg796ModelLiquidacion new
]

{ #category : 'accessing' }
Mg796ViewLiquidacion >> model [ 

	^ model
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderContentOn: html [

	html fieldSet id: #'m796-liquidacion'; with: [ 
		html paragraph: 'I. Prestación patrimonial. Gravamen temporal'.
		self renderPartida01On: html.
		self renderPartida02On: html.
		"self renderPartidaNro: 2 on: html."
		html paragraph: 'Importes excluidos del INCN, pagados o soportados vía repercusión:'.
		
		self renderPartidaNro: 3 on: html.
		self renderPartidaNro: 4 on: html.
		self renderPartidaNro: 5 on: html.
		self renderPartidaNro: 6 on: html.
		
		self renderPartida07On: html.
		self renderPartida08On: html.
		
		self renderPartidaPorcentajeNro: 9 on: html.
		self renderPartida10On: html.
		self renderPartida11On: html.
		self renderPartidaPorcentajeNro: 12 on: html.
		 ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartida01On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [
							html text: model textoPartida01 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida01;
								class: #importe;
								value: (self ppImp: model partida01);
								callback: [ :value | model partida01: value asNumber ] ] ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartida02On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: model textoPartida02 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida02;
								class: #importe;
								onChange: (html jQuery ajax
										 callback: [ :value |
												 model partida02: value asNumber.
												 model inspect ]
										 value: html jQuery this value);
								value: (self ppImp: model partida02);
								callback: [ :value | model partida02: value asNumber ] ] ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartida07On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: model textoPartida07 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida07;
								class: #importe;
								disabled;
								value: (self ppImp: model partida07) ] ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartida08On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: model textoPartida08 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida08;
								class: #importe;
								disabled;
								value: (self ppImp: model partida08) ] ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartida10On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: model textoPartida10 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida10;
								class: #importe;
								disabled;
								value: (self ppImp: model partida10) ] ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartida11On: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: model textoPartida11 ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: #partida11;
								class: #importe;
								disabled;
								value: (self ppImp: model partida11) ] ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartidaNro: idx on: html [

	| partida partidaSiguiente getterTextoPartida setter getter|
	partida := 'partida',(idx asString padLeftTo: 2 with: $0).
	partidaSiguiente := 'partida',((idx + 1) asString padLeftTo: 2 with: $0).
	getterTextoPartida := 'textoPartida',(idx asString padLeftTo: 2 with: $0).
	getter := partida asSymbol .
	setter := (partida,':') asSymbol.
	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: (model perform: getterTextoPartida asSymbol) ].
				html div
					class: 'column column-20';
					with: [
							html textInput
								id: partida;
								class: #importe;
								onChange: (html jQuery ajax
										 callback: [ :value | model perform: setter with: value asNumber ]
										 value: html jQuery this value;
										 script: [ :s |
												 s << (html jQuery id: #'m796-liquidacion') replaceWith: [
														 :r | self renderContentOn: r ].
												 s << (html jQuery id: partidaSiguiente ) triggerSelect ]);
								value: (self ppImp: (model perform: getter));
								callback: [ :value | model perform: setter with: value asNumber ] ] ]
]

{ #category : 'rendering' }
Mg796ViewLiquidacion >> renderPartidaPorcentajeNro: idx on: html [

	| partida partidaSiguiente getterTextoPartida setter getter|
	partida := 'partida',(idx asString padLeftTo: 2 with: $0).
	partidaSiguiente := 'partida',((idx + 1) asString padLeftTo: 2 with: $0).
	getterTextoPartida := 'textoPartida',(idx asString padLeftTo: 2 with: $0).
	getter := partida asSymbol .
	setter := (partida,':') asSymbol.
	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html text: (model perform: getterTextoPartida asSymbol) ].
				html div
					class: 'column column-10';
					with: [
							html textInput
								id: partida;
								class: #porcentaje;
								onChange: (html jQuery ajax
										 callback: [ :value | model perform: setter with: value asNumber ]
										 value: html jQuery this value;
										 script: [ :s |
												 s << (html jQuery id: #'m796-liquidacion') replaceWith: [
														 :r | self renderContentOn: r ].
												 s << (html jQuery id: partidaSiguiente ) triggerSelect ]);
								value: (self ppImp: (model perform: getter));
								callback: [ :value | model perform: setter with: value asNumber ].
						].
				html div class: 'column column-10'; with: [ html text: '%' ] ]
]
