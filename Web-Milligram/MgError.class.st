Class {
	#name : 'MgError',
	#superclass : 'Object',
	#instVars : [
		'descripcion',
		'widgetId'
	],
	#category : 'Web-Milligram-Utils',
	#package : 'Web-Milligram',
	#tag : 'Utils'
}

{ #category : 'as yet unclassified' }
MgError class >> widgetId: aSymbol descripcion: aString [

	^ self basicNew
		  setWidgetId: aSymbol;
		  setDescripcion: aString
]

{ #category : 'printing' }
MgError >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' descripcion: ';
		print: descripcion.
	aStream
		nextPutAll: ' widgetId: ';
		print: widgetId
]

{ #category : 'rendering' }
MgError >> renderAsAnchorOn: html [

	html anchor
		url: '#';
		onClick: (html jQuery id: widgetId) triggerSelect;
		with: [
				html image
					height: 15;
					width: 15;
					url: '/static-files/img/go-hand.png'.
				html space.
				html text: descripcion ]
]

{ #category : 'initialization' }
MgError >> setDescripcion: aString [

	descripcion := aString
]

{ #category : 'initialization' }
MgError >> setWidgetId: aSymbol [

	widgetId := aSymbol
]
