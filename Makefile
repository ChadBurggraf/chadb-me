VERSION = 1.2
CSS = css/app-${VERSION}.css

build:
	@cd lib/less; recess --compile chadb.less | java -jar ../yuicompressor-2.4.7.jar --type css > ../site/${CSS}
	@echo Compiled and compressed LESS files.
	jekyll --no-server --no-auto

assets:
	@cd lib/less; recess --compile chadb.less > ../site/${CSS}
	@echo Compiled LESS files.

jekyll:
	@cd site; jekyll

watch:
	@echo Watching LESS files for changes.
	@watchr -e "watch('lib/less/.*\.less') { system 'echo `date`; make assets; echo' }"

.PHONY: build assets jekyll watch