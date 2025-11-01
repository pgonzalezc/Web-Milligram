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
MgError class >> descripcion: aString [

	^ self basicNew descripcion: aString
]

{ #category : 'as yet unclassified' }
MgError class >> descripcion: aString widgetId: aWidgetId [

		^ self basicNew
		  setWidgetId: aWidgetId;
		  setDescripcion: aString
]

{ #category : 'as yet unclassified' }
MgError class >> widgetId: aSymbol descripcion: aString [

	^ self basicNew
		  setWidgetId: aSymbol;
		  setDescripcion: aString
]

{ #category : 'accessing' }
MgError >> descripcion [

	^ descripcion
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

{ #category : 'private' }
MgError >> setDescripcion: aString [

	descripcion := aString
]

{ #category : 'private' }
MgError >> setWidgetId: aSymbol [

	widgetId := aSymbol
]

{ #category : 'accessing' }
MgError >> widgetId [

	^ widgetId
]
