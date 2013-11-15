json-loader
===========

json loader for meteor

## usage

in Meteor directory:

public/myData.json:

	[
		{"id":1, "data":"str1"},
		{"id":2, "data":"str2"},
	]

lib/MyData.coffee:

	@MyData = new JsonLoader
		path: "myData.json"
		indexName: "id"
		onComplete: (loader) ->
			# at here, loader is same as @MyData
			
			console.log JSON.stringify loader.getArray() # output myData.json
			console.log loader.objectForIndex "1" # output {"id":1, "data":"str1"}
