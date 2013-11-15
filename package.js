Package.describe({
	summary: "json-loader - load json for meteor client and server"
});

Package.on_use(function (api) {
	api.use('http', ['client', 'server']);
	api.add_files(['JsonLoader.js'], ['client', 'server']
	);
}
