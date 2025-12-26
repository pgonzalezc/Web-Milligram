Class {
	#name : 'Mg319ChangeResultadoAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'resultado'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'instance creation' }
Mg319ChangeResultadoAnnouncement class >> with: aNumber [

	^ self basicNew 
		setResultado: aNumber
]

{ #category : 'accessing' }
Mg319ChangeResultadoAnnouncement >> resultado [

	^ resultado
]

{ #category : 'initialization' }
Mg319ChangeResultadoAnnouncement >> setResultado: aNumber [

	resultado := aNumber
]
