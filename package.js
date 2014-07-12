Package.describe({
	summary: "csv-to-collection - load csv and create meteor collection"
});

Package.on_use(function (api) {
	Npm.depends({csvtojson: '0.3.11'});
	api.add_files(['CsvToCollection.js'], ['client', 'server']);
});
