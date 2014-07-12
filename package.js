Package.describe({
    summary: "csv-to-collection-2 - load csv and create meteor collection"
});

Npm.depends({csvtojson: '0.3.8'});

Package.on_use(function (api) {
    api.add_files(['CsvToCollection.js'], ['client', 'server']);
});
