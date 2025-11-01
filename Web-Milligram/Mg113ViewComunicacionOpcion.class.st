Class {
	#name : 'Mg113ViewComunicacionOpcion',
	#superclass : 'MgViewBase',
	#instVars : [
		'model'
	],
	#category : 'Web-Milligram-View',
	#package : 'Web-Milligram',
	#tag : 'View'
}

{ #category : 'rendering' }
Mg113ViewComunicacionOpcion >> renderContentOn: html [

	html div class: 'container'; with: [ 
		html heading level:4; with: 'Comunicación de la opción por las especialidades previstas en el apartado 6 del articulo 95 bis de la Ley del Impuesto sobre la Renta de las Personas Físicas'.
		html div class: 'banner'; with: [ html text: 'Not Implemented yet.....' ]
		 ]
]
