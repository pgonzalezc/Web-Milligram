Class {
	#name : 'Mg796ChangeResultadoAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'resultado'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
Mg796ChangeResultadoAnnouncement class >> with: aNumber [

	^ self basicNew
		setResultado: aNumber
]

{ #category : 'accessing' }
Mg796ChangeResultadoAnnouncement >> resultado [

	^ resultado
]

{ #category : 'accessing' }
Mg796ChangeResultadoAnnouncement >> resultado: anObject [

	resultado := anObject
]

{ #category : 'accessing' }
Mg796ChangeResultadoAnnouncement >> setResultado: anObject [

	resultado := anObject
]
