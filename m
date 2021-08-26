Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D683F8E25
	for <lists+nbd@lfdr.de>; Thu, 26 Aug 2021 20:49:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 24BDB20AB6; Thu, 26 Aug 2021 18:49:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 26 18:49:58 2021
Old-Return-Path: <fernandez.simon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	HTML_MESSAGE,HTML_NBSP,LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3922020A90
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Aug 2021 18:49:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.599 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_INVALID=0.1,
	DKIM_SIGNED=0.1, FOURLA=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	HTML_TAG_BALANCE_BODY=0.1, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GFpQU_c2No9p for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Aug 2021 18:49:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 99C1020A7D
	for <nbd@other.debian.org>; Thu, 26 Aug 2021 18:49:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso7557720wmb.2
        for <nbd@other.debian.org>; Thu, 26 Aug 2021 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=f/jJtZSDXGopPLd18PdgRvoNzsmPOlF//tUlFLxk3uA=;
        b=AG37W7w5zg5Q7aTZrgf0s3rt3A0MjD0fLwKjhtAmGxQeor7A7owLXKYhlEXrvG9rOI
         +OuD7uVRio9na9N0WexmK+uQEnjFPRPPTZxiXuJBmydEPk7c9qVUT6pdULOXwz6UDqsa
         ccePyKySwJB5NSt6XnE+WzJshJ2s7MzARHKhdfiaJrYrEgMP40a29gSY+j/FNv7aSl24
         I197ifgjsUS5x6UkLr4eYjlN5n2Op1k7+1N1JWtglkMPI25yh4USYwebjXWaOkWWcQB7
         lOWvN18EPsWMv7jt5JvcHGW1h76wz5FWb/jHIwHofBZLmd+0jbHNLFUsByvveIoEBCLj
         PQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=f/jJtZSDXGopPLd18PdgRvoNzsmPOlF//tUlFLxk3uA=;
        b=jBsdMy77+c22VLdmg/sQlXsGg9aYdsCx8AYj259Y+sgaFqqffv1T+mW7Yq6EkFpgUa
         wD6FdeWSE/FR4rj/8DaObXfEeEzu/QtvqmuhVfLgZgGyBc+ktFsF9SvJ8zuOamRAYgWW
         Xo6LhjlqQMU/4DQ2UsKIX0k+Yn4mUAgLyHTiJf1Sv5TOABmU4nNMeK4835DqIOehdSMF
         1rLi5ynuIMcwrCe/TV1j+93sYylL5mGQFBB4wiydOp/420dR61To9iNFpBEFVAWhf4Lp
         oQ8CQkNYg0MFbVDt7T2byIq5cOJ/HFa+i+JD/JIOJHHnoZlV+bQLYMUbfTOPIV3iaMJX
         RSuQ==
X-Gm-Message-State: AOAM533X1J/HCjG3YN/3Zq2HEy5w35KUhEoXwi1cfpEG32g/sAChVg1p
	V/MjUZ7Nl8G3a+EJJy7a9GE=
X-Google-Smtp-Source: ABdhPJyUxf7x5b2iMRQ6sl3pF4ZeHHk00oaF4lOZzJIlgmcQVKbLoLAZA8PJKawNOGIwGAEWKoptQQ==
X-Received: by 2002:a1c:46:: with SMTP id 67mr5170506wma.29.1630003775594;
        Thu, 26 Aug 2021 11:49:35 -0700 (PDT)
Received: from simons-mbp.lan (247.181.199.146.dyn.plus.net. [146.199.181.247])
        by smtp.gmail.com with ESMTPSA id h6sm3489572wmq.5.2021.08.26.11.49.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Aug 2021 11:49:34 -0700 (PDT)
From: Simon Fernandez <fernandez.simon@gmail.com>
Message-Id: <86D4E7FA-2E44-466E-BD31-8C9DF81DAD3E@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_83B2082E-E07B-40E9-BFD0-5A74F6F4E866"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: Setting up NBD server / client - block nbd4: Other side returned
 error (22) issue
Date: Thu, 26 Aug 2021 19:49:33 +0100
In-Reply-To: <20210812213241.GA4067@redhat.com>
Cc: nbd@other.debian.org
To: Wouter Verhelst <w@uter.be>,
 "Richard W.M. Jones" <rjones@redhat.com>
References: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
 <20210812213241.GA4067@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8uGVysYRhTD.A.A6C.WJ-JhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1339
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/86D4E7FA-2E44-466E-BD31-8C9DF81DAD3E@gmail.com
Resent-Date: Thu, 26 Aug 2021 18:49:58 +0000 (UTC)


--Apple-Mail=_83B2082E-E07B-40E9-BFD0-5A74F6F4E866
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi folks,=20
thanks for the reply Wouter's reply was in junk only found it when I saw =
Richards reply and fished it out.

I'm still getting
$ sudo nbd-client 192.168.1.14 10809 -N recipes /dev/nbd0
Negotiation: ..size =3D 0MB
Connected /dev/nbd0

Here are the changes I've made - first I built nbdinfo - thanks for the =
tip Richard.

Build GnuTLS from
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz

Build libnbd from
https://download.libguestfs.org/libnbd/1.8-stable/libnbd-1.8.3.tar.gz

After installing quite a lot of libraries . . .=20
----------------------------------------------------------------------
Thank you for downloading libnbd 1.8.3

This is how we have configured the optional components for you today:

Optional library features:

    TLS support ............................ yes
    NBD URI support ........................ yes
    FUSE support ........................... yes
    Manual pages ........................... yes
    Bash tab completion .................... yes

Language bindings:

    Go ..................................... no
    OCaml .................................. no
    Python ................................. no

nbdkit version note - during ./configure
checking for nbdkit... nbdkit
checking for nbdkit >=3D 1.12... no (1.10)
configure: WARNING: nbdkit is too old, some tests will be disabled

The 'make check' skipped a lot of tests but there were no FAILS

$ nbdinfo --version
nbdinfo 1.8.3
libnbd 1.8.3


=3D=3D rpi-C3 (192.168.1.14) server side

Q: Wouter ( w@uter.be ) - Are they readable and writable by the "nbd" =
user?
R: I've changed the user & group to pi (the logged in user) so should be =
R/W

Note: Richard ( rjones@redhat.com ) - You don't need to serve each =
export on a separate port.  The NBD
protocol can serve multiple exports (disks) on the same port, with the
client requesting which one it wants.
R: Have remove the port addresses from config

pi@rpi-C3:~ $ cat /etc/nbd-server/config
[generic]
# If you want to run everything as root rather than the nbd user, you
# may either say "root" in the two following lines, or remove them
# altogether. Do not remove the [generic] section, however.
	user =3D pi
	group =3D pi
	includedir =3D /etc/nbd-server/conf.d
	allowlist =3D true

# What follows are export definitions. You may create as much of them as
# you want, but the section header has to be unique.
[images]
	exportname =3D /home/pi/media/500G_FAITH/images/
	transactionlog =3D /home/pi/media/500G_FAITH/logs/log_images
[recipes]
	exportname =3D /home/pi/media/500G_FAITH/recipes/
	transactionlog =3D /home/pi/media/500G_FAITH/logs/log_recipes
[movie]
	exportname =3D /home/pi/media/500G_FAITH/movies/
	transactionlog =3D /home/pi/media/500G_FAITH/logs/log_movie

Q: Wouter ( w@uter.be ) - Do the paths that you point to in the =
exportname parameters exist?
R: YES its a directory with a bunch of images in it. YES - Non zero =
size.

pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/recipes/
y000_Pork_Belly_Wontan____TOCOST.rtf              =
y011_Rack_And_Black.rtf
y002_Salmon_Parfait_Forest_Rosemary_Bread_LE.rtf  =
y021_StoneAge_Beef_Taragon_Sauce____TOCOST.rtf

pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/images
160g? of dough - 250C - 6m.jpg   20190228_163410_monkfish and red pepper =
skewers.jpg
20190629_202814_couscous w apricots.jpg              =
672_V_cheddar_gorgeous.jpg
20181022_134259.jpg              20200124_152329_aubergine & pesto =
stuffing.jpg
25_androll_into_pancakes.jpg	665 Celeriac & Cockscombe Mint Soup.jpg

pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/movies
NA #015 - Bread.mp4
NA #016 - Fisetin - Mayo Clinic Trials.mp4
NA #042 - Delta Variant COVID.mp4
NA #044 - Lex Fridman.mp4

pi@rpi-C3:~ $ ls -la /home/pi/media/500G_FAITH/logs
-rw------- 1 pi pi     56 Aug 26 17:00 log_images
-rw------- 1 pi pi     56 Aug 26 17:00 log_movie
-rw------- 1 pi pi    700 Aug 26 17:35 log_recipes

pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_images
%`?%`?

pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_movie
%`?%`?

pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_recipes
=
%`?`%`?a%`?b%`?c%`?d%`?e%`?f%`?g%`?h%`?i%`?j%`?k%`?l%`?%`?%`?%`?%`?%`?%`?%=
`?%`%`?	%`?

pi@rpi-C3:~ $ nbdkit --version
nbdkit 1.1.12


=3D=3D client side

Note: Richard ( rjones@redhat.com ) - Use the 'nbdinfo' tool to examine =
what is being served by an NBD
server.  It can query all sorts of information as described in the =
manual:
R: Built the tool. - here is what it says : /

pi@rpi-C1:~ $ nbdinfo nbd://192.168.1.14:10809/recipes
protocol: newstyle-fixed without TLS
export=3D"recipes":
	export-size: 4096
	uri: nbd://192.168.1.14:10809/recipes
	is_rotational: false
	is_read_only: true
	can_cache: false
	can_df: false
	can_fast_zero: false
	can_flush: false
	can_fua: false
	can_multi_conn: true
	can_trim: false
	can_zero: true

pi@rpi-C1:~ $ nbdkit --version
nbdkit 1.10.3

pi@rpi-C1:~ $ nbd-client -l 192.168.1.14
Negotiation: ..
images
recipes
movie

pi@rpi-C1:~ $ sudo modprobe nbd
pi@rpi-C1:~ $ lsmod | grep nbd
nbd                    49152  0

pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N recipes /dev/nbd0
Negotiation: ..size =3D 0MB
Connected /dev/nbd0

pi@rpi-C1:~ $ sudo partx -a /dev/nbd0
partx: /dev/nbd0: failed to read partition table

pi@rpi-C1:~ $ sudo parted -l
Error: /dev/nbd0: unrecognised disk label
Model: Unknown (unknown)                                                 =
=20
Disk /dev/nbd0: 4096B
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:=20

pi@rpi-C1:~ $ dmesg | tail -n 20
[ 2138.454532] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 2138.454547] Buffer I/O error on dev nbd0, logical block 0, async page =
read
[ 2138.457380] block nbd0: Other side returned error (22)
[ 2138.457497] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 2138.457520] Buffer I/O error on dev nbd0, logical block 0, async page =
read
[ 2138.459238] block nbd0: Other side returned error (22)
[ 2138.459280] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 2138.459297] Buffer I/O error on dev nbd0, logical block 0, async page =
read
[ 2138.460993] block nbd0: Other side returned error (22)
[ 2138.461023] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 2138.461038] Buffer I/O error on dev nbd0, logical block 0, async page =
read
[ 2138.462649] block nbd0: Other side returned error (22)
[ 2138.462685] Buffer I/O error on dev nbd0, logical block 0, async page =
read
[ 2138.464344] block nbd0: Other side returned error (22)
[ 2138.466926] block nbd0: Other side returned error (22)
[ 2138.468506] block nbd0: Other side returned error (22)
[ 2138.470066] block nbd0: Other side returned error (22)
[ 2138.471442] block nbd0: Other side returned error (22)
[ 2138.472978] block nbd0: Other side returned error (22)
[ 2138.474448] block nbd0: Other side returned error (22)

pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N movies /dev/nbd1
Negotiation: ..Error: E: server does not support NBD_OPT_GO and dropped =
connection after sending NBD_OPT_EXPORT_NAME. Try -g.
Exiting.

I'm attempting to serve non empty directories so I don't know why it's =
saying 0Mb size?
Scratching my head here . . any thoughts? :/

Thanks in advance,
Simon

> On 12 Aug 2021, at 22:32, Richard W.M. Jones <rjones@redhat.com> =
wrote:
>=20
> On Thu, Jul 22, 2021 at 01:41:00PM +0100, Simon Fernandez wrote:
>> Hi folks,
>> I=E2=80=99m trying setup a client that connect to a 500Gb ext4 disk =
on another machine
>> running nbd server.
>> Server: raspberry pi 3: uname -r 4.19.66+
>> Client: raspberry pi 3: uname -r 5.10.17-v7+
>>=20
>> I=E2=80=99ve followed the information here =
[https://github.com/NetworkBlockDevice/nbd]
>> and a lot of other sites but I think I=E2=80=99m doing something =
wrong on the server
>> setup because I get this on the client:
>>=20
>> $ sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
>> mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2
>>=20
>> Also it appears to be listening on default port - NOT ones specified =
in config
>> file.
>>=20
>> This is how I=E2=80=99ve set up the server & client, it=E2=80=99s =
probably something obvious to
>> more experienced folk.
>=20
> Wouter has answered this already, I just wanted to add a couple of
> smaller points:
>=20
> (1) You don't need to serve each export on a separate port.  The NBD
> protocol can serve multiple exports (disks) on the same port, with the
> client requesting which one it wants.
>=20
> (2) Use the 'nbdinfo' tool to examine what is being served by an NBD
> server.  It can query all sorts of information as described in the
> manual:
> https://libguestfs.org/nbdinfo.1.html =
<https://libguestfs.org/nbdinfo.1.html>
>=20
> Rich.
>=20
>> =3D=3D rpi-C3 (192.168.1.14) server setup
>>> sudo apt-get update
>>> sudo apt-get install nbd-server
>>> sudo nano /etc/nbd-server/config=20
>> [generic]
>> # If you want to run everything as root rather than the nbd user, you
>> # may either say "root" in the two following lines, or remove them
>> # altogether. Do not remove the [generic] section, however.
>>        user =3D nbd
>>        group =3D nbd
>>        includedir =3D /etc/nbd-server/conf.d
>>        allowlist =3D true
>>=20
>> # What follows are export definitions. You may create as much of them =
as
>> # you want, but the section header has to be unique.
>> [images]
>>        exportname =3D /home/pi/media/500G_FAITH/images
>>        port =3D 510029
>> [recipes]
>>        exportname =3D /home/pi/media/500G_FAITH/recipes
>>        port =3D 510030
>> [movie]
>>        exportname =3D /home/pi/media/500G_FAITH/movies
>>        port =3D 510031
>>> sudo modprobe nbd # NOT nbd-server!
>>> lsmod | grep nbd
>> nbd                    40960  0
>>> sudo service nbd-server force-reload # if already running
>>=20
>> =3D=3D client side
>>> sudo apt-get install nbd-client # done
>>> sudo modprobe nbd
>>> nbd-client 192.168.1.14 -l
>> Negotiation: ..
>> images
>> recipes
>> movie
>>> sudo nbd-client 192.168.1.14 -N recipes /dev/nbd2
>> Negotiation: ..size =3D 0MB
>> Connected /dev/nbd2
>>> sudo nbd-client 192.168.1.14 -N movie /dev/nbd3
>> Negotiation: ..size =3D 0MB
>> Connected /dev/nbd3
>>> sudo nbd-client 192.168.1.14 -N images /dev/nbd1
>> Negotiation: ..size =3D 0MB
>> Connected /dev/nbd1
>>=20
>>> dmesg | tail -n 10
>> [ 1417.883364] Buffer I/O error on dev nbd1, logical block 0, async =
page read
>> [ 1417.884614] block nbd1: Other side returned error (22)
>> [ 1417.884652] blk_update_request: I/O error, dev nbd1, sector 0 op =
0x0:(READ)
>> flags 0x0 phys_seg 1 prio class 0
>> [ 1417.884673] Buffer I/O error on dev nbd1, logical block 0, async =
page read
>> [ 1417.885977] block nbd1: Other side returned error (22)
>> [ 1417.886016] blk_update_request: I/O error, dev nbd1, sector 0 op =
0x0:(READ)
>> flags 0x0 phys_seg 1 prio class 0
>> [ 1417.886036] Buffer I/O error on dev nbd1, logical block 0, async =
page read
>> [ 1417.887276] block nbd1: Other side returned error (22)
>> [ 1417.888492] block nbd1: Other side returned error (22)
>> [ 1417.889751] block nbd1: Other side returned error (22)
>>> sudo nbd-client 192.168.1.14 -d /dev/nbd1 # thought it might be =
something to
>> do w/ nbd1
>>> sudo nbd-client 192.168.1.14 -N images /dev/nbd4
>> Negotiation: ..size =3D 0MB
>> Connected /dev/nbd4
>>> dmesg | tail -n 10
>> [ 1848.831897] block nbd4: Other side returned error (22)
>> [ 1848.833341] block nbd4: Other side returned error (22)
>> [ 1848.834651] block nbd4: Other side returned error (22)
>> [ 1848.836002] block nbd4: Other side returned error (22)
>>> lsblk -f
>> NAME        FSTYPE  LABEL         UUID                                =
 FSAVAIL
>> FSUSE% MOUNTPOINT
>> sda                                                                   =
       =20
>>=20
>> =E2=94=9C=E2=94=80sda1      vfat    EFI           67E3-17ED           =
                       =20
>>=20
>> =E2=94=94=E2=94=80sda2      hfsplus time_box_2018 =
f6427a3d-363b-3284-88c4-03ce3493aeff  115.5G=20
>>  94% /media/pi/time_box_2018
>> nbd2                                                                  =
       =20
>>=20
>> nbd3                                                                  =
       =20
>>=20
>> nbd4                                                                  =
       =20
>>=20
>> mmcblk0                                                               =
       =20
>>=20
>> =E2=94=9C=E2=94=80mmcblk0p1 vfat    boot          5DE4-665C           =
                  203.4M=20
>>  19% /boot
>> =E2=94=94=E2=94=80mmcblk0p2 ext4    rootfs        =
7295bbc3-bbc2-4267-9fa0-099e10ef5bf0    4.1G=20
>>  37% /
>>> dmesg | tail -n 10
>> [ 1848.836002] block nbd4: Other side returned error (22)
>> [ 1848.837430] block nbd4: Other side returned error (22)
>> [ 1848.838860] block nbd4: Other side returned error (22)
>> [ 1848.840224] block nbd4: Other side returned error (22)
>> [ 1848.841691] block nbd4: Other side returned error (22)
>> [ 1848.843077] block nbd4: Other side returned error (22)
>> [ 1848.844415] block nbd4: Other side returned error (22)
>> [ 2802.615037] block nbd3: Receive control failed (result -32)
>> [ 2802.625871] block nbd2: Receive control failed (result -32)
>> [ 2802.648444] block nbd4: Receive control failed (result -32)
>>> ls /home/pi/Vols/
>> nbd1-recipes/    rpi-C2-nbd-500G/ tbx2018/         time_box_2018/  =20=

>>> sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
>> mount: /home/pi/Vols/nbd1-recipes: can't read superblock on =
/dev/nbd2.
>>> sudo parted -l
>> Model: Seagate BUP Slim SL (scsi)
>> Disk /dev/sda: 2000GB
>> Sector size (logical/physical): 512B/512B
>> Partition Table: gpt
>> Disk Flags:=20
>>=20
>> Number  Start   End     Size    File system  Name                  =
Flags
>> 1      20.5kB  210MB   210MB   fat32        EFI System Partition  =
boot, esp
>> 2      210MB   2000GB  2000GB  hfs+         time_box_2018
>>=20
>>=20
>> Error: /dev/nbd3: unrecognised disk label
>> Model: Unknown (unknown)                                              =
   =20
>> Disk /dev/nbd3: 4096B
>> Sector size (logical/physical): 512B/512B
>> Partition Table: unknown
>> Disk Flags:=20
>>=20
>> Error: /dev/nbd4: unrecognised disk label
>> Model: Unknown (unknown)                                              =
   =20
>> Disk /dev/nbd4: 4096B
>> Sector size (logical/physical): 512B/512B
>> Partition Table: unknown
>> Disk Flags:=20
>>=20
>> Error: /dev/nbd2: unrecognised disk label
>> Model: Unknown (unknown)                                              =
   =20
>> Disk /dev/nbd2: 4096B
>> Sector size (logical/physical): 512B/512B
>> Partition Table: unknown
>> Disk Flags:=20
>>=20
>> Model: SD SL08G (sd/mmc)
>> Disk /dev/mmcblk0: 7948MB
>> Sector size (logical/physical): 512B/512B
>> Partition Table: msdos
>> Disk Flags:=20
>>=20
>> Number  Start   End     Size    Type     File system  Flags
>> 1      4194kB  273MB   268MB   primary  fat32        lba
>> 2      273MB   7948MB  7676MB  primary  ext4
>>=20
>> I=E2=80=99ve been trying to get them to talk for 2 days now=20
>> One thing I did notice is that the port numbers in the config file =
don=E2=80=99t seem
>> to change the fact it=E2=80=99s listening on he default port??
>>=20
>> $ sudo lsof -i -P -n | grep LISTEN
>> COMMAND    PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
>> cnid_meta  312    root    3u  IPv6  11170      0t0  TCP [::1]:4700 =
(LISTEN)
>> afpd       324    root    3u  IPv4  11195      0t0  TCP *:548 =
(LISTEN)
>> sshd       426    root    3u  IPv4  12126      0t0  TCP *:22 (LISTEN)
>> sshd       426    root    4u  IPv6  12128      0t0  TCP *:22 (LISTEN)
>> dnsmasq    431 dnsmasq    5u  IPv4  12046      0t0  TCP *:53 (LISTEN)
>> dnsmasq    431 dnsmasq    7u  IPv6  12048      0t0  TCP *:53 (LISTEN)
>> nbd-serve 2026     nbd    3u  IPv6  20100      0t0  TCP *:10809 =
(LISTEN)
>>=20
>> I=E2=80=99d be very grateful for any pointers, or other resources =
that my be of help.
>> Thanks in advance,
>> Simon
>>=20
>>=20
>>=20
>>=20
>=20
> --=20
> Richard Jones, Virtualization Group, Red Hat =
http://people.redhat.com/~rjones <http://people.redhat.com/~rjones>
> Read my programming and virtualization blog: http://rwmj.wordpress.com =
<http://rwmj.wordpress.com/>
> virt-top is 'top' for virtual machines.  Tiny program with many
> powerful monitoring features, net stats, disk stats, logging, etc.
> http://people.redhat.com/~rjones/virt-top =
<http://people.redhat.com/~rjones/virt-top>

--Apple-Mail=_83B2082E-E07B-40E9-BFD0-5A74F6F4E866
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255);" class=3D""><span =
style=3D"font-kerning: none" class=3D"">Hi folks,&nbsp;</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255);" class=3D""><span =
style=3D"font-kerning: none" class=3D"">thanks for the reply Wouter's =
reply was in junk only found it when I saw Richards reply and fished it =
out.</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal; font-family: Courier; color: =
rgb(38, 38, 38); background-color: rgb(255, 255, 255); min-height: =
18px;" class=3D""><span style=3D"font-kerning: none" class=3D""></span><br=
 class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal; font-family: Courier; color: =
rgb(38, 38, 38); background-color: rgb(255, 255, 255);" class=3D""><span =
style=3D"font-kerning: none" class=3D"">I'm still =
getting</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #400bd9" class=3D""><b class=3D"">$</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> sudo =
nbd-client 192.168.1.14 10809 -N recipes /dev/nbd0</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(251, 0, 9);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Negotiation: ..size =3D 0MB</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Connected /dev/nbd0</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255); min-height: 18px;" class=3D""><span =
style=3D"font-kerning: none" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255);" class=3D""><span =
style=3D"font-kerning: none" class=3D"">Here are the changes I've made - =
first I built nbdinfo - thanks for the tip Richard.</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255); min-height: 18px;" class=3D""><span =
style=3D"font-kerning: none" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255);" class=3D""><span =
style=3D"font-kerning: none" class=3D"">Build GnuTLS =
from</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><a =
href=3D"https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz"=
 =
class=3D"">https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.=
xz</a></span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal; font-family: Courier; color: =
rgb(38, 38, 38); background-color: rgb(255, 255, 255); min-height: =
18px;" class=3D""><span style=3D"font-kerning: none" class=3D""></span><br=
 class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal; font-family: Courier; color: =
rgb(38, 38, 38); background-color: rgb(255, 255, 255);" class=3D""><span =
style=3D"font-kerning: none" class=3D"">Build libnbd =
from</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><a =
href=3D"https://download.libguestfs.org/libnbd/1.8-stable/libnbd-1.8.3.tar=
.gz" =
class=3D"">https://download.libguestfs.org/libnbd/1.8-stable/libnbd-1.8.3.=
tar.gz</a></span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; min-height: =
13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38);" =
class=3D""><span style=3D"font-kerning: none; background-color: #ffffff" =
class=3D"">After installing quite a lot of libraries . . =
.&nbsp;</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">---------------------------------------------------------------=
-------</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Thank you for downloading libnbd 1.8.3</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">This is how we have configured the =
optional components for you today:</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Optional library =
features:</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; min-height: =
13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; TLS support ............................ yes</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; NBD URI support ........................ yes</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; FUSE support ........................... yes</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; Manual pages ........................... yes</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; Bash tab completion .................... yes</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Language bindings:</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; Go =
..................................... no</span></div><div style=3D"margin:=
 0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; OCaml =
.................................. no</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; Python =
................................. no</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14.7px; line-height: normal; =
font-family: Courier; color: rgb(38, 38, 38); background-color: rgb(255, =
255, 255);" class=3D""><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal; color: rgb(251, 0, 14);" =
class=3D""><span style=3D"font-kerning: none" class=3D"">nbdkit version =
note - during ./configure</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">checking =
for nbdkit... nbdkit</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(251, 0, 12);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">checking =
for nbdkit &gt;=3D 1.12... no (1.10)</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; color: rgb(83, 0, 255);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">configure: WARNING: nbdkit is too old, some tests will be =
disabled</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal; min-height: 18px;" =
class=3D""><span style=3D"font-kerning: none" class=3D""></span><br =
class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal;" class=3D""><span =
style=3D"font-kerning: none" class=3D"">The 'make check' skipped a lot =
of tests but there were no FAILS</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14.7px; line-height: normal; =
min-height: 18px;" class=3D""><span style=3D"font-kerning: none" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">$</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> =
nbdinfo --version</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">nbdinfo 1.8.3</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">libnbd 1.8.3</span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 14.7px; line-height: normal; font-family: Courier; =
color: rgb(38, 38, 38); background-color: rgb(255, 255, 255); =
min-height: 18px;" class=3D""><br class=3D""><span style=3D"font-kerning: =
none" class=3D""></span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 14px; line-height: normal; font-family: Courier; =
color: rgb(12, 107, 255); background-color: rgb(246, 247, 249);" =
class=3D""><span style=3D"font-kerning: none" class=3D"">=3D=3D rpi-C3 =
(192.168.1.14) server side</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(47, 180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Q: Wouter ( <a href=3D"mailto:w@uter.be" =
class=3D"">w@uter.be</a> ) - Are they readable and writable by the "nbd" =
user?</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14px; line-height: normal; color: rgb(18, 150, 255);" =
class=3D""><span style=3D"font-kerning: none" class=3D"">R: I've changed =
the user &amp; group to pi (the logged in user) so should be =
R/W</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(47, =
180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Note: Richard ( <a href=3D"mailto:rjones@redhat.com" =
class=3D"">rjones@redhat.com</a> ) - You don't need to serve each export =
on a separate port.&nbsp; The NBD</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">protocol can serve multiple exports (disks) on the same port, =
with the</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14px; line-height: normal; color: rgb(18, 150, 255);" =
class=3D""><span style=3D"font-kerning: none" class=3D"">client =
requesting which one it wants.</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">R: Have remove the port addresses from =
config</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(47, =
180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C3</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> cat =
/etc/nbd-server/config</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[generic]</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># If =
you want to run everything as root rather than the nbd user, =
you</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># may either say "root" in the two following lines, or remove =
them</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># altogether. Do not remove the [generic] section, =
however.</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>user =3D pi</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>group =3D pi</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>includedir =3D /etc/nbd-server/conf.d</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>allowlist =
=3D true</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; min-height: =
13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># What =
follows are export definitions. You may create as much of them =
as</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># you want, but the section header has to be =
unique.</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[images]</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>exportname =3D /home/pi/media/500G_FAITH/images/</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>transactionlog =3D =
/home/pi/media/500G_FAITH/logs/log_images</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[recipes]</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>exportname =3D =
/home/pi/media/500G_FAITH/recipes/</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>transactionlog =3D =
/home/pi/media/500G_FAITH/logs/log_recipes</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[movie]</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>exportname =3D /home/pi/media/500G_FAITH/movies/</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>transactionlog =3D =
/home/pi/media/500G_FAITH/logs/log_movie</span></div><div style=3D"margin:=
 0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Q: Wouter ( <a href=3D"mailto:w@uter.be" =
class=3D"">w@uter.be</a> ) - Do the paths that you point to in the =
exportname parameters exist?</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"-webkit-font-kerning: none; font-size: 14px;" class=3D""><font =
color=3D"#1296ff" class=3D""><span style=3D"caret-color: rgb(18, 150, =
255);" class=3D"">R:</span><span style=3D"caret-color: rgb(18, 150, =
255);" class=3D"">&nbsp;</span>YES its a directory with a bunch of =
images in it.&nbsp;</font></span><span style=3D"caret-color: rgb(18, =
150, 255); color: rgb(18, 150, 255); font-size: 14px;" class=3D"">YES =
-&nbsp;</span><span style=3D"color: rgb(18, 150, 255); font-size: 14px;" =
class=3D"">Non zero size.</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C3</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> ls =
/home/pi/media/500G_FAITH/recipes/</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">y000_Pork_Belly_Wontan____TOCOST.rtf&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
y011_Rack_And_Black.rtf</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" =
class=3D"">y002_Salmon_Parfait_Forest_Rosemary_Bread_LE.rtf&nbsp; =
y021_StoneAge_Beef_Taragon_Sauce____TOCOST.rtf</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C3</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> ls =
/home/pi/media/500G_FAITH/images</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(200, 20, 201);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D"">160g? of dough - 250C - 6m.jpg</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #000000" =
class=3D""> &nbsp; </span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><b class=3D"">20190228_163410_monkfish =
and red pepper skewers.jpg</b></span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(200, 20, 201);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D"">20190629_202814_couscous w apricots.jpg</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #000000" =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D"">672_V_cheddar_gorgeous.jpg</b></span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(200, 20, 201);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><b class=3D"">20181022_134259.jpg</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #000000" =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D"">20200124_152329_aubergine &amp; pesto =
stuffing.jpg</b></span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(200, 20, 201);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><b =
class=3D"">25_androll_into_pancakes.jpg<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>665 Celeriac &amp; Cockscombe =
Mint Soup.jpg</b></span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(47, 180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C3</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> ls =
/home/pi/media/500G_FAITH/movies</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(200, 20, 201);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D"">NA #015 - Bread.mp4</b></span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; color: rgb(200, 20, 201);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D"">NA #016 - Fisetin - Mayo Clinic =
Trials.mp4</b></span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(200, 20, 201);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><b class=3D"">NA #042 - Delta Variant =
COVID.mp4</b></span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(200, 20, 201);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><b class=3D"">NA #044 - Lex =
Fridman.mp4</b></span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(47, 180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C3</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> ls -la =
/home/pi/media/500G_FAITH/logs</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">-rw------- 1 pi pi &nbsp; &nbsp; 56 Aug =
26 17:00 log_images</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">-rw------- 1 pi pi &nbsp; &nbsp; 56 Aug 26 17:00 =
log_movie</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">-rw------- 1 pi pi&nbsp; &nbsp; 700 Aug 26 17:35 =
log_recipes</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(47, =
180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C3</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> cat =
/home/pi/media/500G_FAITH/logs/log_images</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">%`?%`?</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; =
min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #2fb41d" =
class=3D""><b class=3D"">pi@rpi-C3</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> cat =
/home/pi/media/500G_FAITH/logs/log_movie</span></div><div style=3D"margin:=
 0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">%`?%`?</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C3</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> cat =
/home/pi/media/500G_FAITH/logs/log_recipes</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">%`?`%`?a%`?b%`?c%`?d%`?e%`?f%`?g%`?h%`?i%`?j%`?k%`?l%`?%`?%`?%`=
?%`?%`?%`?%`?%`%`?<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>%`?</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(47, 180, 29); =
min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><b class=3D""></b></span><br =
class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #2fb41d" class=3D""><b class=3D"">pi@rpi-C3</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> nbdkit --version</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">nbdkit 1.1.12</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255); min-height: 18px;" class=3D""><span =
style=3D"font-kerning: none" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14.7px; =
line-height: normal; font-family: Courier; color: rgb(38, 38, 38); =
background-color: rgb(255, 255, 255); min-height: 18px;" class=3D""><span =
style=3D"font-kerning: none" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 14px; =
line-height: normal; font-family: Courier; color: rgb(251, 0, 157); =
background-color: rgb(246, 247, 249);" class=3D""><span =
style=3D"font-kerning: none" class=3D"">=3D=3D client =
side</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14px; line-height: normal; color: rgb(18, 150, 255); =
min-height: 17px;" class=3D""><span style=3D"font-kerning: none" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Note: Richard ( <a href=3D"mailto:rjones@redhat.com" =
class=3D"">rjones@redhat.com</a> ) - Use the 'nbdinfo' tool to examine =
what is being served by an NBD</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">server.&nbsp; It can query all sorts of information as =
described in the manual:</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14px; line-height: normal; color: =
rgb(18, 150, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">R: Built the tool. - here is what it says : =
/</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 14.7px; line-height: normal; font-family: Courier; color: =
rgb(38, 38, 38); background-color: rgb(255, 255, 255); min-height: =
18px;" class=3D""><span style=3D"font-kerning: none" class=3D""></span><br=
 class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #2fb41d" class=3D""><b class=3D"">pi@rpi-C1</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> nbdinfo <a href=3D"nbd://192.168.1.14:10809/recipes" =
class=3D"">nbd://192.168.1.14:10809/recipes</a></span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">protocol:=
 newstyle-fixed without TLS</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">export=3D"recipes":</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>export-size: 4096</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>uri: <a =
href=3D"nbd://192.168.1.14:10809/recipes" =
class=3D"">nbd://192.168.1.14:10809/recipes</a></span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>is_rotational: false</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>is_read_only: =
true</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>can_cache: false</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>can_df: false</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>can_fast_zero: false</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>can_flush: false</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>can_fua: =
false</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>can_multi_conn: true</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>can_trim: false</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>can_zero: =
true</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; color: rgb(47, =
180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; color: rgb(47, 180, 29); min-height: 13px;" class=3D""><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C1</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> nbdkit =
--version</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">nbdkit =
1.10.3</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #2fb41d" class=3D""><b class=3D"">pi@rpi-C1</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> nbd-client -l 192.168.1.14</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Negotiation: ..</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">images</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">recipes</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">movie</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(47, 180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C1</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> sudo =
modprobe nbd</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #2fb41d" class=3D""><b class=3D"">pi@rpi-C1</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> lsmod | grep nbd</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #b42419" class=3D""><b =
class=3D"">nbd</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 49152&nbsp; 0</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(47, 180, 29); =
min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><b class=3D""></b></span><br =
class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #2fb41d" class=3D""><b class=3D"">pi@rpi-C1</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> sudo nbd-client 192.168.1.14 10809 -N recipes =
/dev/nbd0</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Negotiation: ..size =3D 0MB</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Connected /dev/nbd0</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo; color: rgb(47, 180, 29); =
min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><b class=3D""></b></span><br =
class=3D""></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #2fb41d" class=3D""><b class=3D"">pi@rpi-C1</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> sudo partx -a /dev/nbd0</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">partx: /dev/nbd0: failed to read =
partition table</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo; color: =
rgb(47, 180, 29); min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><b =
class=3D""></b></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C1</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> sudo =
parted -l</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Error: /dev/nbd0: unrecognised disk label</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Model: =
Unknown (unknown) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Disk =
/dev/nbd0: 4096B</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Sector size (logical/physical): 512B/512B</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Partition=
 Table: unknown</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Disk Flags:&nbsp;</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #2fb41d" class=3D""><b =
class=3D"">pi@rpi-C1</b></span><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">:</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #400bd9" =
class=3D""><b class=3D"">~ $</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""> dmesg =
| tail -n 20</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.454532] blk_update_request: I/O error, dev nbd0, =
sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class =
0</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.454547] Buffer I/O error on dev nbd0, logical block 0, =
async page read</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.457380] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.457497] blk_update_request: I/O error, dev nbd0, =
sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class =
0</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.457520] Buffer I/O error on dev nbd0, logical block 0, =
async page read</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.459238] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.459280] blk_update_request: I/O error, dev nbd0, =
sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class =
0</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.459297] Buffer I/O error on dev nbd0, logical block 0, =
async page read</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.460993] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.461023] blk_update_request: I/O error, dev nbd0, =
sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class =
0</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.461038] Buffer I/O error on dev nbd0, logical block 0, =
async page read</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.462649] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.462685] Buffer I/O error on dev nbd0, logical block 0, =
async page read</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.464344] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.466926] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.468506] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.470066] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.471442] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.472978] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[ 2138.474448] block nbd0: Other side returned error =
(22)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo; min-height: =
13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #2fb41d" =
class=3D""><b class=3D"">pi@rpi-C1</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> sudo nbd-client 192.168.1.14 10809 -N movies =
/dev/nbd1</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Negotiation: ..Error: E: server does not support NBD_OPT_GO =
and dropped connection after sending NBD_OPT_EXPORT_NAME. Try =
-g.</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Exiting.</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 14.7px; line-height: normal; font-family: Courier; =
color: rgb(38, 38, 38); background-color: rgb(255, 255, 255); =
min-height: 18px;" class=3D""><span style=3D"font-kerning: none" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14.7px; line-height: normal; =
font-family: Courier; color: rgb(38, 38, 38); background-color: rgb(255, =
255, 255);" class=3D""><span style=3D"font-kerning: none" class=3D"">I'm =
attempting to serve non empty directories so I don't know why it's =
saying 0Mb size?</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 14.7px; line-height: normal; font-family: Courier; =
color: rgb(38, 38, 38); background-color: rgb(255, 255, 255);" =
class=3D""><span style=3D"font-kerning: none" class=3D"">Scratching my =
head here . . any thoughts? :/</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14.7px; line-height: normal; =
font-family: Courier; color: rgb(38, 38, 38); background-color: rgb(255, =
255, 255); min-height: 18px;" class=3D""><span style=3D"font-kerning: =
none" class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14.7px; line-height: normal; =
font-family: Courier; color: rgb(38, 38, 38); background-color: rgb(255, =
255, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Thanks in advance,</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 14.7px; line-height: normal; =
font-family: Courier; color: rgb(38, 38, 38); background-color: rgb(255, =
255, 255);" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Simon</span></div><div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D"">On 12 Aug 2021, at 22:32, Richard W.M. Jones =
&lt;<a href=3D"mailto:rjones@redhat.com" =
class=3D"">rjones@redhat.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Thu, Jul 22, 2021 at =
01:41:00PM +0100, Simon Fernandez wrote:</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Hi folks,<br class=3D"">I=E2=80=99m =
trying setup a client that connect to a 500Gb ext4 disk on another =
machine<br class=3D"">running nbd server.<br class=3D"">Server: =
raspberry pi 3: uname -r 4.19.66+<br class=3D"">Client: raspberry pi 3: =
uname -r 5.10.17-v7+<br class=3D""><br class=3D"">I=E2=80=99ve followed =
the information here [<a =
href=3D"https://github.com/NetworkBlockDevice/nbd" =
class=3D"">https://github.com/NetworkBlockDevice/nbd</a>]<br =
class=3D"">and a lot of other sites but I think I=E2=80=99m doing =
something wrong on the server<br class=3D"">setup because I get this on =
the client:<br class=3D""><br class=3D"">$ sudo mount /dev/nbd2 =
/home/pi/Vols/nbd1-recipes/<br class=3D"">mount: =
/home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2<br =
class=3D""><br class=3D"">Also it appears to be listening on default =
port - NOT ones specified in config<br class=3D"">file.<br class=3D""><br =
class=3D"">This is how I=E2=80=99ve set up the server &amp; client, =
it=E2=80=99s probably something obvious to<br class=3D"">more =
experienced folk.<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Wouter has answered this already, I just wanted to add a =
couple of</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">smaller =
points:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">(1) You don't =
need to serve each export on a separate port. &nbsp;The NBD</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">protocol can serve multiple =
exports (disks) on the same port, with the</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">client requesting which one it wants.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">(2) Use the 'nbdinfo' tool to =
examine what is being served by an NBD</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">server. &nbsp;It can query all sorts of information as =
described in the</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">manual:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><a =
href=3D"https://libguestfs.org/nbdinfo.1.html" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://libguestfs.org/nbdinfo.1.html</a><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Rich.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">=3D=3D =
rpi-C3 (192.168.1.14) server setup<br class=3D""><blockquote type=3D"cite"=
 class=3D"">sudo apt-get update<br class=3D"">sudo apt-get install =
nbd-server<br class=3D"">sudo nano /etc/nbd-server/config<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""></blockquote>[generic]<br class=3D""># If you want to run =
everything as root rather than the nbd user, you<br class=3D""># may =
either say "root" in the two following lines, or remove them<br =
class=3D""># altogether. Do not remove the [generic] section, =
however.<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;user =3D =
nbd<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;group =3D =
nbd<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;includedir =3D=
 /etc/nbd-server/conf.d<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;allowlist =3D =
true<br class=3D""><br class=3D""># What follows are export definitions. =
You may create as much of them as<br class=3D""># you want, but the =
section header has to be unique.<br class=3D"">[images]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exportname =3D =
/home/pi/media/500G_FAITH/images<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;port =3D 510029<br =
class=3D"">[recipes]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exportname =3D =
/home/pi/media/500G_FAITH/recipes<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;port =3D 510030<br =
class=3D"">[movie]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exportname =3D =
/home/pi/media/500G_FAITH/movies<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;port =3D 510031<br =
class=3D""><blockquote type=3D"cite" class=3D"">sudo modprobe nbd # NOT =
nbd-server!<br class=3D"">lsmod | grep nbd<br class=3D""></blockquote>nbd =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40960 &nbsp;0<br =
class=3D""><blockquote type=3D"cite" class=3D"">sudo service nbd-server =
force-reload # if already running<br class=3D""></blockquote><br =
class=3D"">=3D=3D client side<br class=3D""><blockquote type=3D"cite" =
class=3D"">sudo apt-get install nbd-client # done<br class=3D"">sudo =
modprobe nbd<br class=3D"">nbd-client 192.168.1.14 -l<br =
class=3D""></blockquote>Negotiation: ..<br class=3D"">images<br =
class=3D"">recipes<br class=3D"">movie<br class=3D""><blockquote =
type=3D"cite" class=3D"">sudo nbd-client 192.168.1.14 -N recipes =
/dev/nbd2<br class=3D""></blockquote>Negotiation: ..size =3D 0MB<br =
class=3D"">Connected /dev/nbd2<br class=3D""><blockquote type=3D"cite" =
class=3D"">sudo nbd-client 192.168.1.14 -N movie /dev/nbd3<br =
class=3D""></blockquote>Negotiation: ..size =3D 0MB<br =
class=3D"">Connected /dev/nbd3<br class=3D""><blockquote type=3D"cite" =
class=3D"">sudo nbd-client 192.168.1.14 -N images /dev/nbd1<br =
class=3D""></blockquote>Negotiation: ..size =3D 0MB<br =
class=3D"">Connected /dev/nbd1<br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">dmesg | tail -n 10<br class=3D""></blockquote>[ =
1417.883364] Buffer I/O error on dev nbd1, logical block 0, async page =
read<br class=3D"">[ 1417.884614] block nbd1: Other side returned error =
(22)<br class=3D"">[ 1417.884652] blk_update_request: I/O error, dev =
nbd1, sector 0 op 0x0:(READ)<br class=3D"">flags 0x0 phys_seg 1 prio =
class 0<br class=3D"">[ 1417.884673] Buffer I/O error on dev nbd1, =
logical block 0, async page read<br class=3D"">[ 1417.885977] block =
nbd1: Other side returned error (22)<br class=3D"">[ 1417.886016] =
blk_update_request: I/O error, dev nbd1, sector 0 op 0x0:(READ)<br =
class=3D"">flags 0x0 phys_seg 1 prio class 0<br class=3D"">[ =
1417.886036] Buffer I/O error on dev nbd1, logical block 0, async page =
read<br class=3D"">[ 1417.887276] block nbd1: Other side returned error =
(22)<br class=3D"">[ 1417.888492] block nbd1: Other side returned error =
(22)<br class=3D"">[ 1417.889751] block nbd1: Other side returned error =
(22)<br class=3D""><blockquote type=3D"cite" class=3D"">sudo nbd-client =
192.168.1.14 -d /dev/nbd1 # thought it might be something to<br =
class=3D""></blockquote>do w/ nbd1<br class=3D""><blockquote type=3D"cite"=
 class=3D"">sudo nbd-client 192.168.1.14 -N images /dev/nbd4<br =
class=3D""></blockquote>Negotiation: ..size =3D 0MB<br =
class=3D"">Connected /dev/nbd4<br class=3D""><blockquote type=3D"cite" =
class=3D"">dmesg | tail -n 10<br class=3D""></blockquote>[ 1848.831897] =
block nbd4: Other side returned error (22)<br class=3D"">[ 1848.833341] =
block nbd4: Other side returned error (22)<br class=3D"">[ 1848.834651] =
block nbd4: Other side returned error (22)<br class=3D"">[ 1848.836002] =
block nbd4: Other side returned error (22)<br class=3D""><blockquote =
type=3D"cite" class=3D"">lsblk -f<br class=3D""></blockquote>NAME =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FSTYPE &nbsp;LABEL =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UUID =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FSAVAIL<br class=3D"">FSUSE% =
MOUNTPOINT<br class=3D"">sda =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
<br class=3D""><br class=3D"">=E2=94=9C=E2=94=80sda1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vfat &nbsp;&nbsp;&nbsp;EFI =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;67E3-17ED =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br class=3D""><br=
 class=3D"">=E2=94=94=E2=94=80sda2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hfsplus =
time_box_2018 f6427a3d-363b-3284-88c4-03ce3493aeff &nbsp;115.5G<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">&nbsp;94% =
/media/pi/time_box_2018<br class=3D"">nbd2 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br =
class=3D""><br class=3D"">nbd3 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br =
class=3D""><br class=3D"">nbd4 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br =
class=3D""><br class=3D"">mmcblk0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br class=3D""><br =
class=3D"">=E2=94=9C=E2=94=80mmcblk0p1 vfat &nbsp;&nbsp;&nbsp;boot =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5DE4-665C =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;203.4M<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">&nbsp;19% =
/boot<br class=3D"">=E2=94=94=E2=94=80mmcblk0p2 ext4 =
&nbsp;&nbsp;&nbsp;rootfs =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7295bbc3-bbc2-4267-9fa0-099e10ef=
5bf0 &nbsp;&nbsp;&nbsp;4.1G<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">&nbsp;37% =
/<br class=3D""><blockquote type=3D"cite" class=3D"">dmesg | tail -n =
10<br class=3D""></blockquote>[ 1848.836002] block nbd4: Other side =
returned error (22)<br class=3D"">[ 1848.837430] block nbd4: Other side =
returned error (22)<br class=3D"">[ 1848.838860] block nbd4: Other side =
returned error (22)<br class=3D"">[ 1848.840224] block nbd4: Other side =
returned error (22)<br class=3D"">[ 1848.841691] block nbd4: Other side =
returned error (22)<br class=3D"">[ 1848.843077] block nbd4: Other side =
returned error (22)<br class=3D"">[ 1848.844415] block nbd4: Other side =
returned error (22)<br class=3D"">[ 2802.615037] block nbd3: Receive =
control failed (result -32)<br class=3D"">[ 2802.625871] block nbd2: =
Receive control failed (result -32)<br class=3D"">[ 2802.648444] block =
nbd4: Receive control failed (result -32)<br class=3D""><blockquote =
type=3D"cite" class=3D"">ls /home/pi/Vols/<br =
class=3D""></blockquote>nbd1-recipes/ &nbsp;&nbsp;&nbsp;rpi-C2-nbd-500G/ =
tbx2018/ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time_box_2018/ =
&nbsp;&nbsp;<br class=3D""><blockquote type=3D"cite" class=3D"">sudo =
mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/<br =
class=3D""></blockquote>mount: /home/pi/Vols/nbd1-recipes: can't read =
superblock on /dev/nbd2.<br class=3D""><blockquote type=3D"cite" =
class=3D"">sudo parted -l<br class=3D""></blockquote>Model: Seagate BUP =
Slim SL (scsi)<br class=3D"">Disk /dev/sda: 2000GB<br class=3D"">Sector =
size (logical/physical): 512B/512B<br class=3D"">Partition Table: gpt<br =
class=3D"">Disk Flags:<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">Number &nbsp;Start &nbsp;&nbsp;End =
&nbsp;&nbsp;&nbsp;&nbsp;Size &nbsp;&nbsp;&nbsp;File system &nbsp;Name =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;Flags<br class=3D"">1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20.5kB &nbsp;210MB &nbsp;&nbsp;210MB =
&nbsp;&nbsp;fat32 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EFI System =
Partition &nbsp;boot, esp<br class=3D"">2 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;210MB &nbsp;&nbsp;2000GB &nbsp;2000GB =
&nbsp;hfs+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time_box_2018<br =
class=3D""><br class=3D""><br class=3D"">Error: /dev/nbd3: unrecognised =
disk label<br class=3D"">Model: Unknown (unknown) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b=
r class=3D"">Disk /dev/nbd3: 4096B<br class=3D"">Sector size =
(logical/physical): 512B/512B<br class=3D"">Partition Table: unknown<br =
class=3D"">Disk Flags:<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">Error: /dev/nbd4: unrecognised disk label<br class=3D"">Model: =
Unknown (unknown) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b=
r class=3D"">Disk /dev/nbd4: 4096B<br class=3D"">Sector size =
(logical/physical): 512B/512B<br class=3D"">Partition Table: unknown<br =
class=3D"">Disk Flags:<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">Error: /dev/nbd2: unrecognised disk label<br class=3D"">Model: =
Unknown (unknown) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b=
r class=3D"">Disk /dev/nbd2: 4096B<br class=3D"">Sector size =
(logical/physical): 512B/512B<br class=3D"">Partition Table: unknown<br =
class=3D"">Disk Flags:<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">Model: SD SL08G (sd/mmc)<br class=3D"">Disk /dev/mmcblk0: =
7948MB<br class=3D"">Sector size (logical/physical): 512B/512B<br =
class=3D"">Partition Table: msdos<br class=3D"">Disk Flags:<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">Number &nbsp;Start &nbsp;&nbsp;End =
&nbsp;&nbsp;&nbsp;&nbsp;Size &nbsp;&nbsp;&nbsp;Type =
&nbsp;&nbsp;&nbsp;&nbsp;File system &nbsp;Flags<br class=3D"">1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4194kB &nbsp;273MB &nbsp;&nbsp;268MB =
&nbsp;&nbsp;primary &nbsp;fat32 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lba<br class=3D"">2 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;273MB &nbsp;&nbsp;7948MB &nbsp;7676MB =
&nbsp;primary &nbsp;ext4<br class=3D""><br class=3D"">I=E2=80=99ve been =
trying to get them to talk for 2 days now<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">One thing I =
did notice is that the port numbers in the config file don=E2=80=99t =
seem<br class=3D"">to change the fact it=E2=80=99s listening on he =
default port??<br class=3D""><br class=3D"">$ sudo lsof -i -P -n | grep =
LISTEN<br class=3D"">COMMAND &nbsp;&nbsp;&nbsp;PID =
&nbsp;&nbsp;&nbsp;USER &nbsp;&nbsp;FD &nbsp;&nbsp;TYPE DEVICE SIZE/OFF =
NODE NAME<br class=3D"">cnid_meta &nbsp;312 &nbsp;&nbsp;&nbsp;root =
&nbsp;&nbsp;&nbsp;3u &nbsp;IPv6 &nbsp;11170 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP [::1]:4700 (LISTEN)<br =
class=3D"">afpd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;324 =
&nbsp;&nbsp;&nbsp;root &nbsp;&nbsp;&nbsp;3u &nbsp;IPv4 &nbsp;11195 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:548 (LISTEN)<br =
class=3D"">sshd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;426 =
&nbsp;&nbsp;&nbsp;root &nbsp;&nbsp;&nbsp;3u &nbsp;IPv4 &nbsp;12126 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:22 (LISTEN)<br =
class=3D"">sshd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;426 =
&nbsp;&nbsp;&nbsp;root &nbsp;&nbsp;&nbsp;4u &nbsp;IPv6 &nbsp;12128 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:22 (LISTEN)<br =
class=3D"">dnsmasq &nbsp;&nbsp;&nbsp;431 dnsmasq &nbsp;&nbsp;&nbsp;5u =
&nbsp;IPv4 &nbsp;12046 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:53 =
(LISTEN)<br class=3D"">dnsmasq &nbsp;&nbsp;&nbsp;431 dnsmasq =
&nbsp;&nbsp;&nbsp;7u &nbsp;IPv6 &nbsp;12048 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:53 (LISTEN)<br =
class=3D"">nbd-serve 2026 &nbsp;&nbsp;&nbsp;&nbsp;nbd =
&nbsp;&nbsp;&nbsp;3u &nbsp;IPv6 &nbsp;20100 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:10809 (LISTEN)<br =
class=3D""><br class=3D"">I=E2=80=99d be very grateful for any pointers, =
or other resources that my be of help.<br class=3D"">Thanks in =
advance,<br class=3D"">Simon<br class=3D""><br class=3D""><br =
class=3D""><br class=3D""><br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Richard Jones, Virtualization =
Group, Red Hat<span class=3D"Apple-converted-space">&nbsp;</span></span><a=
 href=3D"http://people.redhat.com/~rjones" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">http://people.redhat.com/~rjones</a><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Read my programming and virtualization blog:<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://rwmj.wordpress.com/" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">http://rwmj.wordpress.com</a><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">virt-top is 'top' for virtual machines. &nbsp;Tiny program =
with many</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">powerful =
monitoring features, net stats, disk stats, logging, etc.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><a =
href=3D"http://people.redhat.com/~rjones/virt-top" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">http://people.redhat.com/~rjones/virt-top</a></div></blockquote=
></div><br class=3D""></body></html>=

--Apple-Mail=_83B2082E-E07B-40E9-BFD0-5A74F6F4E866--

