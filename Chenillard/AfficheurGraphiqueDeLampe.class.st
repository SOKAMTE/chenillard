"
Un AfficheurGraphiqueDeLampe gère un disque de couleur qui représente graphiquement la lampe.

Instance Variables
	disque:		<Morph>

disque
	- objet graphique qui représente la lampe

"
Class {
	#name : #AfficheurGraphiqueDeLampe,
	#superclass : #Object,
	#instVars : [
		'morph'
	],
	#category : #Chenillard
}

{ #category : #initialization }
AfficheurGraphiqueDeLampe >> afficherEnCarreDeCote: longueur [
	self initMorphInstanceDe: self classeMorphRectangle  largeur: longueur hauteur: longueur
]

{ #category : #initialization }
AfficheurGraphiqueDeLampe >> afficherEnDisqueDeDiametre: diametre [
	self initMorphInstanceDe: self classeMorphEllipse largeur: diametre hauteur: diametre
]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> arreterAffichage [
	self morph delete
]

{ #category : #initialization }
AfficheurGraphiqueDeLampe >> classeMorphEllipse [
	^EllipseMorph 
]

{ #category : #initialization }
AfficheurGraphiqueDeLampe >> classeMorphRectangle [
	^BorderedMorph 
]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> demarrerAffichage [
	self morph openInWorld

]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> hauteur [
	^self morph height
]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> hauteur: hauteur [
	self morph height: hauteur
]

{ #category : #initialization }
AfficheurGraphiqueDeLampe >> initMorphInstanceDe: classeMorph largeur: largeur hauteur: hauteur [
	self morph:  classeMorph new.
	self largeur: largeur.
	self hauteur: hauteur.

]

{ #category : #initialization }
AfficheurGraphiqueDeLampe >> initialize [
	super initialize.
	self afficherEnDisqueDeDiametre: self largeurMorphParDefaut
]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> largeur [
	^self morph width
]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> largeur: largeur [
	self morph width: largeur
]

{ #category : #initialization }
AfficheurGraphiqueDeLampe >> largeurMorphParDefaut [
	^70
]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> miseAJourAvec: uneLampe [
	self morph color: uneLampe couleur

]

{ #category : #accesseurs }
AfficheurGraphiqueDeLampe >> morph [
	^ morph
]

{ #category : #accesseurs }
AfficheurGraphiqueDeLampe >> morph: unMorph [
	morph ifNotNil: [ self arreterAffichage ].
	morph := unMorph
]

{ #category : #accessing }
AfficheurGraphiqueDeLampe >> name [
	^'Lampe'
]

{ #category : #accesseurs }
AfficheurGraphiqueDeLampe >> position: unPoint [
	self morph position: unPoint
]

{ #category : #affichage }
AfficheurGraphiqueDeLampe >> rootMorph [
	|root|
	root := self view.
	[ root notNil] whileTrue: [ 
		root ifNil: [ ^nil ].
		root owner == World ifTrue: [ ^root ].
		root := root owner ].
	^nil
]

{ #category : #accessing }
AfficheurGraphiqueDeLampe >> view [
	^disque
]
