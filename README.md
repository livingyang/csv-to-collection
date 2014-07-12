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

	collection = ctc.CreateCollection 'csv/myData.csv', (jsonArray) ->
		console.log "fetch : collection"
		console.log collection.find().fetch()


## server-side usage

Repeat the above steps but put the assets in private/myData.csv
then call the method with a reference to Meteor's Assets

    # Reference to Assets
    ServerAssets = Assets
    
    # Attach reference
    collection = ctc.CreateCollection 'csv/myData.csv', (jsonArray) ->
    		console.log "fetch : collection"
    		console.log collection.find().fetch()
    		return
    , ServerAssets

Note: coffeescript is not necessary, only CsvToCollection.js package to your project.

Demo: <https://github.com/livingyang/csv-to-collection-demo>

