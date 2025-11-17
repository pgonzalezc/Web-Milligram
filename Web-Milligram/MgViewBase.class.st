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

{ #category : 'accessing' }
MgViewBase >> errors [

	self subclassResponsibility 
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
MgViewBase >> renderCabeceraErroresOn: html [

	html div
		class: 'row';
		with: [
				html div
					class: 'column';
					with: [ html strong id: 'title-cabecera-errores'; with: 'Corrija los siguientes errores:' ].
				html div
					class: 'column';
					with: [
							html div class: 'float-right'; with: [ 
							html anchor
								class: 'button button-clear';
								style: 'font-size: larger; margin: 0; padding: 0';
								onClick: (html jQuery id: 'error-container') hide;
								with: 'X' ] ] ]
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
MgViewBase >> renderLinkToWidget: aWidgetId on: html [

	html anchor
		url: 'javascript:void(0);';
		onClick: (html jQuery id: aWidgetId) triggerSelect scrollTop;
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
