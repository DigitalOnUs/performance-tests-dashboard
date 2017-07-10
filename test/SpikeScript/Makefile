SHELL=/bin/bash

all:
	@ec=0; \
	for f in $$(ls *.sh); do \
	  echo -n "$${f%.sh} ... "; \
	  if ./$$f &>/dev/null; then \
	    echo PASS; \
	  else \
	    ec=$$?; \
	    echo FAIL; \
	  fi; \
	done; \
	exit $$ec

.PHONY: all