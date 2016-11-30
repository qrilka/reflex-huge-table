LOCAL_ROOT=$(shell stack path --local-install-root)

build:
	stack build

open: build
	xdg-open $(LOCAL_ROOT)/bin/reflex-huge-table.jsexe/index.html
