Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B63D23F1
	for <lists+nbd@lfdr.de>; Thu, 22 Jul 2021 14:57:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C90B020698; Thu, 22 Jul 2021 12:57:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 22 12:57:26 2021
Old-Return-Path: <fernandez.simon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SARE_HTML_COLOR_NWHT autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AF1A420691
	for <lists-other-nbd@bendel.debian.org>; Thu, 22 Jul 2021 12:41:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.524 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, HTML_MESSAGE=2, RCVD_IN_DNSWL_NONE=-0.0001,
	SARE_HTML_COLOR_NWHT=0.623] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fVgElPYdU_gz for <lists-other-nbd@bendel.debian.org>;
	Thu, 22 Jul 2021 12:41:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-wm1-x334.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1614A205FC
	for <nbd@other.debian.org>; Thu, 22 Jul 2021 12:41:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id w13so3247227wmc.3
        for <nbd@other.debian.org>; Thu, 22 Jul 2021 05:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:mime-version:subject:message-id:date:to;
        bh=xaiD6Mp3dtA2lj1KKh/DmyNRWtcbge/hZyKbjUjDkPc=;
        b=SOLb1Plsw2JTgSR5syvEWnZDB4OcKjuf0qla0p2Ep7E1F7TTwjfDSLsiti394542Qj
         cFoAvRV4EI3niWj8TxRe7XQB2I4HuEF7jxXF1KCF4wfu6UyfLdKroKtl9LlPFP65F4T3
         7P7DtEkxKJ2BzCjX3ZY74iWFM4Lq3pEsjCrs0XZ0qPbgT+kZlAyR2fpQrrhgwlbqLVuJ
         b2JJhH0Na+Gh1F7DwZols7+GH0NilnAEWdl1R/WcGtKw4sd4UPo9RhdZMivslI4YGg8Q
         8kOO24u2w+QnEfGJVaUYzgEpnIqr6WIrb8GA7rZMTUrJO9jtoEsnt/R35GkbFVRdZCuM
         pvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
        bh=xaiD6Mp3dtA2lj1KKh/DmyNRWtcbge/hZyKbjUjDkPc=;
        b=AhNXXUiuPpgCol6WkeAvUoToBJjEt7JhKyG68lj6fc7X74m5FgoTc/jJkJH47r14K7
         D8dKlaDB4zAKYjbENXrfcP9fgryp9ixfvchA5E0QrRhYs6n0izlRJ+UM98tuitXXFZTX
         54WhdE76/XgAckU+OqExm1zHBKtnpqd0qzlMjXk2UaMuhgfDG+ZvGJVxRbWCSwfbJ6nU
         6fBN3hv9n0wSbD6tgMkDNrXYkhsrTgfATs9WGmHo84I3QZKUggnfXo8Oh3F8uLEi7rgi
         K9mL1vLlUJWXMevmCZOIyyZ3PXsB3Jh77T5mSX5FqlcB06lsL0sZR+WZ8ygup0UpovR2
         pD1Q==
X-Gm-Message-State: AOAM530kcC7Rr4LnRWHcQNMRCl7Jgc57v/1xfyhV6ajPa2OzEXQKae7D
	JzsjfhF0Mch9H/isYqjXOhbFl0+RIcU=
X-Google-Smtp-Source: ABdhPJxX0ApYOWTsNi7Rad1BjiD9TY267Y+/Gr7V/xkFyLRJBsPcH911jE4Qzevh7HAnkmbNqBz24g==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr41939565wmk.77.1626957662962;
        Thu, 22 Jul 2021 05:41:02 -0700 (PDT)
Received: from simons-mbp.lan (51.4.200.146.dyn.plus.net. [146.200.4.51])
        by smtp.gmail.com with ESMTPSA id h15sm28975994wrq.88.2021.07.22.05.41.01
        for <nbd@other.debian.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jul 2021 05:41:02 -0700 (PDT)
From: Simon Fernandez <fernandez.simon@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0A975B78-DD15-4D7D-A239-42C3051C3885"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Setting up NBD server / client - block nbd4: Other side returned
 error (22) issue
Message-Id: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
Date: Thu, 22 Jul 2021 13:41:00 +0100
To: nbd@other.debian.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tC792NIyzXD.A.Z8B.2sW-gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1223
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com
Resent-Date: Thu, 22 Jul 2021 12:57:26 +0000 (UTC)


--Apple-Mail=_0A975B78-DD15-4D7D-A239-42C3051C3885
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi folks,
I=E2=80=99m trying setup a client that connect to a 500Gb ext4 disk on =
another machine running nbd server.
Server: raspberry pi 3: uname -r 4.19.66+
Client: raspberry pi 3: uname -r 5.10.17-v7+

I=E2=80=99ve followed the information here =
<https://github.com/NetworkBlockDevice/nbd> =
[https://github.com/NetworkBlockDevice/nbd] and a lot of other sites but =
I think I=E2=80=99m doing something wrong on the server setup because I =
get this on the client:

$ sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2

Also it appears to be listening on default port - NOT ones specified in =
config file.

This is how I=E2=80=99ve set up the server & client, it=E2=80=99s =
probably something obvious to more experienced folk.

=3D=3D rpi-C3 (192.168.1.14) server setup
> sudo apt-get update
> sudo apt-get install nbd-server
> sudo nano /etc/nbd-server/config=20
[generic]
# If you want to run everything as root rather than the nbd user, you
# may either say "root" in the two following lines, or remove them
# altogether. Do not remove the [generic] section, however.
        user =3D nbd
        group =3D nbd
        includedir =3D /etc/nbd-server/conf.d
        allowlist =3D true

# What follows are export definitions. You may create as much of them as
# you want, but the section header has to be unique.
[images]
        exportname =3D /home/pi/media/500G_FAITH/images
        port =3D 510029
[recipes]
        exportname =3D /home/pi/media/500G_FAITH/recipes
        port =3D 510030
[movie]
        exportname =3D /home/pi/media/500G_FAITH/movies
        port =3D 510031
> sudo modprobe nbd					# NOT =
nbd-server!
> lsmod | grep nbd
nbd                    40960  0
> sudo service nbd-server force-reload			# if already =
running

=3D=3D client side
> sudo apt-get install nbd-client		# done
> sudo modprobe nbd
> nbd-client 192.168.1.14 -l
Negotiation: ..
images
recipes
movie
> sudo nbd-client 192.168.1.14 -N recipes /dev/nbd2
Negotiation: ..size =3D 0MB
Connected /dev/nbd2
> sudo nbd-client 192.168.1.14 -N movie /dev/nbd3
Negotiation: ..size =3D 0MB
Connected /dev/nbd3
> sudo nbd-client 192.168.1.14 -N images /dev/nbd1
Negotiation: ..size =3D 0MB
Connected /dev/nbd1

> dmesg | tail -n 10
[ 1417.883364] Buffer I/O error on dev nbd1, logical block 0, async page =
read
[ 1417.884614] block nbd1: Other side returned error (22)
[ 1417.884652] blk_update_request: I/O error, dev nbd1, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 1417.884673] Buffer I/O error on dev nbd1, logical block 0, async page =
read
[ 1417.885977] block nbd1: Other side returned error (22)
[ 1417.886016] blk_update_request: I/O error, dev nbd1, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[ 1417.886036] Buffer I/O error on dev nbd1, logical block 0, async page =
read
[ 1417.887276] block nbd1: Other side returned error (22)
[ 1417.888492] block nbd1: Other side returned error (22)
[ 1417.889751] block nbd1: Other side returned error (22)
> sudo nbd-client 192.168.1.14 -d /dev/nbd1		# thought it =
might be something to do w/ nbd1
> sudo nbd-client 192.168.1.14 -N images /dev/nbd4
Negotiation: ..size =3D 0MB
Connected /dev/nbd4
> dmesg | tail -n 10
[ 1848.831897] block nbd4: Other side returned error (22)
[ 1848.833341] block nbd4: Other side returned error (22)
[ 1848.834651] block nbd4: Other side returned error (22)
[ 1848.836002] block nbd4: Other side returned error (22)
> lsblk -f
NAME        FSTYPE  LABEL         UUID                                 =
FSAVAIL FSUSE% MOUNTPOINT
sda                                                                      =
            =20
=E2=94=9C=E2=94=80sda1      vfat    EFI           67E3-17ED              =
                            =20
=E2=94=94=E2=94=80sda2      hfsplus time_box_2018 =
f6427a3d-363b-3284-88c4-03ce3493aeff  115.5G    94% =
/media/pi/time_box_2018
nbd2                                                                     =
            =20
nbd3                                                                     =
            =20
nbd4                                                                     =
            =20
mmcblk0                                                                  =
            =20
=E2=94=9C=E2=94=80mmcblk0p1 vfat    boot          5DE4-665C              =
               203.4M    19% /boot
=E2=94=94=E2=94=80mmcblk0p2 ext4    rootfs        =
7295bbc3-bbc2-4267-9fa0-099e10ef5bf0    4.1G    37% /
> dmesg | tail -n 10
[ 1848.836002] block nbd4: Other side returned error (22)
[ 1848.837430] block nbd4: Other side returned error (22)
[ 1848.838860] block nbd4: Other side returned error (22)
[ 1848.840224] block nbd4: Other side returned error (22)
[ 1848.841691] block nbd4: Other side returned error (22)
[ 1848.843077] block nbd4: Other side returned error (22)
[ 1848.844415] block nbd4: Other side returned error (22)
[ 2802.615037] block nbd3: Receive control failed (result -32)
[ 2802.625871] block nbd2: Receive control failed (result -32)
[ 2802.648444] block nbd4: Receive control failed (result -32)
> ls /home/pi/Vols/
nbd1-recipes/    rpi-C2-nbd-500G/ tbx2018/         time_box_2018/  =20
> sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2.
> sudo parted -l
Model: Seagate BUP Slim SL (scsi)
Disk /dev/sda: 2000GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:=20

Number  Start   End     Size    File system  Name                  Flags
 1      20.5kB  210MB   210MB   fat32        EFI System Partition  boot, =
esp
 2      210MB   2000GB  2000GB  hfs+         time_box_2018


Error: /dev/nbd3: unrecognised disk label
Model: Unknown (unknown)                                                 =
=20
Disk /dev/nbd3: 4096B
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:=20

Error: /dev/nbd4: unrecognised disk label
Model: Unknown (unknown)                                                 =
=20
Disk /dev/nbd4: 4096B
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:=20

Error: /dev/nbd2: unrecognised disk label
Model: Unknown (unknown)                                                 =
=20
Disk /dev/nbd2: 4096B
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:=20

Model: SD SL08G (sd/mmc)
Disk /dev/mmcblk0: 7948MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:=20

Number  Start   End     Size    Type     File system  Flags
 1      4194kB  273MB   268MB   primary  fat32        lba
 2      273MB   7948MB  7676MB  primary  ext4

I=E2=80=99ve been trying to get them to talk for 2 days now=20
One thing I did notice is that the port numbers in the config file =
don=E2=80=99t seem to change the fact it=E2=80=99s listening on he =
default port??

$ sudo lsof -i -P -n | grep LISTEN
COMMAND    PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
cnid_meta  312    root    3u  IPv6  11170      0t0  TCP [::1]:4700 =
(LISTEN)
afpd       324    root    3u  IPv4  11195      0t0  TCP *:548 (LISTEN)
sshd       426    root    3u  IPv4  12126      0t0  TCP *:22 (LISTEN)
sshd       426    root    4u  IPv6  12128      0t0  TCP *:22 (LISTEN)
dnsmasq    431 dnsmasq    5u  IPv4  12046      0t0  TCP *:53 (LISTEN)
dnsmasq    431 dnsmasq    7u  IPv6  12048      0t0  TCP *:53 (LISTEN)
nbd-serve 2026     nbd    3u  IPv6  20100      0t0  TCP *:10809 (LISTEN)

I=E2=80=99d be very grateful for any pointers, or other resources that =
my be of help.
Thanks in advance,
Simon





--Apple-Mail=_0A975B78-DD15-4D7D-A239-42C3051C3885
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><font=
 color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">Hi =
folks,</font><div class=3D""><font color=3D"#2400bf" face=3D"Menlo" =
size=3D"2" class=3D"">I=E2=80=99m trying setup a client that connect to =
a 500Gb ext4 disk on another machine running nbd server.</font><div =
class=3D""><font color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D"">Server:&nbsp;raspberry pi 3:&nbsp;uname =
-r&nbsp;4.19.66+</font></div><div class=3D""><font color=3D"#2400bf" =
face=3D"Menlo" size=3D"2" class=3D"">Client:&nbsp;raspberry pi =
3:&nbsp;uname -r&nbsp;5.10.17-v7+</font></div><div class=3D""><div =
class=3D""><font color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D""><br class=3D""></font></div><div class=3D""><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">I=E2=80=99ve =
followed the information&nbsp;<a =
href=3D"https://github.com/NetworkBlockDevice/nbd" =
class=3D"">here</a>&nbsp;[<a =
href=3D"https://github.com/NetworkBlockDevice/nbd" =
class=3D"">https://github.com/NetworkBlockDevice/nbd</a>] and a lot of =
other sites but I think I=E2=80=99m doing something wrong on the server =
setup because I get this on the client:</font></div><div class=3D""><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D""><br =
class=3D""></font></div><div class=3D""><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
color=3D"#628503" face=3D"Courier" class=3D""><span =
style=3D"background-color: rgb(246, 247, 249); font-size: 14px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">$</span><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D""> sudo mount /dev/nbd2 =
/home/pi/Vols/nbd1-recipes/</span></span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 14px;" class=3D"">mount: =
/home/pi/Vols/nbd1-recipes: <font color=3D"#ff000c" class=3D"">can't =
read superblock on /dev/nbd2</font></span></div></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 14px;" class=3D""><br =
class=3D""></span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><font color=3D"#2400bf" face=3D"Menlo" =
size=3D"2" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D"">Also it&nbsp;</span>appears to be =
listening on default port - NOT ones specified in&nbsp;config =
file.</font></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D""><font color=3D"#2400bf" face=3D"Menlo" =
size=3D"2" class=3D""><br class=3D""></font></span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D""><font color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D"">This is how I=E2=80=99ve set up the server &amp; client, =
it=E2=80=99s probably something obvious to more experienced =
folk.</font></span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 14px;" =
class=3D""><br class=3D""></span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><div =
style=3D"font-family: Courier; font-size: 14px; margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(12, 107, 255);" =
class=3D""><span style=3D"font-kerning: none; background-color: #f6f7f9" =
class=3D"">=3D=3D rpi-C3 (192.168.1.14) server setup</span></div><div =
style=3D"font-family: Courier; font-size: 14px; margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(98, 133, 3);" =
class=3D""><span style=3D"font-kerning: none; background-color: #f6f7f9" =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-kerning: none" class=3D"">&gt; =
sudo apt-get update</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span style=3D"font-kerning: =
none" class=3D"">&gt; sudo apt-get install =
nbd-server</span></div></span></div><div style=3D"font-family: Courier; =
font-size: 14px; margin: 0px; font-stretch: normal; line-height: normal; =
color: rgb(98, 133, 3);" class=3D""><span style=3D"font-kerning: none; =
background-color: #f6f7f9" class=3D"">&gt; sudo nano =
/etc/nbd-server/config&nbsp;</span></div><div style=3D"font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[generic]</span></div><div =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># If =
you want to run everything as root rather than the nbd user, =
you</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># may =
either say "root" in the two following lines, or remove =
them</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># =
altogether. Do not remove the [generic] section, =
however.</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; user =3D nbd</span></div><div style=3D"font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; group =3D =
nbd</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; includedir =3D =
/etc/nbd-server/conf.d</span></div><div style=3D"font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; allowlist =3D =
true</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal; min-height: =
13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># What =
follows are export definitions. You may create as much of them =
as</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># you =
want, but the section header has to be unique.</span></div><div =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[images]</span></div><div style=3D"font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; exportname =3D=
 /home/pi/media/500G_FAITH/images</span></div><div style=3D"font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; port =3D =
510029</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[recipes]</span></div><div style=3D"font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; exportname =3D=
 /home/pi/media/500G_FAITH/recipes</span></div><div style=3D"font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; port =3D =
510030</span></div><div style=3D"font-family: Menlo; font-size: 11px; =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[movie]</span></div><div style=3D"font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; exportname =3D=
 /home/pi/media/500G_FAITH/movies</span></div><div style=3D"font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; port =3D =
510031</span></div><div style=3D"font-family: Courier; font-size: 14px; =
margin: 0px; font-stretch: normal; line-height: normal; color: rgb(98, =
133, 3); background-color: rgb(246, 247, 249);" class=3D""><span =
style=3D"font-kerning: none" class=3D""><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-kerning: none" class=3D"">&gt; sudo modprobe nbd<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">				=
	</span></span><span style=3D"font-kerning: none; color: #fb000e" =
class=3D""># NOT nbd-server!</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"-webkit-font-kerning: none;" class=3D"">&gt; lsmod | grep =
nbd</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: Menlo; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #b42419" class=3D""><b class=3D"">nbd</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
40960&nbsp; 0</span></div></span></div><div style=3D"font-family: =
Courier; font-size: 14px; margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(98, 133, 3); background-color: rgb(246, =
247, 249);" class=3D""><span style=3D"font-kerning: none" class=3D"">&gt; =
sudo service nbd-server force-reload<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">			</span># if already =
running</span></div><div style=3D"font-family: Courier; font-size: 14px; =
margin: 0px; font-stretch: normal; line-height: normal; color: rgb(98, =
133, 3); background-color: rgb(246, 247, 249);" class=3D""><span =
style=3D"font-kerning: none" class=3D""><br class=3D""></span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"-webkit-font-kerning: none;" class=3D""><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Courier; =
font-size: 14px; color: rgb(251, 0, 157); margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"-webkit-font-kerning: none;" class=3D"">=3D=3D client =
side</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"-webkit-font-kerning: =
none;" class=3D""><div style=3D"background-color: rgb(246, 247, 249); =
font-family: Courier; font-size: 14px; color: rgb(98, 133, 3); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-kerning: none" class=3D"">&gt; sudo apt-get install =
nbd-client<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span># done</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Courier; font-size: 14px; color: rgb(98, 133, 3); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-kerning: none" class=3D"">&gt; sudo modprobe =
nbd</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"-webkit-font-kerning: =
none;" class=3D""><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 14px;" class=3D""><font color=3D"#628503" =
face=3D"Courier" class=3D"">&gt; nbd-client 192.168.1.14 =
-l</font></span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Negotiation: ..</span></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">images</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">recipes</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">movie</span></div></span></div></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Courier; =
font-size: 14px; color: rgb(98, 133, 3); margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"-webkit-font-kerning: none;" class=3D"">&gt; sudo nbd-client =
192.168.1.14 -N recipes /dev/nbd2</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D"">Negotiation: ..size =3D <font =
color=3D"#ff0011" class=3D"">0MB</font></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Connected /dev/nbd2</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Courier; =
font-size: 14px; color: rgb(98, 133, 3); margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"-webkit-font-kerning: none;" class=3D"">&gt; sudo nbd-client =
192.168.1.14 -N movie /dev/nbd3</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><font =
face=3D"Menlo" class=3D""><span style=3D"background-color: rgb(246, 247, =
249); font-size: 11px;" class=3D"">Negotiation: ..size =3D =
</span></font><font color=3D"#ff0011" face=3D"Menlo" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">0MB</span></font></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Connected /dev/nbd3</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Courier; =
font-size: 14px; color: rgb(98, 133, 3); margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"-webkit-font-kerning: none;" class=3D"">&gt; sudo nbd-client =
192.168.1.14 -N images /dev/nbd1</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><font =
face=3D"Menlo" class=3D""><span style=3D"background-color: rgb(246, 247, =
249); font-size: 11px;" class=3D"">Negotiation: ..size =3D =
</span></font><font color=3D"#ff0011" face=3D"Menlo" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">0MB</span></font></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Connected /dev/nbd1</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><br class=3D""></span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><font color=3D"#628503" face=3D"Courier" =
class=3D""><span style=3D"font-size: 14px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D"">&gt; =
dmesg | tail -n 10</span></span></font></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1417.883364] Buffer I/O error on dev =
nbd1, logical block 0, async page read</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1417.884614] block nbd1: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1417.884652] blk_update_request: I/O error, dev nbd1, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1417.884673] Buffer I/O error on dev =
nbd1, logical block 0, async page read</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1417.885977] block nbd1: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1417.886016] blk_update_request: I/O error, dev nbd1, sector 0 op =
0x0:(READ) flags 0x0 phys_seg 1 prio class 0</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1417.886036] Buffer I/O error on dev =
nbd1, logical block 0, async page read</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1417.887276] block nbd1: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1417.888492] block nbd1: Other side returned error (22)</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1417.889751] block nbd1: Other side =
returned error (22)</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font color=3D"#628503" =
face=3D"Courier" class=3D""><span style=3D"font-size: 14px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">&gt; sudo nbd-client 192.168.1.14 -d /dev/nbd1<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</span># =
thought it might be something to do w/ =
nbd1</span></span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font color=3D"#628503" =
face=3D"Courier" class=3D""><span style=3D"font-size: 14px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&gt; sudo nbd-client 192.168.1.14 -N images =
/dev/nbd4</span></span></font></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Negotiation: ..size =3D 0MB</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Connected /dev/nbd4</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font color=3D"#628503" face=3D"Courier" class=3D""><span =
style=3D"font-size: 14px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D"">&gt; =
dmesg | tail -n 10</span></span></font></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1848.831897] block nbd4: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1848.833341] block nbd4: Other side returned error (22)</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1848.834651] block nbd4: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1848.836002] block nbd4: Other side returned error (22)</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font color=3D"#628503" face=3D"Courier" class=3D""><span =
style=3D"font-size: 14px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D"">&gt; =
lsblk -f</span></span></font></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">NAME&nbsp; &nbsp; &nbsp; &nbsp; FSTYPE&nbsp; LABEL &nbsp; =
&nbsp; &nbsp; &nbsp; UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
FSAVAIL FSUSE% MOUNTPOINT</span></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">sda&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;</span></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">=E2=94=9C=E2=94=80sda1&nbsp; &nbsp; &nbsp; vfat&nbsp; &nbsp; =
EFI &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 67E3-17ED&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;</span></div><div style=3D"background-color: rgb(246, 247, 249); =
font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">=E2=94=94=E2=94=80sda2&nbsp; &nbsp; &nbsp; hfsplus =
time_box_2018 f6427a3d-363b-3284-88c4-03ce3493aeff&nbsp; 115.5G&nbsp; =
&nbsp; 94% /media/pi/time_box_2018</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">nbd2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">nbd3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">nbd4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">mmcblk0&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">=E2=94=9C=E2=94=80mmcblk0p1 vfat&nbsp; =
&nbsp; boot&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5DE4-665C &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 203.4M&nbsp; &nbsp; 19% /boot</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">=E2=94=94=E2=94=80mmcblk0p2 ext4&nbsp; =
&nbsp; rootfs&nbsp; &nbsp; &nbsp; &nbsp; =
7295bbc3-bbc2-4267-9fa0-099e10ef5bf0&nbsp; &nbsp; 4.1G&nbsp; &nbsp; 37% =
/</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><font color=3D"#628503" face=3D"Courier" =
class=3D""><span style=3D"font-size: 14px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D"">&gt; =
dmesg | tail -n 10</span></span></font></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1848.836002] block nbd4: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1848.837430] block nbd4: Other side returned error (22)</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1848.838860] block nbd4: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1848.840224] block nbd4: Other side returned error (22)</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1848.841691] block nbd4: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
1848.843077] block nbd4: Other side returned error (22)</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">[ 1848.844415] block nbd4: Other side =
returned error (22)</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
2802.615037] block nbd3: Receive control failed (result =
-32)</span></div><div style=3D"background-color: rgb(246, 247, 249); =
font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
2802.625871] block nbd2: Receive control failed (result =
-32)</span></div><div style=3D"background-color: rgb(246, 247, 249); =
font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">[ =
2802.648444] block nbd4: Receive control failed (result =
-32)</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><font color=3D"#628503" face=3D"Courier" =
class=3D""><span style=3D"font-size: 14px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D"">&gt; =
ls /home/pi/Vols/</span></span></font></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">nbd1-recipes/&nbsp; &nbsp; =
rpi-C2-nbd-500G/ tbx2018/ &nbsp; &nbsp; &nbsp; &nbsp; =
time_box_2018/&nbsp; &nbsp;</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
color=3D"#628503" face=3D"Courier" class=3D""><span style=3D"font-size: =
14px;" class=3D"">&gt; sudo mount /dev/nbd2 =
/home/pi/Vols/nbd1-recipes/</span></font></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D""><font face=3D"Menlo" class=3D""><span =
style=3D"background-color: rgb(246, 247, 249); font-size: 11px;" =
class=3D"">mount: /home/pi/Vols/nbd1-recipes: </span></font><font =
color=3D"#ff0011" face=3D"Menlo" class=3D""><span style=3D"font-size: =
11px;" class=3D"">can't read superblock on =
/dev/nbd2.</span></font></span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font color=3D"#628503" face=3D"Courier" class=3D""><span =
style=3D"font-size: 14px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D"">&gt; =
sudo parted -l</span></span></font></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Model: Seagate BUP Slim SL (scsi)</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Disk /dev/sda: 2000GB</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Sector size (logical/physical): =
512B/512B</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Partition=
 Table: gpt</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Disk =
Flags:&nbsp;</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Number&nbsp; Start &nbsp; End &nbsp; &nbsp; Size&nbsp; &nbsp; =
File system&nbsp; Name&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; Flags</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&nbsp;1&nbsp; &nbsp; &nbsp; 20.5kB&nbsp; 210MB &nbsp; 210MB =
&nbsp; fat32&nbsp; &nbsp; &nbsp; &nbsp; EFI System Partition&nbsp; boot, =
esp</span></div><div style=3D"background-color: rgb(246, 247, 249); =
font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&nbsp;2&nbsp; &nbsp; &nbsp; 210MB &nbsp; 2000GB&nbsp; =
2000GB&nbsp; hfs+ &nbsp; &nbsp; &nbsp; &nbsp; =
time_box_2018</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal; =
min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D""><font face=3D"Menlo" class=3D""><span =
style=3D"background-color: rgb(246, 247, 249); font-size: 11px;" =
class=3D"">Error: /dev/nbd3: </span></font><font color=3D"#ff000a" =
face=3D"Menlo" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">unrecognised disk label</span></font></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Model: Unknown (unknown) &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;</span></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Disk /dev/nbd3: 4096B</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Sector size (logical/physical): =
512B/512B</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Partition=
 Table: unknown</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Disk =
Flags:&nbsp;</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D"">Error: =
/dev/nbd4: <font color=3D"#ff000a" class=3D"">unrecognised disk =
label</font></span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Model: =
Unknown (unknown) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Disk /dev/nbd4: 4096B</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Sector size (logical/physical): =
512B/512B</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Partition=
 Table: unknown</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Disk =
Flags:&nbsp;</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><font =
face=3D"Menlo" class=3D""><span style=3D"background-color: rgb(246, 247, =
249); font-size: 11px;" class=3D"">Error: /dev/nbd2: </span></font><font =
color=3D"#ff000a" face=3D"Menlo" class=3D""><span style=3D"font-size: =
11px;" class=3D"">unrecognised disk label</span></font></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Model: Unknown (unknown) &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;</span></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Disk /dev/nbd2: 4096B</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Sector size (logical/physical): =
512B/512B</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Partition=
 Table: unknown</span></div><div style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
margin: 0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Disk =
Flags:&nbsp;</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Model: SD SL08G (sd/mmc)</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Disk /dev/mmcblk0: =
7948MB</span></div><div style=3D"background-color: rgb(246, 247, 249); =
font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Sector =
size (logical/physical): 512B/512B</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Partition Table: msdos</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">Disk Flags:&nbsp;</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">Number&nbsp; Start &nbsp; End &nbsp; &nbsp; Size&nbsp; &nbsp; =
Type &nbsp; &nbsp; File system&nbsp; Flags</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0); margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&nbsp;1&nbsp; &nbsp; &nbsp; 4194kB&nbsp; =
273MB &nbsp; 268MB &nbsp; primary&nbsp; fat32&nbsp; &nbsp; &nbsp; &nbsp; =
lba</span></div><div style=3D"background-color: rgb(246, 247, 249); =
font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&nbsp;2&nbsp; &nbsp; &nbsp; 273MB &nbsp; 7948MB&nbsp; =
7676MB&nbsp; primary&nbsp; ext4</span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><font =
color=3D"#2400bf" class=3D"">I=E2=80=99ve been trying to get them to =
talk for 2 days now&nbsp;</font></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><font color=3D"#2400bf" class=3D"">One =
thing I did notice is that the port numbers in the config file don=E2=80=99=
t seem to change the fact it=E2=80=99s listening on he default =
port??</font></span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; color: rgb(0, 0, 0); font-size: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><br class=3D""></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font color=3D"#628503" face=3D"Courier" class=3D""><span =
style=3D"font-size: 14px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">$</span><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D""> sudo lsof -i -P -n | grep =
LISTEN</span></span></font></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">COMMAND&nbsp; &nbsp; PID&nbsp; &nbsp; USER &nbsp; FD &nbsp; =
TYPE DEVICE SIZE/OFF NODE NAME</span></div><div style=3D"background-color:=
 rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0); margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">cnid_meta&nbsp; 312&nbsp; &nbsp; root&nbsp; &nbsp; 3u&nbsp; =
IPv6&nbsp; 11170&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP [::1]:4700 =
(</span><span style=3D"font-variant-ligatures: no-common-ligatures; =
color: #b42419" class=3D""><b class=3D"">LISTEN</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">)</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">afpd =
&nbsp; &nbsp; &nbsp; 324&nbsp; &nbsp; root&nbsp; &nbsp; 3u&nbsp; =
IPv4&nbsp; 11195&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:548 (</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #b42419" =
class=3D""><b class=3D"">LISTEN</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">)</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">sshd =
&nbsp; &nbsp; &nbsp; 426&nbsp; &nbsp; root&nbsp; &nbsp; 3u&nbsp; =
IPv4&nbsp; 12126&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:22 (</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #b42419" =
class=3D""><b class=3D"">LISTEN</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">)</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">sshd =
&nbsp; &nbsp; &nbsp; 426&nbsp; &nbsp; root&nbsp; &nbsp; 4u&nbsp; =
IPv6&nbsp; 12128&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:22 (</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #b42419" =
class=3D""><b class=3D"">LISTEN</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">)</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">dnsmasq&nbsp; &nbsp; 431 dnsmasq&nbsp; &nbsp; 5u&nbsp; =
IPv4&nbsp; 12046&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:53 (</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #b42419" =
class=3D""><b class=3D"">LISTEN</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">)</span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">dnsmasq&nbsp; &nbsp; 431 dnsmasq&nbsp; &nbsp; 7u&nbsp; =
IPv6&nbsp; 12048&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:53 (</span><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #b42419" =
class=3D""><b class=3D"">LISTEN</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">)</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><font =
face=3D"Menlo" class=3D""><font color=3D"#ff000a" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">nbd-serve</span></font><span =
style=3D"background-color: rgb(246, 247, 249); font-size: 11px;" =
class=3D""> 2026 &nbsp; &nbsp; nbd&nbsp; &nbsp; 3u&nbsp; IPv6&nbsp; =
20100&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:</span></font><font =
color=3D"#ff000a" face=3D"Menlo" class=3D""><span style=3D"font-size: =
11px;" class=3D"">10809</span></font><font face=3D"Menlo" class=3D""><span=
 style=3D"background-color: rgb(246, 247, 249); font-size: 11px;" =
class=3D""> (</span></font></span><span style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(180, =
36, 25); font-variant-ligatures: no-common-ligatures;" class=3D""><b =
class=3D"">LISTEN</b></span><span style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, 0, 0); =
font-variant-ligatures: no-common-ligatures;" =
class=3D"">)</span></div></span></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; color: rgb(0, 0, 0); font-size: =
13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><br class=3D""></span></div><div =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D""><span style=3D"caret-color: rgb(0, 102, 255);" class=3D""><font=
 color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">I=E2=80=99d be =
very&nbsp;grateful for any pointers, or other resources that my be of =
help.</font></span></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><span =
style=3D"caret-color: rgb(0, 102, 255);" class=3D""><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">Thanks in =
advance,</font></span></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" class=3D""><span =
style=3D"caret-color: rgb(0, 102, 255);" class=3D""><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D"">Simon</font></span></span></div><div style=3D"background-color:=
 rgb(246, 247, 249); font-family: Menlo; color: rgb(0, 0, 0); font-size: =
13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><br class=3D""></span></div><div =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
color: rgb(0, 0, 0); font-size: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; color: rgb(0, 0, 0); font-size: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><br class=3D""></span></div><div style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; color: rgb(0, =
0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><br =
class=3D""></span></div></span></div></span></div></span></div></span></di=
v></span></div></div></div></body></html>=

--Apple-Mail=_0A975B78-DD15-4D7D-A239-42C3051C3885--

