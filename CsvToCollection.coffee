Fibers = Npm.require 'fibers'
fs = Npm.require 'fs'
csvtojson = Npm.require 'csvtojson'

@ctc =
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

# @CreateCollectionFromCsv = (path, collectionName) ->
# 	collection = new Meteor.Collection collectionName ? path.split("/").pop()

# 	if Meteor.isServer
# 		collection.remove {}
# 		try
# 			collection.insert object for object in CSV.parse String(Npm.require('fs').readFileSync path)
# 		catch e
# 			console.log e
# 			console.log "CreateCollectionFromCsv failed path: #{path}"

# 	collection

# @CreateCollectionFromPublicCsv = (publicPath, collectionName) ->
# 	@CreateCollectionFromCsv "../client/app/#{publicPath}", collectionName

# @CsvToCollection = {}

# if Meteor.isServer
# 	@CsvToCollection._csvtojson = Npm.require 'csvtojson'
