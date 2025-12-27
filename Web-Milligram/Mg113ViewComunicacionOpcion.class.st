Class {
	#name : 'Mg113ViewComunicacionOpcion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
Mg113ViewComunicacionOpcion >> errors [

	^ OrderedCollection new
]

{ #category : 'accessing' }
Mg113ViewComunicacionOpcion >> model [

	^ nil
]

{ #category : 'rendering' }
Mg113ViewComunicacionOpcion >> renderContentOn: html [

		html div class: 'banner'; with: [ html text: 'Not Implemented yet.....' ]

]
