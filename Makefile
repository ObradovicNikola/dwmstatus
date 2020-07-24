.POSIX:

PREFIX = /usr/local

output: dwmstatus.o
	gcc dwmstatus.o -lX11 -o dwmstatus
dwmstatus.o: dwmstatus.c config.h
	gcc -c -lX11 dwmstatus.c
clean:
	rm -f *.o *.gch dwmstatus
install: output
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dwmstatus $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dwmstatus
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmstatus

.PHONY: clean install uninstall
