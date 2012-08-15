VERSION = 1.0
CSS = css/app-${VERSION}.css
JS = js/app-${VERSION}.js

build: bootstrap
	cat static/css/bootstrap.css static/css/bootstrap-responsive.css static/css/chadb.css | java -jar yuicompressor-2.4.7.jar --type css > ${CSS}
	cat static/js/jquery.js static/js/bootstrap.js | python compile-js.py > ${JS}
	jekyll --no-server --no-auto

assets:
	cat static/css/bootstrap.css static/css/bootstrap-responsive.css static/css/chadb.css > ${CSS}
	cat static/js/jquery.js static/js/bootstrap.js > ${JS}

bootstrap:
	rm -rf bootstrap/bootstrap
	cd bootstrap; make bootstrap
	cp bootstrap/bootstrap/css/bootstrap.min.css static/css/bootstrap.css
	cp bootstrap/bootstrap/css/bootstrap-responsive.min.css static/css/bootstrap-responsive.css
	cp bootstrap/bootstrap/img/*.png img
	cp bootstrap/bootstrap/js/bootstrap.min.js static/js/bootstrap.js
	rm -rf bootstrap/bootstrap

watch:
	watchr -e "watch('static/css/.*\.css') { system 'make assets; echo' }"

.PHONY: build assets bootstrap watch