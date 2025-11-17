Class {
	#name : 'MgViewModelBanner',
	#superclass : 'MgViewBase',
	#instVars : [
		'code',
		'description'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'adding' }
MgViewModelBanner >> addDescription: aString [

	description ifNil: [ description := OrderedCollection new ].
	description add: aString
]

{ #category : 'accessing' }
MgViewModelBanner >> errors [

	^ #()
]

{ #category : 'rendering' }
MgViewModelBanner >> renderContentOn: html [

	html div
		class: 'container';
		with: [
				html div with: [
							html div
								class: 'model-code';
								with: [
										html strong
											style: 'font-size: 18pt';
											with: 'Modelo ' , code ].
							html div with: [
									description allButLast do: [ :each |
											html span
												style: 'font-weight: bold';
												with: [ html text: each ] ] ].

							html span
								style: 'font-size: 10pt; text-decoration: none';
								with: [
									self
										renderLinkToUrl: 'articulo95'
										withText: description last
										on: html ] ].
				html div
					id: 'banner-content';
					class: 'banner';
					with: [
							html text:
									'Pulse ''siguiente'' para proceder a rellenar el formulario de representación' ].
				html div
					id: 'related-links';
					class: 'related-links';
					style: 'font-size: smaller';
					with: [
							html strong:
									'Puede consultar los siguientes enlaces si necesita más información:'.
							html unorderedList
								style: 'list-style-type: none; padding-left: 5ex';
								with: [
										html listItem: [
													self
														renderLinkToUrl: 'enlace1'
														withText: 'enlace de interes #1'
														on: html ].
										html listItem: [
													self
														renderLinkToUrl: 'enlace2'
														withText: 'enlace de interes #2'
														on: html ].
										html listItem: [
													self
														renderLinkToUrl: 'enlace3'
														withText: 'enlace de interes #3'
														on: html ] ] ] ]
]

{ #category : 'initialization' }
MgViewModelBanner >> setCode: aModelCode [

	code := aModelCode
]

{ #category : 'initialization' }
MgViewModelBanner >> setDescription: aCollection [

	description := aCollection
]
