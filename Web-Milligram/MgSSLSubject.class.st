Class {
	#name : 'MgSSLSubject',
	#superclass : 'Object',
	#instVars : [
		'commonName',
		'surname',
		'givenName',
		'serialNumber',
		'country'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'accessing' }
MgSSLSubject >> commonName [

	^ commonName
]

{ #category : 'accessing' }
MgSSLSubject >> commonName: anObject [

	commonName := anObject
]

{ #category : 'accessing' }
MgSSLSubject >> country [

	^ country
]

{ #category : 'accessing' }
MgSSLSubject >> country: anObject [

	country := anObject
]

{ #category : 'accessing' }
MgSSLSubject >> givenName [

	^ givenName
]

{ #category : 'accessing' }
MgSSLSubject >> givenName: anObject [

	givenName := anObject
]

{ #category : 'printing' }
MgSSLSubject >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."
	
	aStream
		print: commonName.
	aStream
		nextPutAll: ' - ';
		print: surname.
	aStream
		nextPutAll: ' - ';
		print: givenName.
	aStream
		nextPutAll: ' - ';
		print: serialNumber.
	aStream
		nextPutAll: ' - ';
		print: country
]

{ #category : 'accessing' }
MgSSLSubject >> serialNumber [

	^ serialNumber
]

{ #category : 'accessing' }
MgSSLSubject >> serialNumber: anObject [

	serialNumber := anObject
]

{ #category : 'accessing' }
MgSSLSubject >> surname [

	^ surname
]

{ #category : 'accessing' }
MgSSLSubject >> surname: anObject [

	surname := anObject
]
