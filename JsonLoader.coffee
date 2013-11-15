
###
class JsonLoader
# options.path: json file path
# options.indexName: auto index to json array, default is 'id'
# options.onComplete(loader): trigger when load complete
###

class @JsonLoader
	constructor: (options) ->
		HTTP.get (Meteor.absoluteUrl options.path), (error, result) =>
			
			if error? or not result.data?
				console.log "JsonLoader fail load path: #{path}"
				return

			@_data = result.data
			@loadIndex @_data, options.indexName ? "id"

			options.onComplete this

	loadIndex: (array, indexName) ->
		@_indexes = {}
		for obj in array when obj[indexName]?
			@_indexes[obj[indexName]] = obj

	objectForIndex: (index) ->
		@_indexes[index]

	getArray: ->
		@_data

