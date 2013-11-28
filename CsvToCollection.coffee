
@CreateCollectionFromCsv = (path, completeFunc) ->
	collection = new Meteor.Collection null

	HTTP.get (Meteor.absoluteUrl path), (error, result) ->
		try
			collection.insert object for object in CSV.parse result.content
			completeFunc? true, collection
		catch e
			console.log "CreateCollectionFromCsv failed path: #{path}"
			completeFunc? false, collection
		
	collection
