Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D110B3EAC75
	for <lists+nbd@lfdr.de>; Thu, 12 Aug 2021 23:40:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6F90C203C8; Thu, 12 Aug 2021 21:40:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 12 21:40:21 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 961EE203A3
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Aug 2021 21:40:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.275 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z_7Pl6fPFckF for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Aug 2021 21:40:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 432 seconds by postgrey-1.36 at bendel; Thu, 12 Aug 2021 21:40:06 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id C43B22039E
	for <nbd@other.debian.org>; Thu, 12 Aug 2021 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628804401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IT6UNYYCijtNuydPG6ueZKxXHnw+lBXCU0f2Iq4Dc8=;
	b=JDHd2MPd/ZNmcnKh845V5vxl31Dx2QL9u14oGib/ObxA1AZlyXP1znms1MR2CglONdqRAK
	10EYyciVVgSovyzQv2sBEVxD9BULz9yi+HP3dX/DgBNCfrpMtYR1FbUiDPj/vBRWJoiIcQ
	XinX6zn8hB6nqPqcg+Q6EN0aZM1HsNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-gOWXJvC_Nm6w51miW8knJw-1; Thu, 12 Aug 2021 17:32:46 -0400
X-MC-Unique: gOWXJvC_Nm6w51miW8knJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FD2108292F;
	Thu, 12 Aug 2021 21:32:44 +0000 (UTC)
Received: from localhost (unknown [10.39.193.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C5D22B3BB;
	Thu, 12 Aug 2021 21:32:43 +0000 (UTC)
Date: Thu, 12 Aug 2021 22:32:41 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Simon Fernandez <fernandez.simon@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Setting up NBD server / client - block nbd4: Other side returned
 error (22) issue
Message-ID: <20210812213241.GA4067@redhat.com>
References: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
MIME-Version: 1.0
In-Reply-To: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mLNAAX8RwkC.A.LMH.FVZFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1279
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210812213241.GA4067@redhat.com
Resent-Date: Thu, 12 Aug 2021 21:40:21 +0000 (UTC)

On Thu, Jul 22, 2021 at 01:41:00PM +0100, Simon Fernandez wrote:
> Hi folks,
> I’m trying setup a client that connect to a 500Gb ext4 disk on another machine
> running nbd server.
> Server: raspberry pi 3: uname -r 4.19.66+
> Client: raspberry pi 3: uname -r 5.10.17-v7+
> 
> I’ve followed the information here [https://github.com/NetworkBlockDevice/nbd]
> and a lot of other sites but I think I’m doing something wrong on the server
> setup because I get this on the client:
> 
> $ sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
> mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2
> 
> Also it appears to be listening on default port - NOT ones specified in config
> file.
> 
> This is how I’ve set up the server & client, it’s probably something obvious to
> more experienced folk.

Wouter has answered this already, I just wanted to add a couple of
smaller points:

(1) You don't need to serve each export on a separate port.  The NBD
protocol can serve multiple exports (disks) on the same port, with the
client requesting which one it wants.

(2) Use the 'nbdinfo' tool to examine what is being served by an NBD
server.  It can query all sorts of information as described in the
manual:
https://libguestfs.org/nbdinfo.1.html

Rich.

> == rpi-C3 (192.168.1.14) server setup
> > sudo apt-get update
> > sudo apt-get install nbd-server
> > sudo nano /etc/nbd-server/config 
> [generic]
> # If you want to run everything as root rather than the nbd user, you
> # may either say "root" in the two following lines, or remove them
> # altogether. Do not remove the [generic] section, however.
>         user = nbd
>         group = nbd
>         includedir = /etc/nbd-server/conf.d
>         allowlist = true
> 
> # What follows are export definitions. You may create as much of them as
> # you want, but the section header has to be unique.
> [images]
>         exportname = /home/pi/media/500G_FAITH/images
>         port = 510029
> [recipes]
>         exportname = /home/pi/media/500G_FAITH/recipes
>         port = 510030
> [movie]
>         exportname = /home/pi/media/500G_FAITH/movies
>         port = 510031
> > sudo modprobe nbd # NOT nbd-server!
> > lsmod | grep nbd
> nbd                    40960  0
> > sudo service nbd-server force-reload # if already running
> 
> == client side
> > sudo apt-get install nbd-client # done
> > sudo modprobe nbd
> > nbd-client 192.168.1.14 -l
> Negotiation: ..
> images
> recipes
> movie
> > sudo nbd-client 192.168.1.14 -N recipes /dev/nbd2
> Negotiation: ..size = 0MB
> Connected /dev/nbd2
> > sudo nbd-client 192.168.1.14 -N movie /dev/nbd3
> Negotiation: ..size = 0MB
> Connected /dev/nbd3
> > sudo nbd-client 192.168.1.14 -N images /dev/nbd1
> Negotiation: ..size = 0MB
> Connected /dev/nbd1
> 
> > dmesg | tail -n 10
> [ 1417.883364] Buffer I/O error on dev nbd1, logical block 0, async page read
> [ 1417.884614] block nbd1: Other side returned error (22)
> [ 1417.884652] blk_update_request: I/O error, dev nbd1, sector 0 op 0x0:(READ)
> flags 0x0 phys_seg 1 prio class 0
> [ 1417.884673] Buffer I/O error on dev nbd1, logical block 0, async page read
> [ 1417.885977] block nbd1: Other side returned error (22)
> [ 1417.886016] blk_update_request: I/O error, dev nbd1, sector 0 op 0x0:(READ)
> flags 0x0 phys_seg 1 prio class 0
> [ 1417.886036] Buffer I/O error on dev nbd1, logical block 0, async page read
> [ 1417.887276] block nbd1: Other side returned error (22)
> [ 1417.888492] block nbd1: Other side returned error (22)
> [ 1417.889751] block nbd1: Other side returned error (22)
> > sudo nbd-client 192.168.1.14 -d /dev/nbd1 # thought it might be something to
> do w/ nbd1
> > sudo nbd-client 192.168.1.14 -N images /dev/nbd4
> Negotiation: ..size = 0MB
> Connected /dev/nbd4
> > dmesg | tail -n 10
> [ 1848.831897] block nbd4: Other side returned error (22)
> [ 1848.833341] block nbd4: Other side returned error (22)
> [ 1848.834651] block nbd4: Other side returned error (22)
> [ 1848.836002] block nbd4: Other side returned error (22)
> > lsblk -f
> NAME        FSTYPE  LABEL         UUID                                 FSAVAIL
> FSUSE% MOUNTPOINT
> sda                                                                           
>        
> ├─sda1      vfat    EFI           67E3-17ED                                   
>        
> └─sda2      hfsplus time_box_2018 f6427a3d-363b-3284-88c4-03ce3493aeff  115.5G 
>   94% /media/pi/time_box_2018
> nbd2                                                                          
>        
> nbd3                                                                          
>        
> nbd4                                                                          
>        
> mmcblk0                                                                       
>        
> ├─mmcblk0p1 vfat    boot          5DE4-665C                             203.4M 
>   19% /boot
> └─mmcblk0p2 ext4    rootfs        7295bbc3-bbc2-4267-9fa0-099e10ef5bf0    4.1G 
>   37% /
> > dmesg | tail -n 10
> [ 1848.836002] block nbd4: Other side returned error (22)
> [ 1848.837430] block nbd4: Other side returned error (22)
> [ 1848.838860] block nbd4: Other side returned error (22)
> [ 1848.840224] block nbd4: Other side returned error (22)
> [ 1848.841691] block nbd4: Other side returned error (22)
> [ 1848.843077] block nbd4: Other side returned error (22)
> [ 1848.844415] block nbd4: Other side returned error (22)
> [ 2802.615037] block nbd3: Receive control failed (result -32)
> [ 2802.625871] block nbd2: Receive control failed (result -32)
> [ 2802.648444] block nbd4: Receive control failed (result -32)
> > ls /home/pi/Vols/
> nbd1-recipes/    rpi-C2-nbd-500G/ tbx2018/         time_box_2018/   
> > sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
> mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2.
> > sudo parted -l
> Model: Seagate BUP Slim SL (scsi)
> Disk /dev/sda: 2000GB
> Sector size (logical/physical): 512B/512B
> Partition Table: gpt
> Disk Flags: 
> 
> Number  Start   End     Size    File system  Name                  Flags
>  1      20.5kB  210MB   210MB   fat32        EFI System Partition  boot, esp
>  2      210MB   2000GB  2000GB  hfs+         time_box_2018
> 
> 
> Error: /dev/nbd3: unrecognised disk label
> Model: Unknown (unknown)                                                  
> Disk /dev/nbd3: 4096B
> Sector size (logical/physical): 512B/512B
> Partition Table: unknown
> Disk Flags: 
> 
> Error: /dev/nbd4: unrecognised disk label
> Model: Unknown (unknown)                                                  
> Disk /dev/nbd4: 4096B
> Sector size (logical/physical): 512B/512B
> Partition Table: unknown
> Disk Flags: 
> 
> Error: /dev/nbd2: unrecognised disk label
> Model: Unknown (unknown)                                                  
> Disk /dev/nbd2: 4096B
> Sector size (logical/physical): 512B/512B
> Partition Table: unknown
> Disk Flags: 
> 
> Model: SD SL08G (sd/mmc)
> Disk /dev/mmcblk0: 7948MB
> Sector size (logical/physical): 512B/512B
> Partition Table: msdos
> Disk Flags: 
> 
> Number  Start   End     Size    Type     File system  Flags
>  1      4194kB  273MB   268MB   primary  fat32        lba
>  2      273MB   7948MB  7676MB  primary  ext4
> 
> I’ve been trying to get them to talk for 2 days now 
> One thing I did notice is that the port numbers in the config file don’t seem
> to change the fact it’s listening on he default port??
> 
> $ sudo lsof -i -P -n | grep LISTEN
> COMMAND    PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
> cnid_meta  312    root    3u  IPv6  11170      0t0  TCP [::1]:4700 (LISTEN)
> afpd       324    root    3u  IPv4  11195      0t0  TCP *:548 (LISTEN)
> sshd       426    root    3u  IPv4  12126      0t0  TCP *:22 (LISTEN)
> sshd       426    root    4u  IPv6  12128      0t0  TCP *:22 (LISTEN)
> dnsmasq    431 dnsmasq    5u  IPv4  12046      0t0  TCP *:53 (LISTEN)
> dnsmasq    431 dnsmasq    7u  IPv6  12048      0t0  TCP *:53 (LISTEN)
> nbd-serve 2026     nbd    3u  IPv6  20100      0t0  TCP *:10809 (LISTEN)
> 
> I’d be very grateful for any pointers, or other resources that my be of help.
> Thanks in advance,
> Simon
> 
> 
> 
> 

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

