csv-to-collection
===========

csv to collection for meteor

## api

1. ###c2c.createCollection(publicCsvPath)###

	**Anywhere**

	return an instance of Meteor.Collection named csv file name

	*arguments*
	* publicCsvPath : csv file path at your public directory

2. ###c2c.getFilename(path)###

	**Anywhere**

	return file name of path

	*arguments*
	* path : csv file path at public directory

3. ###c2c.addCsvStringToCollection(collection, csvString)###

	**Server**

	convert csv string to json objects and insert to collection

	*arguments*
	* collection : an instance of Meteor.Collection
	* csvString : csv format string

4. ###c2c.addPublicCsvToCollection(collection, path)###

	**Server**

	convert csv file to json objects and insert to collection

	*arguments*
	* collection : an instance of Meteor.Collection
	* path : csv file path at public directory

## usage

in Meteor directory:

public/myData.csv:

	"_id","data"
	1,"str1"
	2,"str2"

lib/MyData.coffee:

	publicCsvPath = "csv/myData.csv"
	# create a collection with name "myData.csv"
	publicCsvCollection = c2c.createCollection publicCsvPath

	csvString = "_id,a,b\n1,2,3\n3,4,5"
	csvStringCollection = new Meteor.Collection "custom"

server/main.coffee

	# public csv file to collection
	publicCsvCollection.remove {}
	c2c.addPublicCsvToCollection publicCsvCollection, publicCsvPath
	console.log "publicCsvCollection:"
	console.log publicCsvCollection.find().fetch()

	# csv string to collection
	csvStringCollection.remove {}
	c2c.addCsvStringToCollection csvStringCollection, csvString
	console.log "csvStringCollection:"
	console.log csvStringCollection.find().fetch()


Note: coffeescript is not necessary, only CsvToCollection.js package to your project.

## Demo
<https://github.com/livingyang/csv-to-collection-demo>
