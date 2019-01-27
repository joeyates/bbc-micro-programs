# BBC Micro Files

This repo contains copies of files from my BBC Micro B floppy disks.

The files are from the period 1983-1993.

# Copyright

Files on some disks are commercial programs, I am not aware if
they are still under copyright.

The remainder are my own programs.

See the "Created by" column in files.csv

# Transferring files from the BBC Micro

I copied the files via a serial cable constructed as indicated
[here](http://danceswithferrets.org/geekblog/?p=469).

The files were copied to a Linux machine, without the use of
specific transfer programs. I kept the baud rate relatively low
(4800 baud) to avoid transfer errors.

Note that this method requires cleanup afterwards, as the
instructions typed on the BBC Micro before and after transfer
are transmitted.

## Preparation

First, switch on the BBC Micro and connect the serial cable
at both ends.

Set up the Linux terminal:

```sh
$ stty -F /dev/ttyUSB0 igncr # ignore extra carriage returns
$ stty -F /dev/ttyUSB0 4800
```

Set up the BBC Micro to transmit at 4800 baud:

```
*FX 8, 6
```

# Transfer a Single File

Prepare to receive on Linux:

```sh
$ cat -v < /dev/ttyUSB0 > my_transferred_file
```

Output to serial (and default channels) on BBC:

```
*FX 3, 1
```

The actual transfer instruction depends on the file type.

Text files:

```
*TYPE {{file}}
```

BBC Basic Files:

```
*LOAD {{file}}
LIST
```

Binary files:

```
*DUMP {{file}}
```

Note that I transferred binary files as hex dumps to avoid problems
with control characters. After transfer, I extracted the original binary
with `bin/dump-to-bin`.

After transfer, close output:

```
*FX 3, 0
```

The interrupt `cat` with Ctrl+C
