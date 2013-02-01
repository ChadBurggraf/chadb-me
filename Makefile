VERSION = 1.1
CSS = css/app-${VERSION}.css

build:
	cd less; recess --compile chadb.less | java -jar ../yuicompressor-2.4.7.jar --type css > ../site/${CSS}
	cd site; jekyll --no-server --no-auto

assets:
	cd less; recess --compile chadb.less > ../site/${CSS}

watch:
	watchr -e "watch('less/.*\.less') { system 'make assets; echo' }"

.PHONY: build assets bootstrap watch