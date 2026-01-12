Class {
	#name : 'MgModelDevengo',
	#superclass : 'Object',
	#instVars : [
		'ejercicio'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
MgModelDevengo >> ejercicio [

	^ ejercicio ifNil: [ ejercicio := DateAndTime now year ]
]

{ #category : 'accessing' }
MgModelDevengo >> ejercicio: anInteger [

	ejercicio := anInteger asInteger
]
