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

{ #category : 'initialization' }
MgViewBase class >> resetLoggers [

	<script>
	TinyLogger default removeAllLoggers
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
MgViewBase >> ppImp: unImporte [ 
	^ self class ppImp: unImporte 
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
	aHtmlRoot stylesheet url: '/static-files/css/default.css'.
	self milligramCssLibs do: [ :each | aHtmlRoot stylesheet url: each ].
	self milligramJsLibs do: [ :each | aHtmlRoot javascript url: each ]
]
