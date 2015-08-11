
VERSION=110.78
DESTDIR=
BIN=$(PWD)/bin

bin/.heap/sml.x86-linux:
	curl http://smlnj.cs.uchicago.edu/dist/working/$(VERSION)/config.tgz > config.tgz
	tar zxf config.tgz
	config/install.sh
	rm -f *.tgz

install: bin/.heap/sml.x86-linux
	cd bin/
	for I in $(BIN)/*; do \
	    echo creating symlink to $$I ; \
	    ln -sf $$I ; \
	done

clean:
	rm -rf base cml config lib \
		ml-lex ml-lpt MLRISC ml-yacc \
		smlnj-lib trace-debug-profile \
		ml-burg doc ckit nlffi

reallyclean: clean
	rm -rf bin *.tgz

.PHONY: clean install all
