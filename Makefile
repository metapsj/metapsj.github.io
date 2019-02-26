.PHONY: dev build assets clean serve

dev: clean assets build serve

build:
	parcel build assets/sass/app.scss --out-dir public/ --no-minify
	parcel build assets/js/app.js --out-dir public/ --no-minify

assets:
	cp -r assets/img public/

serve:
	rackup

clean:
	rm -rf public/*

deprecate:
	find ./public -maxdepth 1 -type f -not -name '*.keep' -delete

