csv-to-collection
===========

csv to collection for meteor

## usage

in Meteor directory:

public/myData.csv:

	"_id","data"
	1,"str1"
	2,"str2"

lib/MyData.coffee:

	publicCsvPath = "csv/myData.csv"
	# create a collection with name "myData.csv"
	myDataCollection = c2c.createCollection publicCsvPath

server/main.coffee
	# public csv to collection
	myDataCollection.remove {}
	c2c.addPublicCsvToCollection myDataCollection, publicCsvPath
	console.log myDataCollection.find().fetch();


Note: coffeescript is not necessary, only CsvToCollection.js package to your project.

Demo: <https://github.com/livingyang/csv-to-collection-demo>
