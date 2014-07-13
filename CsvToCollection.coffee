@c2c =
	createCollection: (publicCsvPath) ->
		new Meteor.Collection @getFilename publicCsvPath

	getFilename: (path) ->
		(path.split "/").pop()

if Meteor.isServer
	CSV = Npm.require "comma-separated-values"

	@c2c.addCsvStringToCollection = (collection, csvString) ->
		collection.insert doc for doc in (new CSV csvString, header: true, cast: false, line: "\n").parse()

	@c2c.addPublicCsvToCollection = (collection, path) ->
		@addCsvStringToCollection collection, String((Npm.require "fs").readFileSync "../client/app/#{path}")
