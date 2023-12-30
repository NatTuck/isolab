
BASE := isolabd_0.1-1

all: $(BASE).deb

$(BASE).deb: release isolabd.service control postinst prerm
	mkdir -p $(BASE)
	mkdir -p $(BASE)/usr/lib/systemd/system
	cp isolabd.service $(BASE)/usr/lib/systemd/system
	mkdir -p $(BASE)/usr/share
	cp -r isolabd/_build/prod/rel/isolabd $(BASE)/usr/share
	mkdir -p $(BASE)/DEBIAN
	cp control postinst prerm $(BASE)/DEBIAN
	chmod 0755 $(BASE)/DEBIAN/postinst $(BASE)/DEBIAN/prerm
	dpkg-deb --build $(BASE)

release:
	(cd isolabd && MIX_ENV=prod mix release --overwrite)

clean:
	(cd isolabd && mix clean)
	rm -rf $(BASE) $(BASE).deb

.PHONY: all clean release
