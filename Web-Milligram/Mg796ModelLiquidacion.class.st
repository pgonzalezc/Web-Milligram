Class {
	#name : 'Mg796ModelLiquidacion',
	#superclass : 'MgModelBase',
	#instVars : [
		'partidas',
		'esComplementaria'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> enablePartida14 [

	^ esComplementaria not
]

{ #category : 'initialization' }
Mg796ModelLiquidacion >> initialize [

	super initialize.
	partidas := OrderedCollection new: 15 withAll: 0.0.
	"Los porcentajes los inicializamos al 100%"
	partidas at: 9 put: 100.0.
	partidas at: 12 put: 100.0.
	esComplementaria := false.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida01 [

	^ partidas first
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida01: aNumber [

	partidas at: 1 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida02 [

	^ partidas second
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida02: aNumber [

	self halt.
	partidas at: 2 put: aNumber
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida03 [

	^ partidas third
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida03: aNumber [

	partidas at: 3 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida04 [

	^ partidas fourth 
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida04: aNumber [

	partidas at: 4 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida05 [

	^ partidas fifth
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida05: aNumber [

	partidas at: 5 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida06 [

	^ partidas sixth 
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida06: aNumber [

	partidas at: 6 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida07 [

	| sum |
	sum := 0.0.
	3 to: 6 do: [ :idx | sum := sum + (partidas at: idx) ].
	^ sum
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida08 [

	^ self partida02 - self partida07 
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida09 [

	^ partidas ninth 
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida09: aNumber [

	partidas at: 9 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida10 [

	^ (self partida08 * self partida09) / 100.0 
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida11 [

	^ self partida10
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida12 [

	^ partidas at: 12 
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida12: aNumber [

	partidas at: 12 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida13 [

	^ (self partida11 * self partida12) / 100.0
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida14 [

	^ partidas at: 14
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida14: aNumber [

	partidas at: 14 put: aNumber.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> partida15 [

	^ self partida13 - self partida14 
]

{ #category : 'initialization' }
Mg796ModelLiquidacion >> setComplementaria: anAnnouncement [

	esComplementaria := anAnnouncement complementaria.
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida01 [

	^ 'Importe Neto de la Cifra de Negocios (ICNN) TOTAL. [01]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida02 [

	^ 'ICCN derivado de la actividad en España del año natural anterior. [02]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida03 [

	^ 'Ingresos correspondientes al Impuesto sobre Hidrocarburos [03]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida04 [

	^ 'Impuesto Especial de la CA de Canarias sobre Combustibles Derivados del Petróleo [04]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida05 [

	^ 'Gravámenes Complementarios a Carburantes y Combustibles Petrolíferos de Ceuta y Melilla [05]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida06 [

	^ 'Ingresos corrrespondientes a Actividades Reguladas [06]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida07 [

	^ 'TOTAL. Importes excluídos de INCN [07]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida08 [

	^ 'Base para el cálculo de la prestación [08] = [02] - [07]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida09 [

	^ 'Porcentaje aplicable para determinar la Prestación [09]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida10 [

	^ 'Prestación resultante [10] = [08] x [09]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida11 [

	^ 'BASE PARA EL CÁCULO DEL PAGO ANTICIPADO [11] = [10]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida12 [

	^ 'Porcentaje de pago anticipado [12]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida13 [

	^ 'Resultado del pago anticipado [13] = [11] % [12]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida14 [

	^ 'A deducir [14]'
]

{ #category : 'as yet unclassified' }
Mg796ModelLiquidacion >> textoPartida15 [

	^ 'RESULTADO DEL PAGO ANTICIPADO [15]'
]
