default: uuid parted front-end

.PHONY: uuid
uuid:
	cd src/e2fsprogs && ./configure --enable-libuuid
	$(MAKE) -C src/e2fsprogs
	cd src/e2fsprogs/lib/uuid && emmake make

.PHONY: parted
parted:
	cd src/parted && \
		./bootstrap --skip-po && \
	emconfigure ./configure \
		--disable-device-mapper \
		--without-readline \
		--host=x86_64-gnu-linux \
		--without-pthread \
		CFLAGS="-sNODERAWFS=1 -Ie2fsprogs/lib -Wno-int-conversion" && \
		emmake make

front-end:
	tsc
	cp ./src/parted/parted/.libs/* build

.PHONY: clean
clean:
	$(MAKE) -C ./src/e2fsprogs clean
	$(MAKE) -C ./src/parted clean

