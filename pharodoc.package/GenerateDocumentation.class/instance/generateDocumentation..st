documentation
generateDocumentation: inputClass
	"Generates JavaDoc-like documentation for the given class"

	| doc |
	index := 0.

	doc := String new.
	doc := doc, 'Class: ', inputClass name, String cr.
	doc := doc, 'Description: ',(inputClass comment
							ifNil: ['"No documentation for the given class has been provided"' ]),
							String cr.

	doc := doc, String cr ,'Methods:', String cr.
	inputClass methodDictionary valuesDo: [:method |
		doc := doc, '- ', method selector, String cr.
		doc := doc, 'Description: ', (method comment
							ifNil: ['"No documentation for the given method has been provided"' ]),
							String cr	].
	^doc