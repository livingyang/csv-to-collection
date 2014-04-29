
@CreateCollectionFromCsv = (path, collectionName) ->
	collection = new Meteor.Collection collectionName ? path.split("/").pop()

	if Meteor.isServer
		collection.remove {}
		try
			collection.insert object for object in CSV.parse String(Npm.require('fs').readFileSync path)
		catch e
			console.log e
			console.log "CreateCollectionFromCsv failed path: #{path}"

	collection

@CreateCollectionFromPublicCsv = (publicPath, collectionName) ->
	@CreateCollectionFromCsv "../client/app/#{publicPath}", collectionName

@CsvToCollection = {}

if Meteor.isServer
	@CsvToCollection._csvtojson = Npm.require 'csvtojson'
