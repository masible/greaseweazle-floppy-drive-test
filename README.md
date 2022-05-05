# Greaseweazle Floppy Drive Test

I use this to test PC floppy drives in read and write operations in
an automated way.

1. Make sure that a writable floppy is in the drive and the `gw` command is accessible
2. Run `./test.sh`

## Disk images

We currently only test reading and writing 1.44MB IBM formatted floppies, using
one image that's full of zeroes save for the filesystem data, and one with a single
file full of random data filling the whole disk.

File an issue if you can provide similar images for non-IBM formats, even for 5.25"
floppy formats.

## License

[GPL v3 or later](https://spdx.org/licenses/GPL-3.0-or-later.html).
