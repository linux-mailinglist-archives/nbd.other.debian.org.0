Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4093F8F5E
	for <lists+nbd@lfdr.de>; Thu, 26 Aug 2021 21:59:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 17EC520AC5; Thu, 26 Aug 2021 19:59:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 26 19:59:54 2021
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 79AF020A77
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Aug 2021 19:59:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.548 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.747,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6MHyAK9gKTD1 for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Aug 2021 19:59:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 834CF20A6A
	for <nbd@other.debian.org>; Thu, 26 Aug 2021 19:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630007975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Yi2UYAPpcpG3w3CTyrbMU/WFNHQk2SZ/t/ZNwzbRGs=;
	b=eUCw9wwCLmP3Ov4sXr5q2TUTWnEA4mPnUchYjS8My13N3QMt09YOv96pd/zAwmBuw2TKSE
	O1X1yNVBKrVu1am3yif8GrQ2fv4RZGPWLMs71A1WTkyo2g06tUkSTlz9URh0iI01tGcOr9
	ogqYLWWy2/Ogkuu/8tZQFRVenpYG4Kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-H06eN_9XO6uyDZhGa6p2hg-1; Thu, 26 Aug 2021 15:59:33 -0400
X-MC-Unique: H06eN_9XO6uyDZhGa6p2hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523081858E22;
	Thu, 26 Aug 2021 19:59:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA0BC1803D;
	Thu, 26 Aug 2021 19:59:31 +0000 (UTC)
Date: Thu, 26 Aug 2021 20:59:30 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Simon Fernandez <fernandez.simon@gmail.com>, eblake@redhat.com
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org
Subject: Re: Setting up NBD server / client - block nbd4: Other side returned
 error (22) issue
Message-ID: <20210826195930.GA12243@redhat.com>
References: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
 <20210812213241.GA4067@redhat.com>
 <86D4E7FA-2E44-466E-BD31-8C9DF81DAD3E@gmail.com>
 <20210826194835.GH26415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826194835.GH26415@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_sDMUPty8KN.A.dcG.6K_JhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1342
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210826195930.GA12243@redhat.com
Resent-Date: Thu, 26 Aug 2021 19:59:54 +0000 (UTC)

On Thu, Aug 26, 2021 at 08:48:35PM +0100, Richard W.M. Jones wrote:
> On Thu, Aug 26, 2021 at 07:49:33PM +0100, Simon Fernandez wrote:
> > Hi folks, 
> > thanks for the reply Wouter's reply was in junk only found it when I saw
> > Richards reply and fished it out.
> > 
> > I'm still getting
> > $ sudo nbd-client 192.168.1.14 10809 -N recipes /dev/nbd0
> > Negotiation: ..size = 0MB
> > Connected /dev/nbd0
> > 
> > Here are the changes I've made - first I built nbdinfo - thanks for the tip
> > Richard.
> > 
> > Build GnuTLS from
> > https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz
> > 
> > Build libnbd from
> > https://download.libguestfs.org/libnbd/1.8-stable/libnbd-1.8.3.tar.gz
> > 
> > After installing quite a lot of libraries . . . 
> > ----------------------------------------------------------------------
> > Thank you for downloading libnbd 1.8.3
> > 
> > This is how we have configured the optional components for you today:
> > 
> > Optional library features:
> > 
> >     TLS support ............................ yes
> >     NBD URI support ........................ yes
> >     FUSE support ........................... yes
> >     Manual pages ........................... yes
> >     Bash tab completion .................... yes
> > 
> > Language bindings:
> > 
> >     Go ..................................... no
> >     OCaml .................................. no
> >     Python ................................. no
> > 
> > nbdkit version note - during ./configure
> > checking for nbdkit... nbdkit
> > checking for nbdkit >= 1.12... no (1.10)
> > configure: WARNING: nbdkit is too old, some tests will be disabled
> > 
> > The 'make check' skipped a lot of tests but there were no FAILS
> > 
> > $ nbdinfo --version
> > nbdinfo 1.8.3
> > libnbd 1.8.3
> > 
> > 
> > == rpi-C3 (192.168.1.14) server side
> > 
> > Q: Wouter ( w@uter.be ) - Are they readable and writable by the "nbd" user?
> > R: I've changed the user & group to pi (the logged in user) so should be R/W
> > 
> > Note: Richard ( rjones@redhat.com ) - You don't need to serve each export on a
> > separate port.  The NBD
> > protocol can serve multiple exports (disks) on the same port, with the
> > client requesting which one it wants.
> > R: Have remove the port addresses from config
> > 
> > pi@rpi-C3:~ $ cat /etc/nbd-server/config
> > [generic]
> > # If you want to run everything as root rather than the nbd user, you
> > # may either say "root" in the two following lines, or remove them
> > # altogether. Do not remove the [generic] section, however.
> > user = pi
> > group = pi
> > includedir = /etc/nbd-server/conf.d
> > allowlist = true
> > 
> > # What follows are export definitions. You may create as much of them as
> > # you want, but the section header has to be unique.
> > [images]
> > exportname = /home/pi/media/500G_FAITH/images/
> > transactionlog = /home/pi/media/500G_FAITH/logs/log_images
> > [recipes]
> > exportname = /home/pi/media/500G_FAITH/recipes/
> > transactionlog = /home/pi/media/500G_FAITH/logs/log_recipes
> > [movie]
> > exportname = /home/pi/media/500G_FAITH/movies/
> > transactionlog = /home/pi/media/500G_FAITH/logs/log_movie
> 
> One problem here is that NBD is a block device export protocol, not a
> file serving protocol (like eg NFS or SMB).
> 
> You can however turn a directory into an NBD export using
> nbdkit-floppy-plugin, eg:
> 
>   $ nbdkit floppy /home/pi/media/500G_FAITH/recipes/
> 
> (https://libguestfs.org/nbdkit-floppy-plugin.1.html)
> 
> That exports a VFAT filesystem as a block device which has to be
> mounted:
> 
>   # nbd-client 192.168.1.14 10809 /dev/nbd0
>   # mkdir /mnt/recipes
>   # mount /dev/nbd0 /mnt/recipes

Actually I think this would be /dev/nbd0p1 because nbdkit-floppy-plugin
makes a partitioned virtual disk.  You don't usually need to run
kpartx because the kernel will sniff partitions on the block device
when it is instantiated.

Rich.

> > Q: Wouter ( w@uter.be ) - Do the paths that you point to in the exportname
> > parameters exist?
> > R: YES its a directory with a bunch of images in it. YES - Non zero size.
> > 
> > pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/recipes/
> > y000_Pork_Belly_Wontan____TOCOST.rtf              y011_Rack_And_Black.rtf
> > y002_Salmon_Parfait_Forest_Rosemary_Bread_LE.rtf 
> > y021_StoneAge_Beef_Taragon_Sauce____TOCOST.rtf
> > 
> > pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/images
> > 160g? of dough - 250C - 6m.jpg   20190228_163410_monkfish and red pepper
> > skewers.jpg
> > 20190629_202814_couscous w apricots.jpg              672_V_cheddar_gorgeous.jpg
> > 20181022_134259.jpg              20200124_152329_aubergine & pesto stuffing.jpg
> > 25_androll_into_pancakes.jpg 665 Celeriac & Cockscombe Mint Soup.jpg
> > 
> > pi@rpi-C3:~ $ ls /home/pi/media/500G_FAITH/movies
> > NA #015 - Bread.mp4
> > NA #016 - Fisetin - Mayo Clinic Trials.mp4
> > NA #042 - Delta Variant COVID.mp4
> > NA #044 - Lex Fridman.mp4
> > 
> > pi@rpi-C3:~ $ ls -la /home/pi/media/500G_FAITH/logs
> > -rw------- 1 pi pi     56 Aug 26 17:00 log_images
> > -rw------- 1 pi pi     56 Aug 26 17:00 log_movie
> > -rw------- 1 pi pi    700 Aug 26 17:35 log_recipes
> > 
> > pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_images
> > %`?%`?
> > 
> > pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_movie
> > %`?%`?
> > 
> > pi@rpi-C3:~ $ cat /home/pi/media/500G_FAITH/logs/log_recipes
> > %`?`%`?a%`?b%`?c%`?d%`?e%`?f%`?g%`?h%`?i%`?j%`?k%`?l%`?%`?%`?%`?%`?%`?%`?%`?%`%
> > `? %`?
> > 
> > pi@rpi-C3:~ $ nbdkit --version
> > nbdkit 1.1.12
> > 
> > 
> > == client side
> > 
> > Note: Richard ( rjones@redhat.com ) - Use the 'nbdinfo' tool to examine what is
> > being served by an NBD
> > server.  It can query all sorts of information as described in the manual:
> > R: Built the tool. - here is what it says : /
> > 
> > pi@rpi-C1:~ $ nbdinfo nbd://192.168.1.14:10809/recipes
> > protocol: newstyle-fixed without TLS
> > export="recipes":
> > export-size: 4096
> > uri: nbd://192.168.1.14:10809/recipes
> > is_rotational: false
> > is_read_only: true
> > can_cache: false
> > can_df: false
> > can_fast_zero: false
> > can_flush: false
> > can_fua: false
> > can_multi_conn: true
> > can_trim: false
> > can_zero: true
> 
> This looks like a good "recipes" export, although the size is
> unusually small (4K), which is probably because what you're exporting
> here is the directory inode, not the directory - see above.
> 
> > pi@rpi-C1:~ $ nbdkit --version
> > nbdkit 1.10.3
> > 
> > pi@rpi-C1:~ $ nbd-client -l 192.168.1.14
> > Negotiation: ..
> > images
> > recipes
> > movie
> 
> nbdinfo can also list exports using the --list option which will tell
> you a lot of detail about every export.
> 
> > pi@rpi-C1:~ $ sudo modprobe nbd
> > pi@rpi-C1:~ $ lsmod | grep nbd
> > nbd                    49152  0
> > 
> > pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N recipes /dev/nbd0
> > Negotiation: ..size = 0MB
> > Connected /dev/nbd0
> > 
> > pi@rpi-C1:~ $ sudo partx -a /dev/nbd0
> > partx: /dev/nbd0: failed to read partition table
> > 
> > pi@rpi-C1:~ $ sudo parted -l
> > Error: /dev/nbd0: unrecognised disk label
> > Model: Unknown (unknown)                                                  
> > Disk /dev/nbd0: 4096B
> > Sector size (logical/physical): 512B/512B
> > Partition Table: unknown
> > Disk Flags: 
> > 
> > pi@rpi-C1:~ $ dmesg | tail -n 20
> > [ 2138.454532] blk_update_request: I/O error, dev nbd0, sector 0 op 0x0:(READ)
> > flags 0x0 phys_seg 1 prio class 0
> > [ 2138.454547] Buffer I/O error on dev nbd0, logical block 0, async page read
> > [ 2138.457380] block nbd0: Other side returned error (22)
> > [ 2138.457497] blk_update_request: I/O error, dev nbd0, sector 0 op 0x0:(READ)
> > flags 0x0 phys_seg 1 prio class 0
> > [ 2138.457520] Buffer I/O error on dev nbd0, logical block 0, async page read
> > [ 2138.459238] block nbd0: Other side returned error (22)
> > [ 2138.459280] blk_update_request: I/O error, dev nbd0, sector 0 op 0x0:(READ)
> > flags 0x0 phys_seg 1 prio class 0
> > [ 2138.459297] Buffer I/O error on dev nbd0, logical block 0, async page read
> > [ 2138.460993] block nbd0: Other side returned error (22)
> > [ 2138.461023] blk_update_request: I/O error, dev nbd0, sector 0 op 0x0:(READ)
> > flags 0x0 phys_seg 1 prio class 0
> > [ 2138.461038] Buffer I/O error on dev nbd0, logical block 0, async page read
> > [ 2138.462649] block nbd0: Other side returned error (22)
> > [ 2138.462685] Buffer I/O error on dev nbd0, logical block 0, async page read
> > [ 2138.464344] block nbd0: Other side returned error (22)
> > [ 2138.466926] block nbd0: Other side returned error (22)
> > [ 2138.468506] block nbd0: Other side returned error (22)
> > [ 2138.470066] block nbd0: Other side returned error (22)
> > [ 2138.471442] block nbd0: Other side returned error (22)
> > [ 2138.472978] block nbd0: Other side returned error (22)
> > [ 2138.474448] block nbd0: Other side returned error (22)
> > 
> > pi@rpi-C1:~ $ sudo nbd-client 192.168.1.14 10809 -N movies /dev/nbd1
> > Negotiation: ..Error: E: server does not support NBD_OPT_GO and dropped
> > connection after sending NBD_OPT_EXPORT_NAME. Try -g.
> > Exiting.
> > 
> > I'm attempting to serve non empty directories so I don't know why it's saying
> > 0Mb size?
> > Scratching my head here . . any thoughts? :/
> 
> Rich.
> 
> > Thanks in advance,
> > Simon
> > 
> > 
> >     On 12 Aug 2021, at 22:32, Richard W.M. Jones <rjones@redhat.com> wrote:
> > 
> >     On Thu, Jul 22, 2021 at 01:41:00PM +0100, Simon Fernandez wrote:
> > 
> >         Hi folks,
> >         I’m trying setup a client that connect to a 500Gb ext4 disk on another
> >         machine
> >         running nbd server.
> >         Server: raspberry pi 3: uname -r 4.19.66+
> >         Client: raspberry pi 3: uname -r 5.10.17-v7+
> > 
> >         I’ve followed the information here [https://github.com/
> >         NetworkBlockDevice/nbd]
> >         and a lot of other sites but I think I’m doing something wrong on the
> >         server
> >         setup because I get this on the client:
> > 
> >         $ sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
> >         mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2
> > 
> >         Also it appears to be listening on default port - NOT ones specified in
> >         config
> >         file.
> > 
> >         This is how I’ve set up the server & client, it’s probably something
> >         obvious to
> >         more experienced folk.
> > 
> > 
> >     Wouter has answered this already, I just wanted to add a couple of
> >     smaller points:
> > 
> >     (1) You don't need to serve each export on a separate port.  The NBD
> >     protocol can serve multiple exports (disks) on the same port, with the
> >     client requesting which one it wants.
> > 
> >     (2) Use the 'nbdinfo' tool to examine what is being served by an NBD
> >     server.  It can query all sorts of information as described in the
> >     manual:
> >     https://libguestfs.org/nbdinfo.1.html
> > 
> >     Rich.
> > 
> > 
> >         == rpi-C3 (192.168.1.14) server setup
> > 
> >             sudo apt-get update
> >             sudo apt-get install nbd-server
> >             sudo nano /etc/nbd-server/config 
> > 
> >         [generic]
> >         # If you want to run everything as root rather than the nbd user, you
> >         # may either say "root" in the two following lines, or remove them
> >         # altogether. Do not remove the [generic] section, however.
> >                user = nbd
> >                group = nbd
> >                includedir = /etc/nbd-server/conf.d
> >                allowlist = true
> > 
> >         # What follows are export definitions. You may create as much of them
> >         as
> >         # you want, but the section header has to be unique.
> >         [images]
> >                exportname = /home/pi/media/500G_FAITH/images
> >                port = 510029
> >         [recipes]
> >                exportname = /home/pi/media/500G_FAITH/recipes
> >                port = 510030
> >         [movie]
> >                exportname = /home/pi/media/500G_FAITH/movies
> >                port = 510031
> > 
> >             sudo modprobe nbd # NOT nbd-server!
> >             lsmod | grep nbd
> > 
> >         nbd                    40960  0
> > 
> >             sudo service nbd-server force-reload # if already running
> > 
> > 
> >         == client side
> > 
> >             sudo apt-get install nbd-client # done
> >             sudo modprobe nbd
> >             nbd-client 192.168.1.14 -l
> > 
> >         Negotiation: ..
> >         images
> >         recipes
> >         movie
> > 
> >             sudo nbd-client 192.168.1.14 -N recipes /dev/nbd2
> > 
> >         Negotiation: ..size = 0MB
> >         Connected /dev/nbd2
> > 
> >             sudo nbd-client 192.168.1.14 -N movie /dev/nbd3
> > 
> >         Negotiation: ..size = 0MB
> >         Connected /dev/nbd3
> > 
> >             sudo nbd-client 192.168.1.14 -N images /dev/nbd1
> > 
> >         Negotiation: ..size = 0MB
> >         Connected /dev/nbd1
> > 
> > 
> >             dmesg | tail -n 10
> > 
> >         [ 1417.883364] Buffer I/O error on dev nbd1, logical block 0, async
> >         page read
> >         [ 1417.884614] block nbd1: Other side returned error (22)
> >         [ 1417.884652] blk_update_request: I/O error, dev nbd1, sector 0 op
> >         0x0:(READ)
> >         flags 0x0 phys_seg 1 prio class 0
> >         [ 1417.884673] Buffer I/O error on dev nbd1, logical block 0, async
> >         page read
> >         [ 1417.885977] block nbd1: Other side returned error (22)
> >         [ 1417.886016] blk_update_request: I/O error, dev nbd1, sector 0 op
> >         0x0:(READ)
> >         flags 0x0 phys_seg 1 prio class 0
> >         [ 1417.886036] Buffer I/O error on dev nbd1, logical block 0, async
> >         page read
> >         [ 1417.887276] block nbd1: Other side returned error (22)
> >         [ 1417.888492] block nbd1: Other side returned error (22)
> >         [ 1417.889751] block nbd1: Other side returned error (22)
> > 
> >             sudo nbd-client 192.168.1.14 -d /dev/nbd1 # thought it might be
> >             something to
> > 
> >         do w/ nbd1
> > 
> >             sudo nbd-client 192.168.1.14 -N images /dev/nbd4
> > 
> >         Negotiation: ..size = 0MB
> >         Connected /dev/nbd4
> > 
> >             dmesg | tail -n 10
> > 
> >         [ 1848.831897] block nbd4: Other side returned error (22)
> >         [ 1848.833341] block nbd4: Other side returned error (22)
> >         [ 1848.834651] block nbd4: Other side returned error (22)
> >         [ 1848.836002] block nbd4: Other side returned error (22)
> > 
> >             lsblk -f
> > 
> >         NAME        FSTYPE  LABEL         UUID
> >                                         FSAVAIL
> >         FSUSE% MOUNTPOINT
> >         sda
> >                                                                                   
> > 
> >         ├─sda1      vfat    EFI           67E3-17ED
> >                                           
> > 
> >         └─sda2      hfsplus time_box_2018 f6427a3d-363b-3284-88c4-03ce3493aeff
> >          115.5G 
> >          94% /media/pi/time_box_2018
> >         nbd2
> >                                                                                  
> > 
> >         nbd3
> >                                                                                  
> > 
> >         nbd4
> >                                                                                  
> > 
> >         mmcblk0
> >                                                                               
> > 
> >         ├─mmcblk0p1 vfat    boot          5DE4-665C
> >                                     203.4M 
> >          19% /boot
> >         └─mmcblk0p2 ext4    rootfs        7295bbc3-bbc2-4267-9fa0-099e10ef5bf0
> >            4.1G 
> >          37% /
> > 
> >             dmesg | tail -n 10
> > 
> >         [ 1848.836002] block nbd4: Other side returned error (22)
> >         [ 1848.837430] block nbd4: Other side returned error (22)
> >         [ 1848.838860] block nbd4: Other side returned error (22)
> >         [ 1848.840224] block nbd4: Other side returned error (22)
> >         [ 1848.841691] block nbd4: Other side returned error (22)
> >         [ 1848.843077] block nbd4: Other side returned error (22)
> >         [ 1848.844415] block nbd4: Other side returned error (22)
> >         [ 2802.615037] block nbd3: Receive control failed (result -32)
> >         [ 2802.625871] block nbd2: Receive control failed (result -32)
> >         [ 2802.648444] block nbd4: Receive control failed (result -32)
> > 
> >             ls /home/pi/Vols/
> > 
> >         nbd1-recipes/    rpi-C2-nbd-500G/ tbx2018/         time_box_2018/   
> > 
> >             sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
> > 
> >         mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2.
> > 
> >             sudo parted -l
> > 
> >         Model: Seagate BUP Slim SL (scsi)
> >         Disk /dev/sda: 2000GB
> >         Sector size (logical/physical): 512B/512B
> >         Partition Table: gpt
> >         Disk Flags: 
> > 
> >         Number  Start   End     Size    File system  Name
> >                          Flags
> >         1      20.5kB  210MB   210MB   fat32        EFI System Partition  boot,
> >         esp
> >         2      210MB   2000GB  2000GB  hfs+         time_box_2018
> > 
> > 
> >         Error: /dev/nbd3: unrecognised disk label
> >         Model: Unknown (unknown)
> >                                                          
> >         Disk /dev/nbd3: 4096B
> >         Sector size (logical/physical): 512B/512B
> >         Partition Table: unknown
> >         Disk Flags: 
> > 
> >         Error: /dev/nbd4: unrecognised disk label
> >         Model: Unknown (unknown)
> >                                                          
> >         Disk /dev/nbd4: 4096B
> >         Sector size (logical/physical): 512B/512B
> >         Partition Table: unknown
> >         Disk Flags: 
> > 
> >         Error: /dev/nbd2: unrecognised disk label
> >         Model: Unknown (unknown)
> >                                                          
> >         Disk /dev/nbd2: 4096B
> >         Sector size (logical/physical): 512B/512B
> >         Partition Table: unknown
> >         Disk Flags: 
> > 
> >         Model: SD SL08G (sd/mmc)
> >         Disk /dev/mmcblk0: 7948MB
> >         Sector size (logical/physical): 512B/512B
> >         Partition Table: msdos
> >         Disk Flags: 
> > 
> >         Number  Start   End     Size    Type     File system  Flags
> >         1      4194kB  273MB   268MB   primary  fat32        lba
> >         2      273MB   7948MB  7676MB  primary  ext4
> > 
> >         I’ve been trying to get them to talk for 2 days now 
> >         One thing I did notice is that the port numbers in the config file
> >         don’t seem
> >         to change the fact it’s listening on he default port??
> > 
> >         $ sudo lsof -i -P -n | grep LISTEN
> >         COMMAND    PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
> >         cnid_meta  312    root    3u  IPv6  11170      0t0  TCP [::1]:4700
> >         (LISTEN)
> >         afpd       324    root    3u  IPv4  11195      0t0  TCP *:548 (LISTEN)
> >         sshd       426    root    3u  IPv4  12126      0t0  TCP *:22 (LISTEN)
> >         sshd       426    root    4u  IPv6  12128      0t0  TCP *:22 (LISTEN)
> >         dnsmasq    431 dnsmasq    5u  IPv4  12046      0t0  TCP *:53 (LISTEN)
> >         dnsmasq    431 dnsmasq    7u  IPv6  12048      0t0  TCP *:53 (LISTEN)
> >         nbd-serve 2026     nbd    3u  IPv6  20100      0t0  TCP *:10809
> >         (LISTEN)
> > 
> >         I’d be very grateful for any pointers, or other resources that my be of
> >         help.
> >         Thanks in advance,
> >         Simon
> > 
> > 
> > 
> > 
> > 
> > 
> >     -- 
> >     Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/
> >     ~rjones
> >     Read my programming and virtualization blog: http://rwmj.wordpress.com
> >     virt-top is 'top' for virtual machines.  Tiny program with many
> >     powerful monitoring features, net stats, disk stats, logging, etc.
> >     http://people.redhat.com/~rjones/virt-top
> > 
> > 
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-top is 'top' for virtual machines.  Tiny program with many
> powerful monitoring features, net stats, disk stats, logging, etc.
> http://people.redhat.com/~rjones/virt-top

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

