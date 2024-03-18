.DEFAULT_GOAL := help

.PHONY:  help clean unzip ensure-unzip
.SILENT: help clean unzip ensure-unzip

SHELL := /bin/bash

help: Makefile ## this help message
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean: ## cleans any zip files from the directory
	rm -f *.zip

unzip: ensure-unzip ## unzips an exported project ZIP file into the files directory
	MATCH="$$(find * -type f -mindepth 0 -maxdepth 0 -name '*.zip')" ;\
	COUNT="$$(find * -type f -mindepth 0 -maxdepth 0 -name '*.zip' | wc -l | xargs)" ;\
	if [ "$$MATCH" = "" ]; then \
	    echo The $$'\e[33m'unzip$$'\e[0m' rule expects a .zip file in the current directory\\n ;\
	    false ;\
	elif [ "$$COUNT" != "1" ]; then \
	    echo The $$'\e[33m'unzip$$'\e[0m' rule expects only one .zip to exist in the current directory\\n ;\
	    false ;\
	else \
	    echo "* Backing up files" ;\
	    mv -f files files.old &> /dev/null ;\
	    echo '*' Extracting $$'\e[33m'$$MATCH$$'\e[0m' archive;\
	    unzip -nq "$$MATCH" -d files.tmp ;\
	    if [ "$$?" = "0" ]; then \
	        echo "* Cleaning up" ;\
	        mv -f files.tmp files ;\
	        rm -rf files.old ;\
	        echo "* Done" ;\
	    else \
	        echo "* Restoring files after failure" ;\
	        rm -rf files.tmp ;\
	        mv -f files.old files &> /dev/null ;\
	        false ;\
	    fi \
	fi

ensure-unzip:
	if ! command -v unzip &> /dev/null; then \
	    echo The $$'\e[33m'unzip$$'\e[0m' command is not installed\\n ;\
	    false ;\
	fi
