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

	# Now meteor server will create a Collection named "myData.csv"
	# and will publish to client
	TestCollection = CreateCollectionFromPublicCsv "myData.csv"

	Meteor.startup ->
		console.log TestCollection

Note: coffeescript is not necessary, only CsvToCollection.js package to your project.
