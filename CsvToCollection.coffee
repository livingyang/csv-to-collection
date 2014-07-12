Fibers = Npm.require 'fibers'
fs = Npm.require 'fs'
csvtojson = Npm.require 'csvtojson'

@ctc =
	_csvConverter: new csvtojson.core.Converter()
	
	CreateCollection: (publicFilePath, onComplete) ->
		collection = new Meteor.Collection publicFilePath.split("/").pop()
		if Meteor.isServer
			try
				collection.remove {}
				@AddCsvToCollection publicFilePath, collection, onComplete
			catch e
				console.log e
				console.log "ctc.CreateCollection failed path: #{publicFilePath}"
		collection

	AddCsvToCollection: (publicFilePath, collection, onComplete) ->
		if Meteor.isServer
			csvConverter = new csvtojson.core.Converter()
			csvConverter.on 'end_parsed', (jsonArray) ->
				Fibers ->
					collection.insert doc for doc in jsonArray
					onComplete? jsonArray
				.run()
			fs.createReadStream("../client/app/#{publicFilePath}").pipe(csvConverter)
