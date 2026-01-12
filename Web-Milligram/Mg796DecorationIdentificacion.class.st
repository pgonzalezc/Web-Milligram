Class {
	#name : 'Mg796DecorationIdentificacion',
	#superclass : 'WADecoration',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'rendering' }
Mg796DecorationIdentificacion >> renderContentOn: html [

	self renderNextOn: html.

	html div class: 'row'; with: [ 
		html div class: 'column'; with: [ html text: 'Principales epigrafes IAE' ].
		html div class: 'column'; with: [ html textInput ].
		html div class: 'column'; with: [ html textInput ].
		html div class: 'column'; with: [ html textInput ].
		html div class: 'column'; with: [ html textInput ]
		 ].
	html div class: 'row'; with: [ 
		html div class: 'column'; with: [ 
		html checkbox id: #grupoFiscal. html label for: #grupoFiscal; class: 'label-inline'; with: 'Grupo fiscal Régimen Consolidación Fiscal IS'.
		html break.
		html checkbox id: #grupoMercantil. html label for: #grupoMercantil; class: 'label-inline'; with: 'Grupo Mercantil (art. 42 Código de Comercio)'].
	html div class: 'column'; with: [ 
		html label for: #numeroGrupo; with: 'Número de grupo'. 
		html textInput id: #numeroGrupo.
	] ].
html div class: 'row'; with: [
		html div class: 'column column-20'; with: [ 
	html label for: #telefono; with: 'Teléfono'.
	html textInput id: #telefono
	 ].
html div class: 'column'; with: [ html label for: #presonaContacto; with: 'Persona de contacto'.
	html textInput id: #personaContacto ] ]
]
