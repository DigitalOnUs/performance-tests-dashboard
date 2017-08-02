all: test 

test:
	@for d in ./test/*; do \
	  echo TEST $$d; \
	  $(MAKE) -C $$d; \
	done

clean:
	@for d in ./test/*; do \
	  echo CLEAN $$d; \
	  $(MAKE) -C $$d clean; \
	done	

.PHONY: all test