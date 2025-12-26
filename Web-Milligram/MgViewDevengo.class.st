Class {
	#name : 'MgViewDevengo',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
MgViewDevengo >> errors [ 

	^ OrderedCollection new
]

{ #category : 'initialization' }
MgViewDevengo >> initialize [ 

	super initialize.
	model := MgModelDevengo new
]

{ #category : 'accessing' }
MgViewDevengo >> model [

	^ model
]

{ #category : 'rendering' }
MgViewDevengo >> renderContentOn: html [

	html fieldSet: [
		html div class: 'row'; with: [ 
			html div class: 'column column-10'; with: [self renderFieldEjercicioOn: html]. 
		 ] ]
]

{ #category : 'rendering' }
MgViewDevengo >> renderFieldEjercicioOn: html [

	html label
		for: 'ejercicio';
		with: 'Ejercicio'.
	html textInput
		id: 'ejercicio';
		on: #ejercicio of: model
]
