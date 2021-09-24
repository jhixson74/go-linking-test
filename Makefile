SUBDIRS := installer terraform
BIN := wrapper

all: $(SUBDIRS) main test
$(SUBDIRS):
	cd $@ && go build -buildmode c-shared -o lib$@.o

main:
	mkdir -p bin
	cc -o bin/$(BIN) main.c installer/libinstaller.o terraform/libterraform.o -lpthread
	ln -f bin/$(BIN) bin/openshift-install
	ln -f bin/$(BIN) bin/terraform

test:
	@echo "+---------------------------+"
	@echo "| testing openshift-install |"
	@echo "+---------------------------+"
	./bin/openshift-install
	@echo "+---------------------------+"
	@echo "|     testing terraform     |"
	@echo "+---------------------------+"
	./bin/terraform
	@echo "+---------------------------+"
	@echo "|      testing wrapper      |"
	@echo "+---------------------------+"
	./bin/wrapper

clean:
	rm -f bin/* installer/libinstaller.[oh] terraform/libterraform.[oh]

.PHONY: all $(SUBDIRS)

