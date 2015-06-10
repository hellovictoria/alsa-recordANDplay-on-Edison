CC=i586-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -mstackrealign -fno-omit-frame-pointer --sysroot=/opt/poky-edison/1.6.1/sysroots/core2-32-poky-linux
CFLAGS = -g -Wall -O0 -I/home/xiaoy/yocto_package/edison-src/build/tmp/work/core2-32-poky-linux/alsa-lib/1.0.27.2-r0/alsa-lib-1.0.27.2/include/
LIBS=-lasound


lplay:lplay.o sndwav_common.o wav_parser.o
	$(CC) $(CFLAGS) lplay.o sndwav_common.o wav_parser.o -o lplay $(LIBS)
lplay.o:lplay.c sndwav_common.h wav_parser.h
	$(CC) $(CFLAGS) -c lplay.c


lrecord:lrecord.o sndwav_common.o wav_parser.o
	$(CC) $(CFLAGS) lrecord.o sndwav_common.o wav_parser.o -o lrecord $(LIBS)
lrecord.o: lrecord.c sndwav_common.h  wav_parser.h
	$(CC) $(CFLAGS) -c lrecord.c 


sndwav_common.o: sndwav_common.c sndwav_common.h
	$(CC) $(CFLAGS) -c sndwav_common.c 


wav_parser.o: wav_parser.c wav_parser.h
	$(CC) $(CFLAGS) -c wav_parser.c


clean:
	rm lrecord *.o
