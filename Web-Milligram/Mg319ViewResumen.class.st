Class {
	#name : 'Mg319ViewResumen',
	#superclass : 'MgViewBase',
	#instVars : [
		'models'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg319ViewResumen >> errors [

	^ OrderedCollection new 
]

{ #category : 'accessing' }
Mg319ViewResumen >> models: aCollection [

	models := aCollection
]

{ #category : 'rendering' }
Mg319ViewResumen >> renderContentOn: html [

	html div class: 'banner'; with: [ html text: 'Not Implemented yet.....' ]
]
