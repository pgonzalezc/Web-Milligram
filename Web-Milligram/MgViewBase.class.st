Class {
	#name : 'MgViewBase',
	#superclass : 'WAComponent',
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'class initialization' }
MgViewBase class >> initialize [

	<script>
	TinyLogger default
		ensureFileLoggerNamed: 'MgLogger.log'
]

{ #category : 'accessing' }
MgViewBase class >> ppImp: unImporte [

	^ GRSignPrinter new , (GRNumberPrinter new
		   precision: 2;
		   separator: $.;
		   delimiter: $,) print: unImporte
]

{ #category : 'as yet unclassified' }
MgViewBase class >> ppPorc: aNumber precision: anInteger [

	^ GRSignPrinter new , (GRNumberPrinter new
		   precision: anInteger;
		   delimiter: $,) print: aNumber
]

{ #category : 'initialization' }
MgViewBase class >> resetLoggers [

	<script>
	TinyLogger default removeAllLoggers
]

{ #category : 'accessing' }
MgViewBase >> errors [

	^ OrderedCollection new
]

{ #category : 'as yet unclassified' }
MgViewBase >> milligramCssLibs [

		^ #( '/static-files/css/fonts/roboto.css'
	     '/static-files/css/normalize/normalize.min.css'
	     '/static-files/css/milligram/milligram.min.css'
	     '/static-files/css/m113/custom.css' )
]

{ #category : 'as yet unclassified' }
MgViewBase >> milligramJsLibs [

	^ #( '/static-files/js/jquery-3.7.1/jquery.min.js' )
]

{ #category : 'accessing' }
MgViewBase >> model [

	^ nil
]

{ #category : 'accessing' }
MgViewBase >> ppImp: unImporte [ 
	^ self class ppImp: unImporte 
]

{ #category : 'as yet unclassified' }
MgViewBase >> ppPorc: aNumber precision: anInteger [

	^ self class ppPorc: aNumber precision:  anInteger
]

{ #category : 'rendering' }
MgViewBase >> renderContentOn: html [

	html div
		class: 'banner';
		with: [ html text: 'Not Implemented yet.....' ]
]

{ #category : 'rendering' }
MgViewBase >> renderErrorsOn: html [

	self errors ifNil: [ ^ self ].
	html div
		id: 'error-container';
		class: 'error-container';
		with: [
				self renderCabeceraErroresOn: html.
				html unorderedList
					id: 'lista-errores';
					class: 'lista-errores';
					with: [
							self errors do: [ :each |
										html listItem: [
													html span
														class: 'error-text';
														with: [ html text: each descripcion ].
													html space.
													self renderLinkToWidget: each widgetId on: html ] ] ] ].
	self errors removeAll.
]

{ #category : 'rendering' }
MgViewBase >> renderLinkToUrl: anUrl withText: aString on: html [

	html emphasis: aString.
	html space.
	html anchor
		url: anUrl;
		with: [
				html image
					url: '/static-files/img/external-link-symbolic.svg';
					width: 13;
					height: 13 ]
]

{ #category : 'rendering' }
MgViewBase >> renderWithMandatoryMark: aString on: html [

	html span style: 'color: red'; with: ' * '.
	html text: aString
]

{ #category : 'updating' }
MgViewBase >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot beHtml5.
	aHtmlRoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1.0'.
	self milligramCssLibs do: [ :each | aHtmlRoot stylesheet url: each ].
	self milligramJsLibs do: [ :each | aHtmlRoot javascript url: each ].
	aHtmlRoot stylesheet url: '/static-files/css/default.css'.
]
