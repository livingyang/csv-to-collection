Package.describe({
	summary: "csv-to-collection - load csv and create meteor collection"
});

Package.on_use(function (api) {
	Npm.depends({"comma-separated-values": '3.2.1'});
	api.add_files(['CsvToCollection.js'], ['client', 'server']);
});
