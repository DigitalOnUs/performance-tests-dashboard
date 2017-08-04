all: test 

test:
	@for d in ./test/*; do \
	  echo TEST $$d; \
	  cd $$d; \
	  $(MAKE); \
	  cd -; \
	done

clean:
	@for d in ./test/*; do \
	  echo CLEAN $$d;\
	  cd $$d; \
      $(MAKE clean); \
	  cd -; \
	done	

.PHONY: all test