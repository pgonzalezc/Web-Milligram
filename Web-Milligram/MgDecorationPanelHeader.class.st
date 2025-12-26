Class {
	#name : 'MgDecorationPanelHeader',
	#superclass : 'WADecoration',
	#instVars : [
		'title',
		'subtitle',
		'detail'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'rendering' }
MgDecorationPanelHeader >> renderContentOn: html [

	html div
		class: 'container';
		with: [
				html heading level4 with: title.
				subtitle ifNotEmpty: [ html heading level6 with: subtitle ].
				detail ifNotEmpty: [ html paragraph: [ html small: detail ] ].
				self renderNextOn: html ]
]

{ #category : 'initialization' }
MgDecorationPanelHeader >> setData: aCollection [

	title := aCollection at: 1 ifAbsent: ''.
	subtitle := aCollection at: 2 ifAbsent: ''.
	detail := aCollection at: 3 ifAbsent: ''
]
