Class {
	#name : 'Mg319ViewTributacionTerritorial',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'rendering' }
Mg319ViewTributacionTerritorial >> renderContentOn: html [

	html div
		id: 'banner-content';
		class: 'banner';
		with: [ html text: 'Pendiente de implementar' ]
]
