Class {
	#name : 'MgWebError',
	#superclass : 'Object',
	#instVars : [
		'descripcion',
		'widgetId'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'as yet unclassified' }
MgWebError class >> descripction: aString [

	^ self basicNew setDescription: aString
]

{ #category : 'as yet unclassified' }
MgWebError class >> description: aString atWidgetId: aWidgetId [

	^ self basicNew setDescription: aString; setWidgetId: aWidgetId
]

{ #category : 'accessing' }
MgWebError >> descripcion [

	^ descripcion
]

{ #category : 'accessing' }
MgWebError >> setDescription: aString [

	descripcion := aString
]

{ #category : 'accessing' }
MgWebError >> setWidgetId: aWidgetId [

	widgetId := aWidgetId
]

{ #category : 'accessing' }
MgWebError >> widgetId [

	^ widgetId
]
