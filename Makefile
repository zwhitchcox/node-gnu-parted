default: uuid parted

.PHONY: uuid
uuid:
	cd lib/e2fsprogs && ./configure --enable-libuuid
	$(MAKE) -C lib/e2fsprogs
	cd lib/e2fsprogs/lib/uuid && emmake make

.PHONY: parted
parted:
	cd lib/parted && \
		./bootstrap --skip-po && \
	emconfigure ./configure \
		--disable-device-mapper \
		--without-readline \
		--host=x86_64-gnu-linux \
		--without-pthread \
		CFLAGS="-sNODERAWFS=1 -Ie2fsprogs/lib -Wno-int-conversion" && \
		emmake make

.PHONY: clean
clean:
	$(MAKE) -C ./lib/e2fsprogs clean
	$(MAKE) -C ./lib/parted clean

