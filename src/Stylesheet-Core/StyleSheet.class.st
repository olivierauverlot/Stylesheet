"
A PDFStyleSheet define style for PDFElements to separate presentation from contents. A styleSheet can have substyles to define properties specifics to a context.

The default substyle of a stylesheet is itself. This way we can also refers to the parent.

Instance Variables
	attributes:		<Object>
	document:		<Object>
	substyles:		<Object>

"
Class {
	#name : #StyleSheet,
	#superclass : #Object,
	#instVars : [
		'attributes',
		'substyles',
		'dynamicCustomization'
	],
	#category : #'Stylesheet-Core'
}

{ #category : #action }
StyleSheet >> + aStyleSheet [

	| newStyleSheet |
	newStyleSheet := self copy.
	aStyleSheet attributes keysAndValuesDo: [:aKey :aValue | newStyleSheet attributes at: aKey put: aValue ].
	aStyleSheet substyles keysAndValuesDo: [:aKey :aSubStyleSheet | newStyleSheet substyles at: aKey put: aSubStyleSheet copy ].
	newStyleSheet substyles at: #default put: newStyleSheet.
	^ newStyleSheet
]

{ #category : #'private-accessors' }
StyleSheet >> > aSymbol [
	"Access a substyles named aSymbol, creates it if not defined."
	
	^ self substyles at: aSymbol ifAbsentPut: [ self class new ]
]

{ #category : #'public access' }
StyleSheet >> at: anAttributeSymbol [
	"Return the value of an attribute given its key anAttributeSymbol"
	
	^ attributes at: anAttributeSymbol
]

{ #category : #'public access' }
StyleSheet >> at: anAttribute put: aValue [
	attributes at: anAttribute put: aValue 
]

{ #category : #'private-accessors' }
StyleSheet >> attributes [
	^ attributes
]

{ #category : #copying }
StyleSheet >> copyWithout: aCollectionOfProperties [
	^ self copy removeAll: aCollectionOfProperties; yourself
]

{ #category : #customize }
StyleSheet >> customizeWith: aStyledElement [ 
	self dynamicCustomization ifNotNil: [ self dynamicCustomization cull: self cull: aStyledElement ]
]

{ #category : #'private-accessors' }
StyleSheet >> dynamicCustomization [
	^ dynamicCustomization
]

{ #category : #'private-accessors' }
StyleSheet >> dynamicCustomization: anObject [
	dynamicCustomization := anObject
]

{ #category : #'public access' }
StyleSheet >> get: anAttribute [
	self deprecated: 'Use at: instead!' transformWith: '`@receiver get: `@statements1' 
						-> '`@receiver at: `@statements1'.
	^ attributes at: anAttribute
]

{ #category : #testing }
StyleSheet >> includesAnySubstyles: aCollectionOfSubstyles [
	^ self substyles keys includesAny: aCollectionOfSubstyles 
]

{ #category : #initialization }
StyleSheet >> initialize [
	super initialize.
	attributes := Dictionary new.
	self initializeSubstyles.
]

{ #category : #initialization }
StyleSheet >> initializeSubstyles [
	substyles := Dictionary new.
	substyles at: #default put: self
]

{ #category : #copying }
StyleSheet >> postCopy [
	super postCopy.
	attributes := attributes copy.
	substyles := substyles copy.
	substyles at: #default put: self.
]

{ #category : #removing }
StyleSheet >> remove: anAttributeSymbol [
	attributes removeKey: anAttributeSymbol
]

{ #category : #removing }
StyleSheet >> removeAll: aCollectionOfAttributes [
	aCollectionOfAttributes do: [:anAttribute | self remove: anAttribute]
]

{ #category : #'private-accessors' }
StyleSheet >> substyles [
	^ substyles
]

{ #category : #'private-accessors' }
StyleSheet >> substyles: aStylesheet [
	substyles := aStylesheet
]

{ #category : #copying }
StyleSheet >> withoutSubstyles [
	^ self copy initializeSubstyles
]
