all: doc adr

doc:
	$(MAKE) -C doc

adr:
	$(MAKE) -C adr

.PHONY: doc adr