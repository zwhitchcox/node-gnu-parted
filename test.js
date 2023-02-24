const { parted } = require('.')
;(async () => {
  await parted("/dev/sda", 61505273856, "print")
})()
