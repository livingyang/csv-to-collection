Package.describe({
	summary: "csv-to-collection - load csv and create meteor collection"
});

Package.on_use(function (api) {
	api.add_files(['CsvToCollection.js'], ['client', 'server']);
});
