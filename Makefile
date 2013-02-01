VERSION = 1.1
CSS = css/app-${VERSION}.css

build:
	@cd less; recess --compile chadb.less | java -jar ../yuicompressor-2.4.7.jar --type css > ../site/${CSS}
	@echo Compiled and compressed LESS files.
	@cd site; jekyll --no-server --no-auto

assets:
	@cd less; recess --compile chadb.less > ../site/${CSS}
	@echo Compiled LESS files.

jekyll:
	@cd site; jekyll

watch:
	@echo Watching LESS files for changes.
	@watchr -e "watch('less/.*\.less') { system 'echo `date`; make assets; echo' }"

.PHONY: build assets jekyll watch