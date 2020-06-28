Class {
	#name : #Guirlande,
	#superclass : #Object,
	#instVars : [
		'lampes'
	],
	#category : #Chenillard
}

{ #category : #affichage }
Guirlande >> afficheurs [
	|colAfficheurs|
	colAfficheurs := OrderedCollection new.
	1 to: 10 do: [ :i | colAfficheurs add: (lampes at: i) afficheur ].
	^ colAfficheurs 
]

{ #category : #affichage }
Guirlande >> allumerSeulementLampesNumeros: desIndices [
	|aEteindre| 
	desIndices do: [ :index | (self lampes at: index) allumer ].
	aEteindre := #(1 2 3 4 5 6 7 8 9 10) reject: [:i | desIndices  anySatisfy: [:j | i = j ]].
	aEteindre do: [ :index | (self lampes at: index) eteindre ]
]

{ #category : #affichage }
Guirlande >> arreterAffichage [
	self lampes do: [ :lampe | lampe arreterAffichage ]
]

{ #category : #affichage }
Guirlande >> demarrerAffichage [
	self afficheurs do: [ :afficheur | afficheur demarrerAffichage ]
]

{ #category : #affichage }
Guirlande >> eteindreToutesLesLampes [
	self arreterAffichage
]

{ #category : #animation }
Guirlande >> executer: unBlock repetition: nombreDefois [
	| dureeAttenteAvantAllumageLampeSuivante |
	dureeAttenteAvantAllumageLampeSuivante := Delay forMilliseconds: 100.
	[ 
	nombreDefois
		timesRepeat: [ 
			dureeAttenteAvantAllumageLampeSuivante wait.
			unBlock value ] 
	] forkAt: Processor userBackgroundPriority	
	"forkAt:  permet d'exécuter le bloc dans un processus dédié.
	L'argument correspond à la priorité du nouveau processus."
]

{ #category : #initialization }
Guirlande >> initialize [
	|position|
	position := 80.
	super initialize.
	lampes :=  OrderedCollection new: 10.
	1 to: 10 do: [ :i | lampes add: Lampe new ].
	1 to: 10 do: [ :i | (lampes at: i) afficheur: AfficheurGraphiqueDeLampe new].
	1 to: 10 do: [ :i | (lampes at: i) afficheur position: (80 + position)@100. position := position + 80].
	self demarrerAffichage
]

{ #category : #accessing }
Guirlande >> lampes [
	^ lampes
]

{ #category : #accessing }
Guirlande >> lampes: anObject [
	lampes := anObject
]

{ #category : #affichage }
Guirlande >> unPasChenillardVersGauche [
	|etatLampe1|
	etatLampe1 := (self lampes at: 1) estAllumee. 
	1 to: (self lampes size) - 1 do: [ :i | (self lampes at: i) estAllumee: (self lampes at: i + 1) estAllumee ].
	(self lampes at: self lampes size) estAllumee: etatLampe1
]
