
BASE := isolabd_0.1-1

all: $(BASE).deb

$(BASE).deb: isolabd isolabd.service control
	mkdir -p $(BASE)
	mkdir -p $(BASE)/usr/bin
	cp isolabd $(BASE)/usr/bin
	mkdir -p $(BASE)/usr/lib/systemd/system
	cp isolabd.service $(BASE)/usr/lib/systemd/system
	mkdir -p $(BASE)/DEBIAN
	cp control $(BASE)/DEBIAN
	dpkg-deb --build $(BASE)

clean:
	rm -rf $(BASE) $(BASE).deb

.PHONY: all clean
