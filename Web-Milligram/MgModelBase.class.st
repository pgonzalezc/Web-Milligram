Class {
	#name : 'MgModelBase',
	#superclass : 'Object',
	#instVars : [
		'announcer'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'initialization' }
MgModelBase >> initialize [

	super initialize.
	announcer := Announcer new.
]
