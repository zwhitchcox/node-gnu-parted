This is mostly from memory, and I haven't actualy tested any of this since I originally built it. Including the wasm files, so you shouldn't have to build it anyway unless you want to change something.


Clone recursively
```
git clone --recurse-submodules https://github.com/zwhitchcox/balena-parted
```

compile e2fsprogs just for uuid
```
# build e2fsprogs normally so we can get its native dependencies
cd e2fsprogs
./configure
make
cd lib/uuid
emconfigure ./configure
emmake make
cd ../../..
```

Run boot strap normally
```
./bootstrap --skip-po
```

Configure and make
```
emconfigure ./configure --prefix=$(readlink -f prefix) --disable-device-mapper --without-readline --host=x86_64-gnu-linux --without-pthread CFLAGS="-sNODERAWFS=1 -Ie2fsprogs/lib"
emmake make
```

Run wasm version

```
node ./parted/.libs/parted
```

Important wasm files:

```
./parted/.libs/parted{.wasm}
```