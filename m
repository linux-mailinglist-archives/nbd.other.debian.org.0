Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954D3F9886
	for <lists+nbd@lfdr.de>; Fri, 27 Aug 2021 13:47:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 16A2320866; Fri, 27 Aug 2021 11:47:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 27 11:47:03 2021
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
	by bendel.debian.org (Postfix) with ESMTP id E627320690
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Aug 2021 11:46:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.599 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_INVALID=0.1,
	DKIM_SIGNED=0.1, FOURLA=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	HTML_NBSP=2, HTML_TAG_BALANCE_BODY=0.1, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id upPrIVRCYckv for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Aug 2021 11:46:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C54B9205C4
	for <nbd@other.debian.org>; Fri, 27 Aug 2021 11:46:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso9003484wmc.5
        for <nbd@other.debian.org>; Fri, 27 Aug 2021 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=+Ue0nsoyTrUFK9s2efvWK96eZJbsLFmswb8nfRWCMaA=;
        b=c/rkboFHN5VHneTXs3f6+iYi8aNn0rBJznphY8x2q0JIBOrAuse9NbaV3UxuUqpxvv
         QgePd9pvFN6slt7+A8IxtMdKYIK4ZEw6ksWDHYq6tsQ52zRYbGUTjcboPlzFeWPfLG/K
         OVil5O0yeATTMJl+xB6CqCIEeyQOjy4DM/YE41nIBHrN3yCtf2nmuQ0GXI1jjvTeaodn
         90foW0WiP7mcUcr+Zok6A49rGooY2lpep5tSdmZTlsoJN3QbZ5tQlWOjnMbG0M4omyJD
         CESxN4e9dS4wFwqzV2jjnN5htJRXLE9O5KdJNijNtUXClEjgc01JUYXWBT6+IR4twCaZ
         WfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=+Ue0nsoyTrUFK9s2efvWK96eZJbsLFmswb8nfRWCMaA=;
        b=fM0C+NGKffiWD53NJeIAvuHYFoYfmuPOLGwFlJbmM0cJfOVzOzCZk+pSwIsxPvG/3Z
         N403DZlKKTTh5AfJN3rrfIbNuZ917V3NL9qKjfox1xNBhxZWPluZFOvd8RL71HRiPZJL
         kE8TZZDg6jdRvnIIaaSj5vKf2TKMnaXj25r76dXwvKP4Ytnys888t4O5ktc/LewQnNzE
         Z1yXGeQw6FPE4RH2gSO5EUNG7XYEWHTt8zu1vZsBSuVvk9YV3BFwn4CK2bR5aUpHpqfB
         8IkHOlKM50ZqJy3oBM5RXI8pwG3gCSw0yk1WGOvK+eg991oXwc2axXzfY1UrCVPbJ7ao
         KFHw==
X-Gm-Message-State: AOAM53011vZvGJhm0mCLz5lb4zFiAEFT36D2sJrZeypfA7Msmcj7C5Xd
	n2Pze4vkTNskFslF2Jplh7hWgCWq8ws=
X-Google-Smtp-Source: ABdhPJwr/BAhl1niX9lal7+BJM7n8tEBS/7QGhlwYta/RHRgHsZTfXNhLeOj0x748EvoRm5PgwPw1g==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr8243437wmb.156.1630064803851;
        Fri, 27 Aug 2021 04:46:43 -0700 (PDT)
Received: from simons-mbp.lan (247.181.199.146.dyn.plus.net. [146.199.181.247])
        by smtp.gmail.com with ESMTPSA id r20sm6350444wrr.47.2021.08.27.04.46.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Aug 2021 04:46:43 -0700 (PDT)
From: Simon Fernandez <fernandez.simon@gmail.com>
Message-Id: <ADAB45CE-7688-4122-B777-59967727226E@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1B7CC9E3-EACE-45B6-A0C2-00BFDD769132"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: Setting up NBD server / client - block nbd4: Other side returned
 error (22) issue
Date: Fri, 27 Aug 2021 12:46:40 +0100
In-Reply-To: <20210826194835.GH26415@redhat.com>
Cc: eblake@redhat.com,
 Wouter Verhelst <w@uter.be>,
 nbd@other.debian.org
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
 <20210812213241.GA4067@redhat.com>
 <86D4E7FA-2E44-466E-BD31-8C9DF81DAD3E@gmail.com>
 <20210826194835.GH26415@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eHfuQtK5smL.A.NSF.3CNKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1345
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ADAB45CE-7688-4122-B777-59967727226E@gmail.com
Resent-Date: Fri, 27 Aug 2021 11:47:04 +0000 (UTC)


--Apple-Mail=_1B7CC9E3-EACE-45B6-A0C2-00BFDD769132
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Thanks For the swift reply Richard!

Ive just realised it=E2=80=99s you blog I=E2=80=99ve been reading! (Love =
the 'about the author' bit ; ) )

Hopefully get this working this weekend. Swamped this afternoon.

So if I want to export the device instead of separate directories.

Could I change the config file to something like this

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
[rpi-C3-food]
	exportname =3D /dev/sda
	transactionlog =3D /home/pi/media/500G_FAITH/logs/log_food
	readonly =3D false

Then on client
> sudo nbd-client 192.168.1.14 -N rpi-C3-food /dev/nbd1
Then mount it.
> mkdir /mnt/food
> mount /dev/nbd1 /mnt/food

Thanks all really appreciate the help.
Simon


PS I tried the list option -  gave me an error : /
pi@rpi-C1:~ $ nbdinfo --list nbd://192.168.1.14:10809/recipes
nbdinfo: nbd_set_export_name: invalid state: READY: the handle must be =
newly created, or negotiating: Invalid argument




> On 26 Aug 2021, at 20:48, Richard W.M. Jones <rjones@redhat.com> =
wrote:
>=20
> On Thu, Aug 26, 2021 at 07:49:33PM +0100, Simon Fernandez wrote:
>> Hi folks,=20
>> thanks for the reply Wouter's reply was in junk only found it when I =
saw
>> Richards reply and fished it out.
>>=20
>> I'm still getting
>> $ sudo nbd-client 192.168.1.14 10809 -N recipes /dev/nbd0
>> Negotiation: ..size =3D 0MB
>> Connected /dev/nbd0
>>=20
>> Here are the changes I've made - first I built nbdinfo - thanks for =
the tip
>> Richard.
>>=20
>> Build GnuTLS from
>> https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz
>>=20
>> Build libnbd from
>> https://download.libguestfs.org/libnbd/1.8-stable/libnbd-1.8.3.tar.gz
>>=20
>> After installing quite a lot of libraries . . .=20
>> =
----------------------------------------------------------------------
>> Thank you for downloading libnbd 1.8.3
>>=20
>> This is how we have configured the optional components for you today:
>>=20
>> Optional library features:
>>=20
>>    TLS support ............................ yes
>>    NBD URI support ........................ yes
>>    FUSE support ........................... yes
>>    Manual pages ........................... yes
>>    Bash tab completion .................... yes
>>=20
>> Language bindings:
>>=20
>>    Go ..................................... no
>>    OCaml .................................. no
>>    Python ................................. no
>>=20
>> nbdkit version note - during ./configure
>> checking for nbdkit... nbdkit
>> checking for nbdkit >=3D 1.12... no (1.10)
>> configure: WARNING: nbdkit is too old, some tests will be disabled
>>=20
>> The 'make check' skipped a lot of tests but there were no FAILS
>>=20
>> $ nbdinfo --version
>> nbdinfo 1.8.3
>> libnbd 1.8.3
>>=20
>>=20
>> =3D=3D rpi-C3 (192.168.1.14) server side
>>=20
>> Q: Wouter ( w@uter.be ) - Are they readable and writable by the "nbd" =
user?
>> R: I've changed the user & group to pi (the logged in user) so should =
be R/W
>>=20
>> Note: Richard ( rjones@redhat.com ) - You don't need to serve each =
export on a
>> separate port.  The NBD
>> protocol can serve multiple exports (disks) on the same port, with =
the
>> client requesting which one it wants.
>> R: Have remove the port addresses from config
>>=20
>> pi@rpi-C3:~ $ cat /etc/nbd-server/config
>> [generic]
>> # If you want to run everything as root rather than the nbd user, you
>> # may either say "root" in the two following lines, or remove them
>> # altogether. Do not remove the [generic] section, however.
>> user =3D pi
>> group =3D pi
>> includedir =3D /etc/nbd-server/conf.d
>> allowlist =3D true
>>=20
>> # What follows are export definitions. You may create as much of them =
as
>> # you want, but the section header has to be unique.
>> [images]
>> exportname =3D /home/pi/media/500G_FAITH/images/
>> transactionlog =3D /home/pi/media/500G_FAITH/logs/log_images
>> [recipes]
>> exportname =3D /home/pi/media/500G_FAITH/recipes/
>> transactionlog =3D /home/pi/media/500G_FAITH/logs/log_recipes
>> [movie]
>> exportname =3D /home/pi/media/500G_FAITH/movies/
>> transactionlog =3D /home/pi/media/500G_FAITH/logs/log_movie
>=20
> One problem here is that NBD is a block device export protocol, not a
> file serving protocol (like eg NFS or SMB).
>=20
> You can however turn a directory into an NBD export using
> nbdkit-floppy-plugin, eg:
>=20
>  $ nbdkit floppy /home/pi/media/500G_FAITH/recipes/
>=20
> (https://libguestfs.org/nbdkit-floppy-plugin.1.html =
<https://libguestfs.org/nbdkit-floppy-plugin.1.html>)
>=20
> That exports a VFAT filesystem as a block device which has to be
> mounted:
>=20
>  # nbd-client 192.168.1.14 10809 /dev/nbd0
>  # mkdir /mnt/recipes
>  # mount /dev/nbd0 /mnt/recipes
>=20
>> Q: Wouter ( w@uter.be ) - Do the paths that you point to in the =
exportname
>> parameters exist?
>> R: YES its a directory with a bunch of images in it. YES - Non zero =
size.
>>=20
>> pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/recipes/
>> y000_Pork_Belly_Wontan____TOCOST.rtf              =
y011_Rack_And_Black.rtf
>> y002_Salmon_Parfait_Forest_Rosemary_Bread_LE.rtf=20
>> y021_StoneAge_Beef_Taragon_Sauce____TOCOST.rtf
>>=20
>> pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/images
>> 160g? of dough - 250C - 6m.jpg   20190228_163410_monkfish and red =
pepper
>> skewers.jpg
>> 20190629_202814_couscous w apricots.jpg              =
672_V_cheddar_gorgeous.jpg
>> 20181022_134259.jpg              20200124_152329_aubergine & pesto =
stuffing.jpg
>> 25_androll_into_pancakes.jpg 665 Celeriac & Cockscombe Mint Soup.jpg
>>=20
>> pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/movies
>> NA #015 - Bread.mp4
>> NA #016 - Fisetin - Mayo Clinic Trials.mp4
>> NA #042 - Delta Variant COVID.mp4
>> NA #044 - Lex Fridman.mp4
>>=20
>> pi@rpi-C3:~ $ ls -la /home/pi/media/500G_FAITH/logs
>> -rw------- 1 pi pi     56 Aug 26 17:00 log_images
>> -rw------- 1 pi pi     56 Aug 26 17:00 log_movie
>> -rw------- 1 pi pi    700 Aug 26 17:35 log_recipes
>>=20
>> pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_images
>> %`?%`?
>>=20
>> pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_movie
>> %`?%`?
>>=20
>> pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_recipes
>> =
%`?`%`?a%`?b%`?c%`?d%`?e%`?f%`?g%`?h%`?i%`?j%`?k%`?l%`?%`?%`?%`?%`?%`?%`?%=
`?%`%
>> `? %`?
>>=20
>> pi@rpi-C3:~ $ nbdkit --version
>> nbdkit 1.1.12
>>=20
>>=20
>> =3D=3D client side
>>=20
>> Note: Richard ( rjones@redhat.com ) - Use the 'nbdinfo' tool to =
examine what is
>> being served by an NBD
>> server.  It can query all sorts of information as described in the =
manual:
>> R: Built the tool. - here is what it says : /
>>=20
>> pi@rpi-C1:~ $ nbdinfo nbd://192.168.1.14:10809/recipes
>> protocol: newstyle-fixed without TLS
>> export=3D"recipes":
>> export-size: 4096
>> uri: nbd://192.168.1.14:10809/recipes
>> is_rotational: false
>> is_read_only: true
>> can_cache: false
>> can_df: false
>> can_fast_zero: false
>> can_flush: false
>> can_fua: false
>> can_multi_conn: true
>> can_trim: false
>> can_zero: true
>=20
> This looks like a good "recipes" export, although the size is
> unusually small (4K), which is probably because what you're exporting
> here is the directory inode, not the directory - see above.
>=20
>> pi@rpi-C1:~ $ nbdkit --version
>> nbdkit 1.10.3
>>=20
>> pi@rpi-C1:~ $ nbd-client -l 192.168.1.14
>> Negotiation: ..
>> images
>> recipes
>> movie
>=20
> nbdinfo can also list exports using the --list option which will tell
> you a lot of detail about every export.
>=20
>> pi@rpi-C1:~ $ sudo modprobe nbd
>> pi@rpi-C1:~ $ lsmod | grep nbd
>> nbd                    49152  0
>>=20
>> pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N recipes /dev/nbd0
>> Negotiation: ..size =3D 0MB
>> Connected /dev/nbd0
>>=20
>> pi@rpi-C1:~ $ sudo partx -a /dev/nbd0
>> partx: /dev/nbd0: failed to read partition table
>>=20
>> pi@rpi-C1:~ $ sudo parted -l
>> Error: /dev/nbd0: unrecognised disk label
>> Model: Unknown (unknown)                                              =
   =20
>> Disk /dev/nbd0: 4096B
>> Sector size (logical/physical): 512B/512B
>> Partition Table: unknown
>> Disk Flags:=20
>>=20
>> pi@rpi-C1:~ $ dmesg | tail -n 20
>> [ 2138.454532] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ)
>> flags 0x0 phys_seg 1 prio class 0
>> [ 2138.454547] Buffer I/O error on dev nbd0, logical block 0, async =
page read
>> [ 2138.457380] block nbd0: Other side returned error (22)
>> [ 2138.457497] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ)
>> flags 0x0 phys_seg 1 prio class 0
>> [ 2138.457520] Buffer I/O error on dev nbd0, logical block 0, async =
page read
>> [ 2138.459238] block nbd0: Other side returned error (22)
>> [ 2138.459280] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ)
>> flags 0x0 phys_seg 1 prio class 0
>> [ 2138.459297] Buffer I/O error on dev nbd0, logical block 0, async =
page read
>> [ 2138.460993] block nbd0: Other side returned error (22)
>> [ 2138.461023] blk_update_request: I/O error, dev nbd0, sector 0 op =
0x0:(READ)
>> flags 0x0 phys_seg 1 prio class 0
>> [ 2138.461038] Buffer I/O error on dev nbd0, logical block 0, async =
page read
>> [ 2138.462649] block nbd0: Other side returned error (22)
>> [ 2138.462685] Buffer I/O error on dev nbd0, logical block 0, async =
page read
>> [ 2138.464344] block nbd0: Other side returned error (22)
>> [ 2138.466926] block nbd0: Other side returned error (22)
>> [ 2138.468506] block nbd0: Other side returned error (22)
>> [ 2138.470066] block nbd0: Other side returned error (22)
>> [ 2138.471442] block nbd0: Other side returned error (22)
>> [ 2138.472978] block nbd0: Other side returned error (22)
>> [ 2138.474448] block nbd0: Other side returned error (22)
>>=20
>> pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N movies /dev/nbd1
>> Negotiation: ..Error: E: server does not support NBD_OPT_GO and =
dropped
>> connection after sending NBD_OPT_EXPORT_NAME. Try -g.
>> Exiting.
>>=20
>> I'm attempting to serve non empty directories so I don't know why =
it's saying
>> 0Mb size?
>> Scratching my head here . . any thoughts? :/
>=20
> Rich.
>=20
>> Thanks in advance,
>> Simon
>>=20
>>=20
>>    On 12 Aug 2021, at 22:32, Richard W.M. Jones <rjones@redhat.com> =
wrote:
>>=20
>>    On Thu, Jul 22, 2021 at 01:41:00PM +0100, Simon Fernandez wrote:
>>=20
>>        Hi folks,
>>        I=E2=80=99m trying setup a client that connect to a 500Gb ext4 =
disk on another
>>        machine
>>        running nbd server.
>>        Server: raspberry pi 3: uname -r 4.19.66+
>>        Client: raspberry pi 3: uname -r 5.10.17-v7+
>>=20
>>        I=E2=80=99ve followed the information here =
[https://github.com/
>>        NetworkBlockDevice/nbd]
>>        and a lot of other sites but I think I=E2=80=99m doing =
something wrong on the
>>        server
>>        setup because I get this on the client:
>>=20
>>        $ sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
>>        mount: /home/pi/Vols/nbd1-recipes: can't read superblock on =
/dev/nbd2
>>=20
>>        Also it appears to be listening on default port - NOT ones =
specified in
>>        config
>>        file.
>>=20
>>        This is how I=E2=80=99ve set up the server & client, it=E2=80=99=
s probably something
>>        obvious to
>>        more experienced folk.
>>=20
>>=20
>>    Wouter has answered this already, I just wanted to add a couple of
>>    smaller points:
>>=20
>>    (1) You don't need to serve each export on a separate port.  The =
NBD
>>    protocol can serve multiple exports (disks) on the same port, with =
the
>>    client requesting which one it wants.
>>=20
>>    (2) Use the 'nbdinfo' tool to examine what is being served by an =
NBD
>>    server.  It can query all sorts of information as described in the
>>    manual:
>>    https://libguestfs.org/nbdinfo.1.html
>>=20
>>    Rich.
>>=20
>>=20
>>        =3D=3D rpi-C3 (192.168.1.14) server setup
>>=20
>>            sudo apt-get update
>>            sudo apt-get install nbd-server
>>            sudo nano /etc/nbd-server/config=20
>>=20
>>        [generic]
>>        # If you want to run everything as root rather than the nbd =
user, you
>>        # may either say "root" in the two following lines, or remove =
them
>>        # altogether. Do not remove the [generic] section, however.
>>               user =3D nbd
>>               group =3D nbd
>>               includedir =3D /etc/nbd-server/conf.d
>>               allowlist =3D true
>>=20
>>        # What follows are export definitions. You may create as much =
of them
>>        as
>>        # you want, but the section header has to be unique.
>>        [images]
>>               exportname =3D /home/pi/media/500G_FAITH/images
>>               port =3D 510029
>>        [recipes]
>>               exportname =3D /home/pi/media/500G_FAITH/recipes
>>               port =3D 510030
>>        [movie]
>>               exportname =3D /home/pi/media/500G_FAITH/movies
>>               port =3D 510031
>>=20
>>            sudo modprobe nbd # NOT nbd-server!
>>            lsmod | grep nbd
>>=20
>>        nbd                    40960  0
>>=20
>>            sudo service nbd-server force-reload # if already running
>>=20
>>=20
>>        =3D=3D client side
>>=20
>>            sudo apt-get install nbd-client # done
>>            sudo modprobe nbd
>>            nbd-client 192.168.1.14 -l
>>=20
>>        Negotiation: ..
>>        images
>>        recipes
>>        movie
>>=20
>>            sudo nbd-client 192.168.1.14 -N recipes /dev/nbd2
>>=20
>>        Negotiation: ..size =3D 0MB
>>        Connected /dev/nbd2
>>=20
>>            sudo nbd-client 192.168.1.14 -N movie /dev/nbd3
>>=20
>>        Negotiation: ..size =3D 0MB
>>        Connected /dev/nbd3
>>=20
>>            sudo nbd-client 192.168.1.14 -N images /dev/nbd1
>>=20
>>        Negotiation: ..size =3D 0MB
>>        Connected /dev/nbd1
>>=20
>>=20
>>            dmesg | tail -n 10
>>=20
>>        [ 1417.883364] Buffer I/O error on dev nbd1, logical block 0, =
async
>>        page read
>>        [ 1417.884614] block nbd1: Other side returned error (22)
>>        [ 1417.884652] blk_update_request: I/O error, dev nbd1, sector =
0 op
>>        0x0:(READ)
>>        flags 0x0 phys_seg 1 prio class 0
>>        [ 1417.884673] Buffer I/O error on dev nbd1, logical block 0, =
async
>>        page read
>>        [ 1417.885977] block nbd1: Other side returned error (22)
>>        [ 1417.886016] blk_update_request: I/O error, dev nbd1, sector =
0 op
>>        0x0:(READ)
>>        flags 0x0 phys_seg 1 prio class 0
>>        [ 1417.886036] Buffer I/O error on dev nbd1, logical block 0, =
async
>>        page read
>>        [ 1417.887276] block nbd1: Other side returned error (22)
>>        [ 1417.888492] block nbd1: Other side returned error (22)
>>        [ 1417.889751] block nbd1: Other side returned error (22)
>>=20
>>            sudo nbd-client 192.168.1.14 -d /dev/nbd1 # thought it =
might be
>>            something to
>>=20
>>        do w/ nbd1
>>=20
>>            sudo nbd-client 192.168.1.14 -N images /dev/nbd4
>>=20
>>        Negotiation: ..size =3D 0MB
>>        Connected /dev/nbd4
>>=20
>>            dmesg | tail -n 10
>>=20
>>        [ 1848.831897] block nbd4: Other side returned error (22)
>>        [ 1848.833341] block nbd4: Other side returned error (22)
>>        [ 1848.834651] block nbd4: Other side returned error (22)
>>        [ 1848.836002] block nbd4: Other side returned error (22)
>>=20
>>            lsblk -f
>>=20
>>        NAME        FSTYPE  LABEL         UUID
>>                                        FSAVAIL
>>        FSUSE% MOUNTPOINT
>>        sda
>>=20
>>=20
>>        =E2=94=9C=E2=94=80sda1      vfat    EFI           67E3-17ED
>>=20
>>=20
>>        =E2=94=94=E2=94=80sda2      hfsplus time_box_2018 =
f6427a3d-363b-3284-88c4-03ce3493aeff
>>         115.5G=20
>>         94% /media/pi/time_box_2018
>>        nbd2
>>=20
>>=20
>>        nbd3
>>=20
>>=20
>>        nbd4
>>=20
>>=20
>>        mmcblk0
>>=20
>>=20
>>        =E2=94=9C=E2=94=80mmcblk0p1 vfat    boot          5DE4-665C
>>                                    203.4M=20
>>         19% /boot
>>        =E2=94=94=E2=94=80mmcblk0p2 ext4    rootfs        =
7295bbc3-bbc2-4267-9fa0-099e10ef5bf0
>>           4.1G=20
>>         37% /
>>=20
>>            dmesg | tail -n 10
>>=20
>>        [ 1848.836002] block nbd4: Other side returned error (22)
>>        [ 1848.837430] block nbd4: Other side returned error (22)
>>        [ 1848.838860] block nbd4: Other side returned error (22)
>>        [ 1848.840224] block nbd4: Other side returned error (22)
>>        [ 1848.841691] block nbd4: Other side returned error (22)
>>        [ 1848.843077] block nbd4: Other side returned error (22)
>>        [ 1848.844415] block nbd4: Other side returned error (22)
>>        [ 2802.615037] block nbd3: Receive control failed (result -32)
>>        [ 2802.625871] block nbd2: Receive control failed (result -32)
>>        [ 2802.648444] block nbd4: Receive control failed (result -32)
>>=20
>>            ls /home/pi/Vols/
>>=20
>>        nbd1-recipes/    rpi-C2-nbd-500G/ tbx2018/         =
time_box_2018/  =20
>>=20
>>            sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
>>=20
>>        mount: /home/pi/Vols/nbd1-recipes: can't read superblock on =
/dev/nbd2.
>>=20
>>            sudo parted -l
>>=20
>>        Model: Seagate BUP Slim SL (scsi)
>>        Disk /dev/sda: 2000GB
>>        Sector size (logical/physical): 512B/512B
>>        Partition Table: gpt
>>        Disk Flags:=20
>>=20
>>        Number  Start   End     Size    File system  Name
>>                         Flags
>>        1      20.5kB  210MB   210MB   fat32        EFI System =
Partition  boot,
>>        esp
>>        2      210MB   2000GB  2000GB  hfs+         time_box_2018
>>=20
>>=20
>>        Error: /dev/nbd3: unrecognised disk label
>>        Model: Unknown (unknown)
>>=20
>>        Disk /dev/nbd3: 4096B
>>        Sector size (logical/physical): 512B/512B
>>        Partition Table: unknown
>>        Disk Flags:=20
>>=20
>>        Error: /dev/nbd4: unrecognised disk label
>>        Model: Unknown (unknown)
>>=20
>>        Disk /dev/nbd4: 4096B
>>        Sector size (logical/physical): 512B/512B
>>        Partition Table: unknown
>>        Disk Flags:=20
>>=20
>>        Error: /dev/nbd2: unrecognised disk label
>>        Model: Unknown (unknown)
>>=20
>>        Disk /dev/nbd2: 4096B
>>        Sector size (logical/physical): 512B/512B
>>        Partition Table: unknown
>>        Disk Flags:=20
>>=20
>>        Model: SD SL08G (sd/mmc)
>>        Disk /dev/mmcblk0: 7948MB
>>        Sector size (logical/physical): 512B/512B
>>        Partition Table: msdos
>>        Disk Flags:=20
>>=20
>>        Number  Start   End     Size    Type     File system  Flags
>>        1      4194kB  273MB   268MB   primary  fat32        lba
>>        2      273MB   7948MB  7676MB  primary  ext4
>>=20
>>        I=E2=80=99ve been trying to get them to talk for 2 days now=20
>>        One thing I did notice is that the port numbers in the config =
file
>>        don=E2=80=99t seem
>>        to change the fact it=E2=80=99s listening on he default port??
>>=20
>>        $ sudo lsof -i -P -n | grep LISTEN
>>        COMMAND    PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
>>        cnid_meta  312    root    3u  IPv6  11170      0t0  TCP =
[::1]:4700
>>        (LISTEN)
>>        afpd       324    root    3u  IPv4  11195      0t0  TCP *:548 =
(LISTEN)
>>        sshd       426    root    3u  IPv4  12126      0t0  TCP *:22 =
(LISTEN)
>>        sshd       426    root    4u  IPv6  12128      0t0  TCP *:22 =
(LISTEN)
>>        dnsmasq    431 dnsmasq    5u  IPv4  12046      0t0  TCP *:53 =
(LISTEN)
>>        dnsmasq    431 dnsmasq    7u  IPv6  12048      0t0  TCP *:53 =
(LISTEN)
>>        nbd-serve 2026     nbd    3u  IPv6  20100      0t0  TCP =
*:10809
>>        (LISTEN)
>>=20
>>        I=E2=80=99d be very grateful for any pointers, or other =
resources that my be of
>>        help.
>>        Thanks in advance,
>>        Simon
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>    --=20
>>    Richard Jones, Virtualization Group, Red Hat =
http://people.redhat.com/
>>    ~rjones
>>    Read my programming and virtualization blog: =
http://rwmj.wordpress.com
>>    virt-top is 'top' for virtual machines.  Tiny program with many
>>    powerful monitoring features, net stats, disk stats, logging, etc.
>>    http://people.redhat.com/~rjones/virt-top
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

--Apple-Mail=_1B7CC9E3-EACE-45B6-A0C2-00BFDD769132
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Thanks For the swift reply Richard!<div class=3D""><br =
class=3D""></div><div class=3D"">Ive just realised it=E2=80=99s you blog =
I=E2=80=99ve been reading! (Love the 'about the author' bit ; ) =
)</div><div class=3D""><br class=3D""></div><div class=3D"">Hopefully =
get this working this weekend. Swamped this afternoon.</div><div =
class=3D""><br class=3D""></div><div class=3D"">So if I want to export =
the device instead of separate directories.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Could I change the config file to =
something like this</div><div class=3D""><br class=3D""></div><div =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; font-size: =
11px; line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">[generic]</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""># If you want to run everything as root =
rather than the nbd user, you</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""># may either say "root" in the two =
following lines, or remove them</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""># altogether. Do not remove the =
[generic] section, however.</span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>user =3D pi</span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>group =3D =
pi</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
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
class=3D"">[rpi-C3-food]</div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>exportname =3D /dev/sda</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 11px;" =
class=3D""><font face=3D"Menlo" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>transactionlog =3D =
/home/pi/media/500G_FAITH/logs/log_food</font></span></div></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Menlo" class=3D""><span style=3D"font-size: =
11px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span></span><span style=3D"orphans: 2; =
widows: 2;" class=3D"">readonly =3D false</span></span></font></div><div =
class=3D""><br class=3D""></div><div class=3D"">Then on client</div><div =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"-webkit-font-kerning: none; =
font-size: 11px;" class=3D""><font face=3D"Menlo" class=3D"">&gt; sudo =
nbd-client 192.168.1.14 -N&nbsp;</font><span style=3D"font-family: =
Menlo;" class=3D"">rpi-C3-food</span><font face=3D"Menlo" =
class=3D"">&nbsp;/dev/nbd1</font></span></div></div><div class=3D"">Then =
mount it.</div><div class=3D""><font face=3D"Menlo" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&gt; mkdir =
/mnt/food</span></font></div><div class=3D""><font face=3D"Menlo" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&gt; mount =
/dev/nbd1 /mnt/</span></font><span style=3D"font-family: Menlo; =
font-size: 11px;" class=3D"">food</span></div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks all really appreciate the =
help.</div><div class=3D"">Simon</div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div class=3D"">PS =
I tried the list option - &nbsp;gave me an error : /</div><div =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; font-size: =
11px; line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; color: #2fb41d" =
class=3D""><b class=3D"">pi@rpi-C1</b></span><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">:</span><span style=3D"font-variant-ligatures: =
no-common-ligatures; color: #400bd9" class=3D""><b class=3D"">~ =
$</b></span><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""> nbdinfo --list <a href=3D"nbd://192.168.1.14:10809/recipes" =
class=3D"">nbd://192.168.1.14:10809/recipes</a></span></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: Menlo;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">nbdinfo: =
nbd_set_export_name: invalid state: READY: the handle must be newly =
created, or negotiating: Invalid argument</span></div></div><div =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><br class=3D""></span></div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 26 =
Aug 2021, at 20:48, Richard W.M. Jones &lt;<a =
href=3D"mailto:rjones@redhat.com" class=3D"">rjones@redhat.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Thu, Aug 26, 2021 at =
07:49:33PM +0100, Simon Fernandez wrote:</span><br style=3D"caret-color: =
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
text-decoration: none;" class=3D"">Hi folks,<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">thanks for =
the reply Wouter's reply was in junk only found it when I saw<br =
class=3D"">Richards reply and fished it out.<br class=3D""><br =
class=3D"">I'm still getting<br class=3D"">$ sudo nbd-client =
192.168.1.14 10809 -N recipes /dev/nbd0<br class=3D"">Negotiation: =
..size =3D 0MB<br class=3D"">Connected /dev/nbd0<br class=3D""><br =
class=3D"">Here are the changes I've made - first I built nbdinfo - =
thanks for the tip<br class=3D"">Richard.<br class=3D""><br =
class=3D"">Build GnuTLS from<br class=3D""><a =
href=3D"https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz"=
 =
class=3D"">https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.=
xz</a><br class=3D""><br class=3D"">Build libnbd from<br =
class=3D"">https://download.libguestfs.org/libnbd/1.8-stable/libnbd-1.8.3.=
tar.gz<br class=3D""><br class=3D"">After installing quite a lot of =
libraries . . .<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">---------------------------------------------------------------=
-------<br class=3D"">Thank you for downloading libnbd 1.8.3<br =
class=3D""><br class=3D"">This is how we have configured the optional =
components for you today:<br class=3D""><br class=3D"">Optional library =
features:<br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;TLS support =
............................ yes<br class=3D"">&nbsp;&nbsp;&nbsp;NBD URI =
support ........................ yes<br class=3D"">&nbsp;&nbsp;&nbsp;FUSE =
support ........................... yes<br =
class=3D"">&nbsp;&nbsp;&nbsp;Manual pages ........................... =
yes<br class=3D"">&nbsp;&nbsp;&nbsp;Bash tab completion =
.................... yes<br class=3D""><br class=3D"">Language =
bindings:<br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;Go =
..................................... no<br =
class=3D"">&nbsp;&nbsp;&nbsp;OCaml .................................. =
no<br class=3D"">&nbsp;&nbsp;&nbsp;Python =
................................. no<br class=3D""><br class=3D"">nbdkit =
version note - during ./configure<br class=3D"">checking for nbdkit... =
nbdkit<br class=3D"">checking for nbdkit &gt;=3D 1.12... no (1.10)<br =
class=3D"">configure: WARNING: nbdkit is too old, some tests will be =
disabled<br class=3D""><br class=3D"">The 'make check' skipped a lot of =
tests but there were no FAILS<br class=3D""><br class=3D"">$ nbdinfo =
--version<br class=3D"">nbdinfo 1.8.3<br class=3D"">libnbd 1.8.3<br =
class=3D""><br class=3D""><br class=3D"">=3D=3D rpi-C3 (192.168.1.14) =
server side<br class=3D""><br class=3D"">Q: Wouter ( w@uter.be ) - Are =
they readable and writable by the "nbd" user?<br class=3D"">R: I've =
changed the user &amp; group to pi (the logged in user) so should be =
R/W<br class=3D""><br class=3D"">Note: Richard ( rjones@redhat.com ) - =
You don't need to serve each export on a<br class=3D"">separate port. =
&nbsp;The NBD<br class=3D"">protocol can serve multiple exports (disks) =
on the same port, with the<br class=3D"">client requesting which one it =
wants.<br class=3D"">R: Have remove the port addresses from config<br =
class=3D""><br class=3D"">pi@rpi-C3:~ $ cat /etc/nbd-server/config<br =
class=3D"">[generic]<br class=3D""># If you want to run everything as =
root rather than the nbd user, you<br class=3D""># may either say "root" =
in the two following lines, or remove them<br class=3D""># altogether. =
Do not remove the [generic] section, however.<br class=3D"">user =3D =
pi<br class=3D"">group =3D pi<br class=3D"">includedir =3D =
/etc/nbd-server/conf.d<br class=3D"">allowlist =3D true<br class=3D""><br =
class=3D""># What follows are export definitions. You may create as much =
of them as<br class=3D""># you want, but the section header has to be =
unique.<br class=3D"">[images]<br class=3D"">exportname =3D =
/home/pi/media/500G_FAITH/images/<br class=3D"">transactionlog =3D =
/home/pi/media/500G_FAITH/logs/log_images<br class=3D"">[recipes]<br =
class=3D"">exportname =3D /home/pi/media/500G_FAITH/recipes/<br =
class=3D"">transactionlog =3D =
/home/pi/media/500G_FAITH/logs/log_recipes<br class=3D"">[movie]<br =
class=3D"">exportname =3D /home/pi/media/500G_FAITH/movies/<br =
class=3D"">transactionlog =3D =
/home/pi/media/500G_FAITH/logs/log_movie<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">One problem here is that NBD is =
a block device export protocol, not a</span><br style=3D"caret-color: =
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
class=3D"">file serving protocol (like eg NFS or SMB).</span><br =
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
display: inline !important;" class=3D"">You can however turn a directory =
into an NBD export using</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">nbdkit-floppy-plugin, eg:</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;$ nbdkit floppy =
/home/pi/media/500G_FAITH/recipes/</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">(</span><a =
href=3D"https://libguestfs.org/nbdkit-floppy-plugin.1.html" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://libguestfs.org/nbdkit-floppy-plugin.1.html</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">)</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">That exports a VFAT filesystem as a block device which has to =
be</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">mounted:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;# nbd-client 192.168.1.14 10809 /dev/nbd0</span><br =
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
display: inline !important;" class=3D"">&nbsp;# mkdir =
/mnt/recipes</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">&nbsp;# mount =
/dev/nbd0 /mnt/recipes</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Q: Wouter ( <a =
href=3D"mailto:w@uter.be" class=3D"">w@uter.be</a> ) - Do the paths that =
you point to in the exportname<br class=3D"">parameters exist?<br =
class=3D"">R: YES its a directory with a bunch of images in it. YES - =
Non zero size.<br class=3D""><br class=3D"">pi@rpi-C3:~ $ ls =
/home/pi/media/500G_FAITH/recipes/<br =
class=3D"">y000_Pork_Belly_Wontan____TOCOST.rtf =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;y011_Rack_And_Black.rtf<br =
class=3D"">y002_Salmon_Parfait_Forest_Rosemary_Bread_LE.rtf<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">y021_StoneAge_Beef_Taragon_Sauce____TOCOST.rtf<br =
class=3D""><br class=3D"">pi@rpi-C3:~ $ ls =
/home/pi/media/500G_FAITH/images<br class=3D"">160g? of dough - 250C - =
6m.jpg &nbsp;&nbsp;20190228_163410_monkfish and red pepper<br =
class=3D"">skewers.jpg<br class=3D"">20190629_202814_couscous w =
apricots.jpg =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;672_V_cheddar_gorgeous.jpg<br class=3D"">20181022_134259.jpg =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;20200124_152329_aubergine &amp; pesto stuffing.jpg<br =
class=3D"">25_androll_into_pancakes.jpg 665 Celeriac &amp; Cockscombe =
Mint Soup.jpg<br class=3D""><br class=3D"">pi@rpi-C3:~ $ ls =
/home/pi/media/500G_FAITH/movies<br class=3D"">NA #015 - Bread.mp4<br =
class=3D"">NA #016 - Fisetin - Mayo Clinic Trials.mp4<br class=3D"">NA =
#042 - Delta Variant COVID.mp4<br class=3D"">NA #044 - Lex =
Fridman.mp4<br class=3D""><br class=3D"">pi@rpi-C3:~ $ ls -la =
/home/pi/media/500G_FAITH/logs<br class=3D"">-rw------- 1 pi pi =
&nbsp;&nbsp;&nbsp;&nbsp;56 Aug 26 17:00 log_images<br =
class=3D"">-rw------- 1 pi pi &nbsp;&nbsp;&nbsp;&nbsp;56 Aug 26 17:00 =
log_movie<br class=3D"">-rw------- 1 pi pi &nbsp;&nbsp;&nbsp;700 Aug 26 =
17:35 log_recipes<br class=3D""><br class=3D"">pi@rpi-C3:~ $ cat =
/home/pi/media/500G_FAITH/logs/log_images<br class=3D"">%`?%`?<br =
class=3D""><br class=3D"">pi@rpi-C3:~ $ cat =
/home/pi/media/500G_FAITH/logs/log_movie<br class=3D"">%`?%`?<br =
class=3D""><br class=3D"">pi@rpi-C3:~ $ cat =
/home/pi/media/500G_FAITH/logs/log_recipes<br =
class=3D"">%`?`%`?a%`?b%`?c%`?d%`?e%`?f%`?g%`?h%`?i%`?j%`?k%`?l%`?%`?%`?%`=
?%`?%`?%`?%`?%`%<br class=3D"">`? %`?<br class=3D""><br =
class=3D"">pi@rpi-C3:~ $ nbdkit --version<br class=3D"">nbdkit 1.1.12<br =
class=3D""><br class=3D""><br class=3D"">=3D=3D client side<br =
class=3D""><br class=3D"">Note: Richard ( <a =
href=3D"mailto:rjones@redhat.com" class=3D"">rjones@redhat.com</a> ) - =
Use the 'nbdinfo' tool to examine what is<br class=3D"">being served by =
an NBD<br class=3D"">server. &nbsp;It can query all sorts of information =
as described in the manual:<br class=3D"">R: Built the tool. - here is =
what it says : /<br class=3D""><br class=3D"">pi@rpi-C1:~ $ nbdinfo <a =
href=3D"nbd://192.168.1.14:10809/recipes" =
class=3D"">nbd://192.168.1.14:10809/recipes</a><br class=3D"">protocol: =
newstyle-fixed without TLS<br class=3D"">export=3D"recipes":<br =
class=3D"">export-size: 4096<br class=3D"">uri: <a =
href=3D"nbd://192.168.1.14:10809/recipes" =
class=3D"">nbd://192.168.1.14:10809/recipes</a><br =
class=3D"">is_rotational: false<br class=3D"">is_read_only: true<br =
class=3D"">can_cache: false<br class=3D"">can_df: false<br =
class=3D"">can_fast_zero: false<br class=3D"">can_flush: false<br =
class=3D"">can_fua: false<br class=3D"">can_multi_conn: true<br =
class=3D"">can_trim: false<br class=3D"">can_zero: true<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">This looks like a good "recipes" export, although the size =
is</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">unusually =
small (4K), which is probably because what you're exporting</span><br =
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
display: inline !important;" class=3D"">here is the directory inode, not =
the directory - see above.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">pi@rpi-C1:~ $ nbdkit --version<br =
class=3D"">nbdkit 1.10.3<br class=3D""><br class=3D"">pi@rpi-C1:~ $ =
nbd-client -l 192.168.1.14<br class=3D"">Negotiation: ..<br =
class=3D"">images<br class=3D"">recipes<br class=3D"">movie<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">nbdinfo can also list exports using the --list option which =
will tell</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">you a lot of =
detail about every export.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">pi@rpi-C1:~ $ sudo modprobe nbd<br =
class=3D"">pi@rpi-C1:~ $ lsmod | grep nbd<br class=3D"">nbd =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;49152 &nbsp;0<br class=3D""><br =
class=3D"">pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N recipes =
/dev/nbd0<br class=3D"">Negotiation: ..size =3D 0MB<br =
class=3D"">Connected /dev/nbd0<br class=3D""><br class=3D"">pi@rpi-C1:~ =
$ sudo partx -a /dev/nbd0<br class=3D"">partx: /dev/nbd0: failed to read =
partition table<br class=3D""><br class=3D"">pi@rpi-C1:~ $ sudo parted =
-l<br class=3D"">Error: /dev/nbd0: unrecognised disk label<br =
class=3D"">Model: Unknown (unknown) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b=
r class=3D"">Disk /dev/nbd0: 4096B<br class=3D"">Sector size =
(logical/physical): 512B/512B<br class=3D"">Partition Table: unknown<br =
class=3D"">Disk Flags:<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">pi@rpi-C1:~ $ dmesg | tail -n 20<br class=3D"">[ 2138.454532] =
blk_update_request: I/O error, dev nbd0, sector 0 op 0x0:(READ)<br =
class=3D"">flags 0x0 phys_seg 1 prio class 0<br class=3D"">[ =
2138.454547] Buffer I/O error on dev nbd0, logical block 0, async page =
read<br class=3D"">[ 2138.457380] block nbd0: Other side returned error =
(22)<br class=3D"">[ 2138.457497] blk_update_request: I/O error, dev =
nbd0, sector 0 op 0x0:(READ)<br class=3D"">flags 0x0 phys_seg 1 prio =
class 0<br class=3D"">[ 2138.457520] Buffer I/O error on dev nbd0, =
logical block 0, async page read<br class=3D"">[ 2138.459238] block =
nbd0: Other side returned error (22)<br class=3D"">[ 2138.459280] =
blk_update_request: I/O error, dev nbd0, sector 0 op 0x0:(READ)<br =
class=3D"">flags 0x0 phys_seg 1 prio class 0<br class=3D"">[ =
2138.459297] Buffer I/O error on dev nbd0, logical block 0, async page =
read<br class=3D"">[ 2138.460993] block nbd0: Other side returned error =
(22)<br class=3D"">[ 2138.461023] blk_update_request: I/O error, dev =
nbd0, sector 0 op 0x0:(READ)<br class=3D"">flags 0x0 phys_seg 1 prio =
class 0<br class=3D"">[ 2138.461038] Buffer I/O error on dev nbd0, =
logical block 0, async page read<br class=3D"">[ 2138.462649] block =
nbd0: Other side returned error (22)<br class=3D"">[ 2138.462685] Buffer =
I/O error on dev nbd0, logical block 0, async page read<br class=3D"">[ =
2138.464344] block nbd0: Other side returned error (22)<br class=3D"">[ =
2138.466926] block nbd0: Other side returned error (22)<br class=3D"">[ =
2138.468506] block nbd0: Other side returned error (22)<br class=3D"">[ =
2138.470066] block nbd0: Other side returned error (22)<br class=3D"">[ =
2138.471442] block nbd0: Other side returned error (22)<br class=3D"">[ =
2138.472978] block nbd0: Other side returned error (22)<br class=3D"">[ =
2138.474448] block nbd0: Other side returned error (22)<br class=3D""><br =
class=3D"">pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N movies =
/dev/nbd1<br class=3D"">Negotiation: ..Error: E: server does not support =
NBD_OPT_GO and dropped<br class=3D"">connection after sending =
NBD_OPT_EXPORT_NAME. Try -g.<br class=3D"">Exiting.<br class=3D""><br =
class=3D"">I'm attempting to serve non empty directories so I don't know =
why it's saying<br class=3D"">0Mb size?<br class=3D"">Scratching my head =
here . . any thoughts? :/<br class=3D""></blockquote><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Thanks =
in advance,<br class=3D"">Simon<br class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;On 12 Aug 2021, at 22:32, Richard W.M. =
Jones &lt;<a href=3D"mailto:rjones@redhat.com" =
class=3D"">rjones@redhat.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;On Thu, Jul 22, 2021 at 01:41:00PM +0100, =
Simon Fernandez wrote:<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hi folks,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I=E2=80=99m trying =
setup a client that connect to a 500Gb ext4 disk on another<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machine<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;running nbd =
server.<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Server: =
raspberry pi 3: uname -r 4.19.66+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Client: raspberry =
pi 3: uname -r 5.10.17-v7+<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I=E2=80=99ve =
followed the information here [<a href=3D"https://github.com/" =
class=3D"">https://github.com/</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NetworkBlockDevice/nb=
d]<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;and a lot of =
other sites but I think I=E2=80=99m doing something wrong on the<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;server<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;setup because I get =
this on the client:<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$ sudo mount =
/dev/nbd2 /home/pi/Vols/nbd1-recipes/<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mount: =
/home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Also =
it appears to be listening on default port - NOT ones specified in<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;config<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file.<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This =
is how I=E2=80=99ve set up the server &amp; client, it=E2=80=99s =
probably something<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;obvious to<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;more experienced =
folk.<br class=3D""><br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;Wouter=
 has answered this already, I just wanted to add a couple of<br =
class=3D"">&nbsp;&nbsp;&nbsp;smaller points:<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;(1) You don't need to serve each export on =
a separate port. &nbsp;The NBD<br class=3D"">&nbsp;&nbsp;&nbsp;protocol =
can serve multiple exports (disks) on the same port, with the<br =
class=3D"">&nbsp;&nbsp;&nbsp;client requesting which one it wants.<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;(2) Use the 'nbdinfo' tool =
to examine what is being served by an NBD<br =
class=3D"">&nbsp;&nbsp;&nbsp;server. &nbsp;It can query all sorts of =
information as described in the<br class=3D"">&nbsp;&nbsp;&nbsp;manual:<br=
 class=3D"">&nbsp;&nbsp;&nbsp;<a =
href=3D"https://libguestfs.org/nbdinfo.1.html" =
class=3D"">https://libguestfs.org/nbdinfo.1.html</a><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;Rich.<br class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D=3D rpi-C3 =
(192.168.1.14) server setup<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo apt-get update<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo apt-get install nbd-server<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo nano /etc/nbd-server/config<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[generic]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# If you want to =
run everything as root rather than the nbd user, you<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# may either say =
"root" in the two following lines, or remove them<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# altogether. Do =
not remove the [generic] section, however.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;user =3D nbd<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;group =3D nbd<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;includedir =3D /etc/nbd-server/conf.d<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;allowlist =3D true<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# What follows are =
export definitions. You may create as much of them<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;as<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# you want, but the =
section header has to be unique.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[images]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;exportname =3D /home/pi/media/500G_FAITH/images<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;port =3D 510029<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[recipes]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;exportname =3D /home/pi/media/500G_FAITH/recipes<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;port =3D 510030<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[movie]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;exportname =3D /home/pi/media/500G_FAITH/movies<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;port =3D 510031<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo modprobe nbd # NOT nbd-server!<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;lsmod | grep nbd<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nbd =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40960 &nbsp;0<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo service nbd-server force-reload # if already running<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D=3D client =
side<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo apt-get install nbd-client # done<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo modprobe nbd<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;nbd-client 192.168.1.14 -l<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Negotiation: ..<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;images<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;recipes<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;movie<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo nbd-client 192.168.1.14 -N recipes /dev/nbd2<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Negotiation: ..size =
=3D 0MB<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Connected =
/dev/nbd2<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo nbd-client 192.168.1.14 -N movie /dev/nbd3<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Negotiation: ..size =
=3D 0MB<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Connected =
/dev/nbd3<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo nbd-client 192.168.1.14 -N images /dev/nbd1<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Negotiation: ..size =
=3D 0MB<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Connected =
/dev/nbd1<br class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;dmesg | tail -n 10<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.883364] =
Buffer I/O error on dev nbd1, logical block 0, async<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;page read<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.884614] =
block nbd1: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.884652] =
blk_update_request: I/O error, dev nbd1, sector 0 op<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x0:(READ)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags 0x0 phys_seg =
1 prio class 0<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ =
1417.884673] Buffer I/O error on dev nbd1, logical block 0, async<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;page read<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.885977] =
block nbd1: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.886016] =
blk_update_request: I/O error, dev nbd1, sector 0 op<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x0:(READ)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flags 0x0 phys_seg =
1 prio class 0<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ =
1417.886036] Buffer I/O error on dev nbd1, logical block 0, async<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;page read<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.887276] =
block nbd1: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.888492] =
block nbd1: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1417.889751] =
block nbd1: Other side returned error (22)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo nbd-client 192.168.1.14 -d /dev/nbd1 # thought it might be<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;something to<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;do w/ nbd1<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo nbd-client 192.168.1.14 -N images /dev/nbd4<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Negotiation: ..size =
=3D 0MB<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Connected =
/dev/nbd4<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;dmesg | tail -n 10<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.831897] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.833341] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.834651] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.836002] =
block nbd4: Other side returned error (22)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;lsblk -f<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NAME =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FSTYPE &nbsp;LABEL =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UUID<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;FSAVAIL<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FSUSE% =
MOUNTPOINT<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sda<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80sda=
1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vfat &nbsp;&nbsp;&nbsp;EFI =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;67E3-17ED<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=E2=94=94=E2=94=80sda=
2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hfsplus time_box_2018 =
f6427a3d-363b-3284-88c4-03ce3493aeff<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;115.5G<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;94% =
/media/pi/time_box_2018<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nbd2<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nbd3<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nbd4<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mmcblk0<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80mmc=
blk0p1 vfat &nbsp;&nbsp;&nbsp;boot =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5DE4-665C<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2=
03.4M<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;19% /boot<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=E2=94=94=E2=94=80mmc=
blk0p2 ext4 &nbsp;&nbsp;&nbsp;rootfs =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7295bbc3-bbc2-4267-9fa0-099e10ef=
5bf0<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.1=
G<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;37% /<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;dmesg | tail -n 10<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.836002] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.837430] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.838860] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.840224] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.841691] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.843077] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 1848.844415] =
block nbd4: Other side returned error (22)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 2802.615037] =
block nbd3: Receive control failed (result -32)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 2802.625871] =
block nbd2: Receive control failed (result -32)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 2802.648444] =
block nbd4: Receive control failed (result -32)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;ls /home/pi/Vols/<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nbd1-recipes/ =
&nbsp;&nbsp;&nbsp;rpi-C2-nbd-500G/ tbx2018/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time_box_2018/ =
&nbsp;&nbsp;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mount: =
/home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2.<br =
class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;sudo parted -l<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Model: Seagate BUP =
Slim SL (scsi)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk /dev/sda: =
2000GB<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sector =
size (logical/physical): 512B/512B<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Partition Table: =
gpt<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk =
Flags:<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number=
 &nbsp;Start &nbsp;&nbsp;End &nbsp;&nbsp;&nbsp;&nbsp;Size =
&nbsp;&nbsp;&nbsp;File system &nbsp;Name<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;Flags<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20.5kB &nbsp;210MB &nbsp;&nbsp;210MB =
&nbsp;&nbsp;fat32 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EFI System =
Partition &nbsp;boot,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;esp<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;210MB &nbsp;&nbsp;2000GB &nbsp;2000GB =
&nbsp;hfs+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time_box_2018<br =
class=3D""><br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: /dev/nbd3: =
unrecognised disk label<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Model: Unknown =
(unknown)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk /dev/nbd3: =
4096B<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sector =
size (logical/physical): 512B/512B<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Partition Table: =
unknown<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk =
Flags:<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error:=
 /dev/nbd4: unrecognised disk label<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Model: Unknown =
(unknown)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk /dev/nbd4: =
4096B<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sector =
size (logical/physical): 512B/512B<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Partition Table: =
unknown<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk =
Flags:<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error:=
 /dev/nbd2: unrecognised disk label<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Model: Unknown =
(unknown)<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk /dev/nbd2: =
4096B<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sector =
size (logical/physical): 512B/512B<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Partition Table: =
unknown<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk =
Flags:<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Model:=
 SD SL08G (sd/mmc)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk /dev/mmcblk0: =
7948MB<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sector =
size (logical/physical): 512B/512B<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Partition Table: =
msdos<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disk =
Flags:<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number=
 &nbsp;Start &nbsp;&nbsp;End &nbsp;&nbsp;&nbsp;&nbsp;Size =
&nbsp;&nbsp;&nbsp;Type &nbsp;&nbsp;&nbsp;&nbsp;File system =
&nbsp;Flags<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4194kB &nbsp;273MB &nbsp;&nbsp;268MB =
&nbsp;&nbsp;primary &nbsp;fat32 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lba<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;273MB &nbsp;&nbsp;7948MB &nbsp;7676MB =
&nbsp;primary &nbsp;ext4<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I=E2=80=99ve been =
trying to get them to talk for 2 days now<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;One thing I did =
notice is that the port numbers in the config file<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;don=E2=80=99t =
seem<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to change =
the fact it=E2=80=99s listening on he default port??<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$ sudo lsof -i -P =
-n | grep LISTEN<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COMMAND =
&nbsp;&nbsp;&nbsp;PID &nbsp;&nbsp;&nbsp;USER &nbsp;&nbsp;FD =
&nbsp;&nbsp;TYPE DEVICE SIZE/OFF NODE NAME<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cnid_meta &nbsp;312 =
&nbsp;&nbsp;&nbsp;root &nbsp;&nbsp;&nbsp;3u &nbsp;IPv6 &nbsp;11170 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP [::1]:4700<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(LISTEN)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;afpd =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;324 &nbsp;&nbsp;&nbsp;root =
&nbsp;&nbsp;&nbsp;3u &nbsp;IPv4 &nbsp;11195 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:548 (LISTEN)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sshd =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;426 &nbsp;&nbsp;&nbsp;root =
&nbsp;&nbsp;&nbsp;3u &nbsp;IPv4 &nbsp;12126 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:22 (LISTEN)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sshd =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;426 &nbsp;&nbsp;&nbsp;root =
&nbsp;&nbsp;&nbsp;4u &nbsp;IPv6 &nbsp;12128 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:22 (LISTEN)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dnsmasq =
&nbsp;&nbsp;&nbsp;431 dnsmasq &nbsp;&nbsp;&nbsp;5u &nbsp;IPv4 =
&nbsp;12046 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:53 (LISTEN)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dnsmasq =
&nbsp;&nbsp;&nbsp;431 dnsmasq &nbsp;&nbsp;&nbsp;7u &nbsp;IPv6 =
&nbsp;12048 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:53 (LISTEN)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nbd-serve 2026 =
&nbsp;&nbsp;&nbsp;&nbsp;nbd &nbsp;&nbsp;&nbsp;3u &nbsp;IPv6 &nbsp;20100 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0t0 &nbsp;TCP *:10809<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(LISTEN)<br =
class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I=E2=80=
=99d be very grateful for any pointers, or other resources that my be =
of<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;help.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thanks in =
advance,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Simon<br =
class=3D""><br class=3D""><br class=3D""><br class=3D""><br class=3D""><br=
 class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;--<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">&nbsp;&nbsp;&nbsp;Richard Jones, Virtualization Group, Red =
Hat <a href=3D"http://people.redhat.com/" =
class=3D"">http://people.redhat.com/</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;~rjones<br class=3D"">&nbsp;&nbsp;&nbsp;Read =
my programming and virtualization blog: <a =
href=3D"http://rwmj.wordpress.com" =
class=3D"">http://rwmj.wordpress.com</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;virt-top is 'top' for virtual machines. =
&nbsp;Tiny program with many<br class=3D"">&nbsp;&nbsp;&nbsp;powerful =
monitoring features, net stats, disk stats, logging, etc.<br =
class=3D"">&nbsp;&nbsp;&nbsp;<a =
href=3D"http://people.redhat.com/~rjones/virt-top" =
class=3D"">http://people.redhat.com/~rjones/virt-top</a><br class=3D""><br=
 class=3D""><br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
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
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br=
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
></div><br class=3D""></div></body></html>=

--Apple-Mail=_1B7CC9E3-EACE-45B6-A0C2-00BFDD769132--

