Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF03D262D
	for <lists+nbd@lfdr.de>; Thu, 22 Jul 2021 16:50:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1AFA6206A8; Thu, 22 Jul 2021 14:50:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 22 14:50:03 2021
Old-Return-Path: <fernandez.simon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 665AD206A4
	for <lists-other-nbd@bendel.debian.org>; Thu, 22 Jul 2021 14:49:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, HTML_MESSAGE=2, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id x29bmNDnU9Rx for <lists-other-nbd@bendel.debian.org>;
	Thu, 22 Jul 2021 14:49:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-wm1-x32c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 12EB6206A3
	for <nbd@other.debian.org>; Thu, 22 Jul 2021 14:49:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o3-20020a05600c5103b029024c0f9e1a5fso1461537wms.4
        for <nbd@other.debian.org>; Thu, 22 Jul 2021 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:mime-version:subject:message-id:date:to;
        bh=lFzsA8OJPDfR69fONegLDO5xPZ9bnOjqj5gyJRoJ/rU=;
        b=VVKK3HwHH2RBizmR7e3tuC1ePVEKFQeg3YtajrC26yjepTMTBeC9v+nTjKCVl9GKpx
         D/KUVv8ZvnwpXMuOt6AFAqKGKdrF9xTu7R7htVnayDR0bQed+8ADwoQjrPRjdpHkOmOz
         m9B/BnoRalLThI+mWITkY0hi1HQMZLePRZVCEj58sq0D5ZUEKEFfy03x8tecGWOVvOSc
         YtK47f7piZqJ71CE9GyW2bGBxq7WR1D1DrjtJp/MzAPOQpEshgXJ94yUaliy/vYJEBP8
         bgDSXV1OfeisCjkA3AN4OghPdPQx3Ci5o2eis4EDZ4ggJzmrBoMlnJLzp+q3Rl8WYf4v
         waew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
        bh=lFzsA8OJPDfR69fONegLDO5xPZ9bnOjqj5gyJRoJ/rU=;
        b=TQNAablYBvk3fA8M8UkVujRy2BKcOYjk5xNT2frnC4JCdl6R2HKv1aqWEni+5AQWdY
         w6IIwavAVPSMeLWZVF5mmRlUu6AWUStH6FGK365HHXfoQyVHzrQf1iiNNuvN2OQVsOPs
         Dm+BiaxqhTKrGuH+sGku4kYiwZ+5Lv/E17uaaRechMaRUtxfKE7gsZAiquaai716JILY
         3Dfjp60T9We7Yq3t6j4tE+3z6qT8l6+mYr0G/TAGqih5KmnwDbIHaAliWmMm6iuGlFs9
         lmW7pOjpU/nmApltLvzBMNenRqswzOWCQgocEPgND2ifjKO79213NquAXkWBASUogssA
         PdCA==
X-Gm-Message-State: AOAM533GQfbdon8f2BUaCu5sftMh97Jv6q2inFoJcXIX/48MFTW3Jrx2
	oa3/KJU5jOjqn4sYSSfNGrfU9Jj7iEk=
X-Google-Smtp-Source: ABdhPJx4wh7BD/UrCr+dD9HwgSBxvx5PZhofhHa+QTi+NxfOpmZJQL0kG/DrUW2rvhZhkrO593htAg==
X-Received: by 2002:a1c:6a18:: with SMTP id f24mr9518555wmc.10.1626965385233;
        Thu, 22 Jul 2021 07:49:45 -0700 (PDT)
Received: from simons-mbp.lan (51.4.200.146.dyn.plus.net. [146.200.4.51])
        by smtp.gmail.com with ESMTPSA id a12sm30673331wrh.26.2021.07.22.07.49.44
        for <nbd@other.debian.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jul 2021 07:49:44 -0700 (PDT)
From: Simon Fernandez <fernandez.simon@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_65AD2B86-EB33-4EAB-AE0C-4EF18FE05207"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: block nbd4: Other side returned error (22) - issue setting up NBD
 server / client
Message-Id: <77E3BFC1-8D5E-4441-A8FF-2A8DABC54312@gmail.com>
Date: Thu, 22 Jul 2021 15:49:43 +0100
To: nbd@other.debian.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cdnIYNkrhpJ.A.sLC.bWY-gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1224
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/77E3BFC1-8D5E-4441-A8FF-2A8DABC54312@gmail.com
Resent-Date: Thu, 22 Jul 2021 14:50:03 +0000 (UTC)


--Apple-Mail=_65AD2B86-EB33-4EAB-AE0C-4EF18FE05207
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi folks,
I=E2=80=99m trying setup a client that connect to a 500Gb ext4 disk on =
another machine
running nbd server.
Server: raspberry pi 3: uname -r 4.19.66+
Client: raspberry pi 3: uname -r 5.10.17-v7+

I=E2=80=99ve followed the information here =
[https://github.com/NetworkBlockDevice/nbd]
and a lot of other sites

$ sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2

Also it appears to be listening on default port - NOT ones specified in =
config
file.

This is how I=E2=80=99ve set up the server & client, it=E2=80=99s =
probably something obvious
to more experienced folk.

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

> sudo modprobe nbd			# NOT nbd-server!
> lsmod | grep nbd
nbd                    40960  0

> sudo service nbd-server force-reload	# if already running

=3D=3D client side
> sudo apt-get install nbd-client=09
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

> sudo nbd-client 192.168.1.14 -d /dev/nbd1	# thought it might be to =
do w/ nbd1
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
don=E2=80=99t seem
to change the fact it=E2=80=99s listening on he default port (10809)??

> sudo lsof -i -P -n | grep LISTEN
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
Simon=

--Apple-Mail=_65AD2B86-EB33-4EAB-AE0C-4EF18FE05207
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><font=
 color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">Hi =
folks,</font><div class=3D""><font color=3D"#2400bf" face=3D"Menlo" =
size=3D"2" class=3D"">I=E2=80=99m trying setup a client that connect to =
a 500Gb ext4 disk on another machine</font></div><div class=3D""><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">running nbd =
server.</font><div class=3D""><font color=3D"#2400bf" face=3D"Menlo" =
size=3D"2" class=3D"">Server:&nbsp;raspberry pi 3:&nbsp;uname =
-r&nbsp;4.19.66+</font></div><div class=3D""><font color=3D"#2400bf" =
face=3D"Menlo" size=3D"2" class=3D"">Client:&nbsp;raspberry pi =
3:&nbsp;uname -r&nbsp;5.10.17-v7+</font></div><div class=3D""><div =
class=3D""><font color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D""><br class=3D""></font></div><div class=3D""><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D""><span =
style=3D"caret-color: rgb(36, 0, 191);" class=3D"">I=E2=80=99ve followed =
the information here [<a =
href=3D"https://github.com/NetworkBlockDevice/nbd" =
class=3D"">https://github.com/NetworkBlockDevice/nbd</a>]</span></font></d=
iv><div class=3D""><font color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D""><span style=3D"caret-color: rgb(36, 0, 191);" class=3D"">and =
a lot of other sites</span></font></div><div class=3D""><br =
class=3D""></div><div class=3D""><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">$</span><span =
class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&nbsp;sudo mount /dev/nbd2 =
/home/pi/Vols/nbd1-recipes/</span></span></font></div><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: Menlo;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 14px;">mount: =
/home/pi/Vols/nbd1-recipes:&nbsp;<font color=3D"#ff000c" class=3D"">can't =
read superblock on /dev/nbd2</font></span></div></div><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: Menlo;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 14px;"><br class=3D""></span></div><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><font color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D""><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Also it&nbsp;</span>appears to be listening on =
default port - NOT ones specified in&nbsp;config</font></div><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><font color=3D"#2400bf" face=3D"Menlo" size=3D"2" =
class=3D"">file.</font></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D""><br =
class=3D""></font></span></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">This is how =
I=E2=80=99ve set up the server &amp; client, it=E2=80=99s probably =
something obvious</font></span></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">to more =
experienced folk.</font></span></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal; font-family: =
Menlo;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 14px;"><br class=3D""></span></div><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><div class=3D"" style=3D"font-family: Courier; =
font-size: 14px; margin: 0px; font-stretch: normal; line-height: normal; =
color: rgb(12, 107, 255);"><span class=3D"" style=3D"-webkit-font-kerning:=
 none; background-color: rgb(246, 247, 249);">=3D=3D rpi-C3 =
(192.168.1.14) server setup</span></div><div class=3D"" =
style=3D"font-family: Courier; font-size: 14px; margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(98, 133, =
3);"><span class=3D"" style=3D"-webkit-font-kerning: none; =
background-color: rgb(246, 247, 249);"><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; sudo apt-get =
update</span></div><div class=3D"" style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; sudo apt-get install =
nbd-server</span></div></span></div><div class=3D"" style=3D"font-family: =
Courier; font-size: 14px; margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(98, 133, 3);"><span class=3D"" =
style=3D"-webkit-font-kerning: none; background-color: rgb(246, 247, =
249);">&gt; sudo nano /etc/nbd-server/config&nbsp;</span></div><div =
class=3D"" style=3D"font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">[generic]</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"># If you want to =
run everything as root rather than the nbd user, you</span></div><div =
class=3D"" style=3D"font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"># may either say =
"root" in the two following lines, or remove them</span></div><div =
class=3D"" style=3D"font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"># altogether. Do =
not remove the [generic] section, however.</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; user =3D nbd</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; group =3D nbd</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; includedir =3D /etc/nbd-server/conf.d</span></div><div =
class=3D"" style=3D"font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; allowlist =3D true</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal; min-height: 13px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"></span><br =
class=3D""></div><div class=3D"" style=3D"font-family: Menlo; font-size: =
11px; margin: 0px; font-stretch: normal; line-height: normal;"><span =
class=3D"" style=3D"font-variant-ligatures: no-common-ligatures;"># What =
follows are export definitions. You may create as much of them =
as</span></div><div class=3D"" style=3D"font-family: Menlo; font-size: =
11px; margin: 0px; font-stretch: normal; line-height: normal;"><span =
class=3D"" style=3D"font-variant-ligatures: no-common-ligatures;"># you =
want, but the section header has to be unique.</span></div><div class=3D""=
 style=3D"font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">[images]</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; exportname =3D =
/home/pi/media/500G_FAITH/images</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; port =3D 510029</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">[recipes]</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; exportname =3D =
/home/pi/media/500G_FAITH/recipes</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; port =3D 510030</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">[movie]</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; exportname =3D =
/home/pi/media/500G_FAITH/movies</span></div><div class=3D"" =
style=3D"font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp; &nbsp; =
&nbsp; &nbsp; port =3D 510031</span></div><div class=3D"" =
style=3D"font-family: Courier; font-size: 14px; margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(98, 133, 3); =
background-color: rgb(246, 247, 249);"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><br class=3D""></span></div><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"-webkit-font-kerning: none;">&gt; =
sudo modprobe nbd<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">			</span></span><span class=3D"" =
style=3D"-webkit-font-kerning: none; color: rgb(251, 0, 14);"># NOT =
nbd-server!</span></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; lsmod | grep =
nbd</span></div><div class=3D"" style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: Menlo; color: rgb(0, 0, =
0);"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures; color: rgb(180, 36, 25);"><b =
class=3D"">nbd</b></span><span class=3D"" style=3D"font-variant-ligatures:=
 no-common-ligatures;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; 40960&nbsp; 0</span></div></span></div><div =
class=3D"" style=3D"font-family: Courier; font-size: 14px; margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(98, 133, 3); =
background-color: rgb(246, 247, 249);"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><br class=3D""></span></div><div =
class=3D"" style=3D"font-family: Courier; font-size: 14px; margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(98, 133, 3); =
background-color: rgb(246, 247, 249);"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; sudo service nbd-server =
force-reload<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span># if already running</span></div><div class=3D"" =
style=3D"font-family: Courier; font-size: 14px; margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(98, 133, 3); =
background-color: rgb(246, 247, 249);"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><br class=3D""></span></div><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"-webkit-font-kerning: none;"><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Courier; font-size: 14px; color: rgb(251, 0, 157); margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">=3D=3D client =
side</span></div><div class=3D"" style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Courier; =
font-size: 14px; color: rgb(98, 133, 3); margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; sudo apt-get install =
nbd-client<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span></span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Courier; font-size: 14px; color: rgb(98, 133, =
3); margin: 0px; font-stretch: normal; line-height: normal;"><span =
class=3D"" style=3D"-webkit-font-kerning: none;">&gt; sudo modprobe =
nbd</span></div><div class=3D"" style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: =
14px;"><font color=3D"#628503" face=3D"Courier" class=3D"">&gt; =
nbd-client 192.168.1.14 -l</font></span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Negotiation: ..</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">images</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">recipes</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">movie</span></div></span></div></span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Courier; font-size: 14px; color: rgb(98, 133, 3); margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><br class=3D""></span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Courier; font-size: 14px; color: rgb(98, 133, 3); margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; sudo nbd-client 192.168.1.14 =
-N recipes /dev/nbd2</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Negotiation: ..size =3D&nbsp;<font color=3D"#ff0011"=
 class=3D"">0MB</font></span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Connected /dev/nbd2</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Courier; =
font-size: 14px; color: rgb(98, 133, 3); margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><br class=3D""></span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Courier; font-size: 14px; color: rgb(98, 133, 3); margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; sudo nbd-client 192.168.1.14 =
-N movie /dev/nbd3</span></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><font =
face=3D"Menlo" class=3D""><span class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-size: 11px;">Negotiation: ..size =
=3D&nbsp;</span></font><font color=3D"#ff0011" face=3D"Menlo" =
class=3D""><span class=3D"" style=3D"font-size: =
11px;">0MB</span></font></span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Connected /dev/nbd3</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Courier; =
font-size: 14px; color: rgb(98, 133, 3); margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;"><br class=3D""></span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Courier; font-size: 14px; color: rgb(98, 133, 3); margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"-webkit-font-kerning: none;">&gt; sudo nbd-client 192.168.1.14 =
-N images /dev/nbd1</span></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><font =
face=3D"Menlo" class=3D""><span class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-size: 11px;">Negotiation: ..size =
=3D&nbsp;</span></font><font color=3D"#ff0011" face=3D"Menlo" =
class=3D""><span class=3D"" style=3D"font-size: =
11px;">0MB</span></font></span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Connected /dev/nbd1</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><br class=3D""></span></div><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span =
class=3D"" style=3D"font-variant-ligatures: no-common-ligatures;"><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><font color=3D"#628503" face=3D"Courier" class=3D""><span =
class=3D"" style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&gt; dmesg | tail =
-n 10</span></span></font></div><div class=3D"" style=3D"background-color:=
 rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1417.883364] =
Buffer I/O error on dev nbd1, logical block 0, async page =
read</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1417.884614] =
block nbd1: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1417.884652] blk_update_request: I/O error, dev =
nbd1, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class =
0</span></div><div class=3D"" style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1417.884673] =
Buffer I/O error on dev nbd1, logical block 0, async page =
read</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1417.885977] =
block nbd1: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1417.886016] blk_update_request: I/O error, dev =
nbd1, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class =
0</span></div><div class=3D"" style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1417.886036] =
Buffer I/O error on dev nbd1, logical block 0, async page =
read</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1417.887276] =
block nbd1: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1417.888492] block nbd1: Other side returned =
error (22)</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1417.889751] =
block nbd1: Other side returned error (22)</span></div><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><font =
color=3D"#628503" face=3D"Courier" class=3D""><span class=3D"" =
style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><br =
class=3D""></span></span></font></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&gt; sudo nbd-client 192.168.1.14 -d =
/dev/nbd1<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span># thought it might be to do w/ =
nbd1</span></span></font></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&gt; sudo nbd-client 192.168.1.14 -N images =
/dev/nbd4</span></span></font></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Negotiation: ..size =3D 0MB</span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Connected /dev/nbd4</span></div><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><font =
color=3D"#628503" face=3D"Courier" class=3D""><span class=3D"" =
style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><br =
class=3D""></span></span></font></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&gt; dmesg | tail -n =
10</span></span></font></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1848.831897] =
block nbd4: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1848.833341] block nbd4: Other side returned =
error (22)</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1848.834651] =
block nbd4: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1848.836002] block nbd4: Other side returned =
error (22)</span></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><br class=3D""></span></span></font></div><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><font color=3D"#628503" face=3D"Courier" class=3D""><span =
class=3D"" style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&gt; lsblk =
-f</span></span></font></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">NAME&nbsp; &nbsp; =
&nbsp; &nbsp; FSTYPE&nbsp; LABEL &nbsp; &nbsp; &nbsp; &nbsp; UUID &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FSAVAIL FSUSE% =
MOUNTPOINT</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">sda&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">=E2=94=9C=E2=94=80s=
da1&nbsp; &nbsp; &nbsp; vfat&nbsp; &nbsp; EFI &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 67E3-17ED&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">=E2=94=94=E2=94=80sda2&nbsp; &nbsp; &nbsp; hfsplus =
time_box_2018 f6427a3d-363b-3284-88c4-03ce3493aeff&nbsp; 115.5G&nbsp; =
&nbsp; 94% /media/pi/time_box_2018</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">nbd2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">nbd3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">nbd4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">mmcblk0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">=E2=94=9C=E2=94=80mmcblk0p1 vfat&nbsp; &nbsp; =
boot&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5DE4-665C &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 203.4M&nbsp; &nbsp; 19% /boot</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">=E2=94=94=E2=94=80mmcblk0p2 ext4&nbsp; &nbsp; =
rootfs&nbsp; &nbsp; &nbsp; &nbsp; =
7295bbc3-bbc2-4267-9fa0-099e10ef5bf0&nbsp; &nbsp; 4.1G&nbsp; &nbsp; 37% =
/</span></div><div class=3D"" style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;"><font color=3D"#628503" face=3D"Courier" =
class=3D""><span class=3D"" style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><br =
class=3D""></span></span></font></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&gt; dmesg | tail -n =
10</span></span></font></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1848.836002] =
block nbd4: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1848.837430] block nbd4: Other side returned =
error (22)</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1848.838860] =
block nbd4: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1848.840224] block nbd4: Other side returned =
error (22)</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1848.841691] =
block nbd4: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 1848.843077] block nbd4: Other side returned =
error (22)</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 1848.844415] =
block nbd4: Other side returned error (22)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 2802.615037] block nbd3: Receive control failed =
(result -32)</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">[ 2802.625871] =
block nbd2: Receive control failed (result -32)</span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">[ 2802.648444] block nbd4: Receive control failed =
(result -32)</span></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><br class=3D""></span></span></font></div><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><font color=3D"#628503" face=3D"Courier" class=3D""><span =
class=3D"" style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&gt; ls =
/home/pi/Vols/</span></span></font></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">nbd1-recipes/&nbsp; &nbsp; rpi-C2-nbd-500G/ =
tbx2018/ &nbsp; &nbsp; &nbsp; &nbsp; time_box_2018/&nbsp; =
&nbsp;</span></div><div class=3D"" style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;"><font color=3D"#628503" face=3D"Courier" =
class=3D""><span class=3D"" style=3D"font-size: 14px;"><br =
class=3D""></span></font></div><div class=3D"" style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;">&gt; sudo mount /dev/nbd2 =
/home/pi/Vols/nbd1-recipes/</span></font></div><div class=3D""><span =
class=3D"" style=3D"font-variant-ligatures: no-common-ligatures;"><div =
class=3D"" style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><font face=3D"Menlo" class=3D""><span class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-size: 11px;">mount: =
/home/pi/Vols/nbd1-recipes:&nbsp;</span></font><font color=3D"#ff0011" =
face=3D"Menlo" class=3D""><span class=3D"" style=3D"font-size: =
11px;">can't read superblock on =
/dev/nbd2.</span></font></span></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><font =
color=3D"#628503" face=3D"Courier" class=3D""><span class=3D"" =
style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><br =
class=3D""></span></span></font></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><font color=3D"#628503" =
face=3D"Courier" class=3D""><span class=3D"" style=3D"font-size: =
14px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&gt; sudo parted -l</span></span></font></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Model: Seagate BUP Slim SL (scsi)</span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Disk /dev/sda: 2000GB</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Sector size (logical/physical): =
512B/512B</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Partition Table: =
gpt</span></div><div class=3D"" style=3D"background-color: rgb(246, 247, =
249); font-family: Menlo; font-size: 11px; margin: 0px; font-stretch: =
normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Disk =
Flags:&nbsp;</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal; min-height: 13px;"><span =
class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"></span><br class=3D""></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Number&nbsp; Start &nbsp; End &nbsp; &nbsp; =
Size&nbsp; &nbsp; File system&nbsp; Name&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Flags</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&nbsp;1&nbsp; &nbsp; &nbsp; 20.5kB&nbsp; 210MB =
&nbsp; 210MB &nbsp; fat32&nbsp; &nbsp; &nbsp; &nbsp; EFI System =
Partition&nbsp; boot, esp</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&nbsp;2&nbsp; &nbsp; &nbsp; 210MB &nbsp; =
2000GB&nbsp; 2000GB&nbsp; hfs+ &nbsp; &nbsp; &nbsp; &nbsp; =
time_box_2018</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal; min-height: 13px;"><span =
class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"></span><br class=3D""></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: normal; =
min-height: 13px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"></span><br class=3D""></div><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span =
class=3D"" style=3D"font-variant-ligatures: no-common-ligatures;"><font =
face=3D"Menlo" class=3D""><span class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-size: 11px;">Error: =
/dev/nbd3:&nbsp;</span></font><font color=3D"#ff000a" face=3D"Menlo" =
class=3D""><span class=3D"" style=3D"font-size: 11px;">unrecognised disk =
label</span></font></span></div><div class=3D"" style=3D"background-color:=
 rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Model: Unknown =
(unknown) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Disk /dev/nbd3: 4096B</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Sector size (logical/physical): =
512B/512B</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Partition Table: =
unknown</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Disk =
Flags:&nbsp;</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal; min-height: 13px;"><span =
class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"></span><br class=3D""></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Error: /dev/nbd4:&nbsp;<font color=3D"#ff000a" =
class=3D"">unrecognised disk label</font></span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Model: Unknown (unknown) &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Disk /dev/nbd4: =
4096B</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Sector size =
(logical/physical): 512B/512B</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Partition Table: unknown</span></div><div class=3D""=
 style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Disk Flags:&nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: normal; =
min-height: 13px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"></span><br class=3D""></div><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span =
class=3D"" style=3D"font-variant-ligatures: no-common-ligatures;"><font =
face=3D"Menlo" class=3D""><span class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-size: 11px;">Error: =
/dev/nbd2:&nbsp;</span></font><font color=3D"#ff000a" face=3D"Menlo" =
class=3D""><span class=3D"" style=3D"font-size: 11px;">unrecognised disk =
label</span></font></span></div><div class=3D"" style=3D"background-color:=
 rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Model: Unknown =
(unknown) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Disk /dev/nbd2: 4096B</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Sector size (logical/physical): =
512B/512B</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Partition Table: =
unknown</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Disk =
Flags:&nbsp;</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal; min-height: 13px;"><span =
class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"></span><br class=3D""></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Model: SD SL08G (sd/mmc)</span></div><div class=3D""=
 style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Disk /dev/mmcblk0: 7948MB</span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Menlo; font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Sector size (logical/physical): =
512B/512B</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Partition Table: =
msdos</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">Disk =
Flags:&nbsp;</span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal; min-height: 13px;"><span =
class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"></span><br class=3D""></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">Number&nbsp; Start &nbsp; End &nbsp; &nbsp; =
Size&nbsp; &nbsp; Type &nbsp; &nbsp; File system&nbsp; =
Flags</span></div><div class=3D"" style=3D"background-color: rgb(246, =
247, 249); font-family: Menlo; font-size: 11px; margin: 0px; =
font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp;1&nbsp; =
&nbsp; &nbsp; 4194kB&nbsp; 273MB &nbsp; 268MB &nbsp; primary&nbsp; =
fat32&nbsp; &nbsp; &nbsp; &nbsp; lba</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">&nbsp;2&nbsp; &nbsp; &nbsp; 273MB &nbsp; =
7948MB&nbsp; 7676MB&nbsp; primary&nbsp; ext4</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><br class=3D""></span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 13px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><font color=3D"#2400bf" class=3D"">I=E2=80=99ve =
been trying to get them to talk for 2 days =
now&nbsp;</font></span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 13px;"><span class=3D""=
 style=3D"font-variant-ligatures: no-common-ligatures;"><font =
color=3D"#2400bf" class=3D"">One thing I did notice is that the port =
numbers in the config file don=E2=80=99t seem</font></span></div><div =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-family: =
Menlo; font-size: 13px;"><span class=3D"" style=3D"font-variant-ligatures:=
 no-common-ligatures;"><font color=3D"#2400bf" class=3D"">to change the =
fact it=E2=80=99s listening on he default port =
(10809)??</font></span></div><div class=3D"" style=3D"background-color: =
rgb(246, 247, 249); font-family: Menlo; font-size: 13px;"><span class=3D""=
 style=3D"font-variant-ligatures: no-common-ligatures;"><br =
class=3D""></span></div><div class=3D""><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><div class=3D"" =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><font =
color=3D"#628503" face=3D"Courier" class=3D""><span class=3D"" =
style=3D"font-size: 14px;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;">&gt;&nbsp;sudo =
lsof -i -P -n | grep LISTEN</span></span></font></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">COMMAND&nbsp; &nbsp; PID&nbsp; &nbsp; USER &nbsp; =
FD &nbsp; TYPE DEVICE SIZE/OFF NODE NAME</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">cnid_meta&nbsp; 312&nbsp; &nbsp; root&nbsp; &nbsp; =
3u&nbsp; IPv6&nbsp; 11170&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP [::1]:4700 =
(</span><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures; color: rgb(180, 36, 25);"><b =
class=3D"">LISTEN</b></span><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">afpd &nbsp; &nbsp; &nbsp; 324&nbsp; &nbsp; =
root&nbsp; &nbsp; 3u&nbsp; IPv4&nbsp; 11195&nbsp; &nbsp; &nbsp; =
0t0&nbsp; TCP *:548 (</span><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures; color: rgb(180, =
36, 25);"><b class=3D"">LISTEN</b></span><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">sshd &nbsp; &nbsp; &nbsp; 426&nbsp; &nbsp; =
root&nbsp; &nbsp; 3u&nbsp; IPv4&nbsp; 12126&nbsp; &nbsp; &nbsp; =
0t0&nbsp; TCP *:22 (</span><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures; color: rgb(180, =
36, 25);"><b class=3D"">LISTEN</b></span><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">sshd &nbsp; &nbsp; &nbsp; 426&nbsp; &nbsp; =
root&nbsp; &nbsp; 4u&nbsp; IPv6&nbsp; 12128&nbsp; &nbsp; &nbsp; =
0t0&nbsp; TCP *:22 (</span><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures; color: rgb(180, =
36, 25);"><b class=3D"">LISTEN</b></span><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">dnsmasq&nbsp; &nbsp; 431 dnsmasq&nbsp; &nbsp; =
5u&nbsp; IPv4&nbsp; 12046&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:53 =
(</span><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures; color: rgb(180, 36, 25);"><b =
class=3D"">LISTEN</b></span><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">)</span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; margin: 0px; font-stretch: normal; line-height: =
normal;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;">dnsmasq&nbsp; &nbsp; 431 dnsmasq&nbsp; &nbsp; =
7u&nbsp; IPv6&nbsp; 12048&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:53 =
(</span><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures; color: rgb(180, 36, 25);"><b =
class=3D"">LISTEN</b></span><span class=3D"" =
style=3D"font-variant-ligatures: =
no-common-ligatures;">)</span></div><div class=3D"" style=3D"margin: =
0px; font-stretch: normal; line-height: normal;"><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><font =
face=3D"Menlo" class=3D""><font color=3D"#ff000a" class=3D""><span =
class=3D"" style=3D"font-size: 11px;">nbd-serve</span></font><span =
class=3D"" style=3D"background-color: rgb(246, 247, 249); font-size: =
11px;">&nbsp;2026 &nbsp; &nbsp; nbd&nbsp; &nbsp; 3u&nbsp; IPv6&nbsp; =
20100&nbsp; &nbsp; &nbsp; 0t0&nbsp; TCP *:</span></font><font =
color=3D"#ff000a" face=3D"Menlo" class=3D""><span class=3D"" =
style=3D"font-size: 11px;">10809</span></font><font face=3D"Menlo" =
class=3D""><span class=3D"" style=3D"background-color: rgb(246, 247, =
249); font-size: 11px;">&nbsp;(</span></font></span><span class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; color: rgb(180, 36, 25); font-variant-ligatures: =
no-common-ligatures;"><b class=3D"">LISTEN</b></span><span class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 11px; font-variant-ligatures: =
no-common-ligatures;">)</span></div></span></div><div class=3D"" =
style=3D"background-color: rgb(246, 247, 249); font-family: Menlo; =
font-size: 13px;"><span class=3D"" style=3D"font-variant-ligatures: =
no-common-ligatures;"><br class=3D""></span></div><div class=3D""><span =
class=3D"" style=3D"font-variant-ligatures: no-common-ligatures;"><span =
class=3D"" style=3D"caret-color: rgb(0, 102, 255);"><font =
color=3D"#2400bf" face=3D"Menlo" size=3D"2" class=3D"">I=E2=80=99d be =
very&nbsp;grateful for any pointers, or other resources that my be of =
help.</font></span></span></div><div class=3D""><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><span class=3D"" =
style=3D"caret-color: rgb(0, 102, 255);"><font color=3D"#2400bf" =
face=3D"Menlo" size=3D"2" class=3D"">Thanks in =
advance,</font></span></span></div><div class=3D""><span class=3D"" =
style=3D"font-variant-ligatures: no-common-ligatures;"><span class=3D"" =
style=3D"caret-color: rgb(0, 102, 255);"><font color=3D"#2400bf" =
face=3D"Menlo" size=3D"2" =
class=3D"">Simon</font></span></span></div></span></div></span></div></spa=
n></div></span></div></span></div></div></div></body></html>=

--Apple-Mail=_65AD2B86-EB33-4EAB-AE0C-4EF18FE05207--

