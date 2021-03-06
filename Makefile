VERSION = 1.4
CSS = css/app-${VERSION}.css

build:
	@cd lib/less; recess --compile chadb.less | java -jar ../yuicompressor-2.4.7.jar --type css > ../../${CSS}
	@echo Compiled and compressed LESS files.
	jekyll build

assets:
	@cd lib/less; recess --compile chadb.less > ../../${CSS}
	@echo Compiled LESS files.

watch:
	@echo Watching LESS files for changes.
	@watchr -e "watch('lib/less/.*\.less') { system 'echo `date`; make assets; echo' }"

.PHONY: build assets watch