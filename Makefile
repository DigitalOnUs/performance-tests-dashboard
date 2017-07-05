all: test

test:
	@for d in ./test/*; do \
	  cd $$d; \
	  $(MAKE); \
	done

.PHONY: all test