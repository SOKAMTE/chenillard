"
Une lampe  dispose d'une couleur et sait si elle est allumée ou non à un instant donnée. Elle connait un afficheur auquel elle notifie ses changements d'état. 
"
Class {
	#name : #Lampe,
	#superclass : #Object,
	#instVars : [
		'estAllumee',
		'couleur',
		'afficheur'
	],
	#category : #Chenillard
}

{ #category : #accessing }
Lampe >> afficheur [
	^ afficheur
]

{ #category : #accessing }
Lampe >> afficheur: anObject [
	afficheur := anObject.
	self mettreAJourAfficheur
]

{ #category : #etat }
Lampe >> allumer [
	self estAllumee: true
]

{ #category : #affichage }
Lampe >> arreterAffichage [
	self afficheur ifNil: [ ^self ].
	self afficheur arreterAffichage
]

{ #category : #apparence }
Lampe >> couleur [
	self estAllumee ifFalse: [ ^self couleurLampeEteinte ].
	^ couleur
]

{ #category : #apparence }
Lampe >> couleur: uneCouleur [
	couleur := uneCouleur.
	self mettreAJourAfficheur
]

{ #category : #apparence }
Lampe >> couleurLampeEteinte [
	^Color black
]

{ #category : #initialisation }
Lampe >> couleurParDefaut [
	^Color yellow
]

{ #category : #affichage }
Lampe >> demarrerAffichage [
	self afficheur ifNil: [^self].
	self afficheur demarrerAffichage
]

{ #category : #etat }
Lampe >> estAllumee [
	^ estAllumee
]

{ #category : #etat }
Lampe >> estAllumee: unBooleen [
	estAllumee := unBooleen.
	self mettreAJourAfficheur 
]

{ #category : #initialisation }
Lampe >> estAllumeeParDefaut [
	^false
]

{ #category : #etat }
Lampe >> eteindre [
	self estAllumee: false
]

{ #category : #initialisation }
Lampe >> initialize [
	super initialize.
	self estAllumee: self estAllumeeParDefaut.
	self couleur: self couleurParDefaut 
]

{ #category : #apparence }
Lampe >> mettreAJourAfficheur [
	self afficheur ifNil: [ ^self ].
	self afficheur miseAJourAvec: self
]
