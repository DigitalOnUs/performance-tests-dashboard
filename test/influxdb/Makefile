SHELL=/bin/bash

all:
	@for f in $$(ls *.sh); do \
	  echo -n "$${f%.sh} ... "; \
	  if ./$$f &>/dev/null; then \
	    echo PASS; \
	  else \
	    echo FAIL; \
	  fi; \
	done

.PHONY: all