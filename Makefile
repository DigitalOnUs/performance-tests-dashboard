all: test

test:
	@for d in ./test/*; do \
	  echo TEST $$d; \
	  cd $$d; \
	  $(MAKE); \
	  cd -; \
	done

.PHONY: all test