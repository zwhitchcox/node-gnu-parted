# All warnings have been removed. This is an experimental project. Please do not use on a disk containing important data unless you know what you're doing

## node-gnu-parted

This is a port of the [gnu parted](https://www.gnu.org/software/parted/manual/parted.html) compiled to WebAssembly, allowing you to edit the partition tables of block devices or disk image files. It knows nothing about the file systems on those files except to set the type of file system in the partition table metadata.

### Installation

```
npm i gnu-parted
```

### Usage

Pass the disk path, size of disk and [command](https://www.man7.org/linux/man-pages/man8/parted.8.html) you want to run to `parted`.

See for how to get disk size and paths [`drivelist`](https://github.com/balena-io-modules/drivelist)
```ts
import { parted } from 'gnu-parted'

(async () => {
  const diskPath = "DISK_PATH" // e.g. /dev/sda or /dev/disks/disk1
  const diskSize = 100000 // size in bytes of disk

  // print partition table
  await parted(diskPath, diskSize, 'print')
  
  // create gpt partition table:
  await parted(diskPath, diskSize, "mklabel gpt")

  // create new primary fat32 partition, 512MiB:
  await parted(diskPath, diskSize, "mkpart fat32 1MiB 512MiB")
})();
```

*Note this does not create the actual file system. It just edits the partition table. You can create a file system with mkfs.*
