csv-to-collection
===========

csv to collection for meteor

## usage

in Meteor directory:

public/myData.csv:

	"id", "data"
	1, "str1"
	2, "str2"

lib/MyData.coffee:

	TestCollection = CreateCollectionFromPublicCsv "myData.csv"

	Meteor.startup ->
		console.log TestCollection