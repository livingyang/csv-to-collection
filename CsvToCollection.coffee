Fibers = Npm.require 'fibers'
fs = Npm.require 'fs'
csvtojson = Npm.require 'csvtojson'

@ctc =
    CreateCollection: (filePath, onComplete, serverAssets=undefined) ->
        collection = new Meteor.Collection filePath.split("/").pop()
        if Meteor.isServer
            try
                collection.remove {}
                @AddCsvToCollection filePath, collection, onComplete, serverAssets
            catch e
                console.log e
                console.log "ctc.CreateCollection failed path: #{filePath}"
        collection

    AddCsvToCollection: (filePath, collection, onComplete, serverAssets=undefined) ->
        if Meteor.isServer
            csvConverter = new csvtojson.core.Converter()
            csvConverter.on 'end_parsed', (jsonArray) ->
                Fibers ->
                    collection.insert doc for doc in jsonArray
                    onComplete? jsonArray
                .run()
            if serverAssets?
                data = serverAssets.getText filePath
                csvConverter.fromString data, (e, jsonArray) ->
                    console.log e  if e
                    #console.log jsonArray
                    return
                return csvConverter
            fs.createReadStream("../client/app/#{filePath}").pipe(csvConverter)
