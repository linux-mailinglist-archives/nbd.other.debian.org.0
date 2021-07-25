Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E103D4ACA
	for <lists+nbd@lfdr.de>; Sun, 25 Jul 2021 02:49:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5AA15204EC; Sun, 25 Jul 2021 00:49:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul 25 00:49:41 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3AC47204D8
	for <lists-other-nbd@bendel.debian.org>; Sun, 25 Jul 2021 00:49:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VfLdCqtq2haR for <lists-other-nbd@bendel.debian.org>;
	Sun, 25 Jul 2021 00:49:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F3845204CC
	for <nbd@other.debian.org>; Sun, 25 Jul 2021 00:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MU4JOIrfte+RfXi1sqv3xTz1ZgYBtkRanbJozJyFltA=; b=jrY7y2ikoa41t9YxhwiHGYeApK
	e2YlVFuna0FoBjTDVVQ3e/vrldQdYKBtjdLBk0AI4sDm8LMDEjS00mS0rq1uPslFHR/7NHfTW8xRm
	rdww1pegMahbV9xy9Fq6WH5hfiMu8diZTuTMQkfb/p/Gr7rAXmrYhu1UpHt0s9OgPDjIogdjYjxAL
	3I9ZDpS12LZqFGZR7FLmDAKhcg/aE0LMVHaWMomxeqbDpMGfM3aNHDKZiYpkr/ZMqNUQwdwICq6Ru
	ZUaXjHJgLqewwVoUgECVVWtz+6t/wK6pmHpOiSIqoYOqeixmwnmBXRPZmMr2pFu/fbr9qwu5xmg+3
	Jcma24SA==;
Received: from [102.39.40.85] (helo=pc181009)
	by lounge.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1m7SKa-0007pS-6O; Sun, 25 Jul 2021 02:49:24 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1m7SKR-001uvT-JK; Sun, 25 Jul 2021 02:49:15 +0200
Date: Sun, 25 Jul 2021 02:49:15 +0200
From: Wouter Verhelst <w@uter.be>
To: Simon Fernandez <fernandez.simon@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Setting up NBD server / client - block nbd4: Other side returned
 error (22) issue
Message-ID: <YPy1Cwr4fw13Rb66@pc181009.grep.be>
References: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <toC4y42N7IK.A.jhE.lUL_gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1225
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YPy1Cwr4fw13Rb66@pc181009.grep.be
Resent-Date: Sun, 25 Jul 2021 00:49:41 +0000 (UTC)

Hi Simon,

On Thu, Jul 22, 2021 at 01:41:00PM +0100, Simon Fernandez wrote:
>    Hi folks,
>    I’m trying setup a client that connect to a 500Gb ext4 disk on another
>    machine running nbd server.
>    Server: raspberry pi 3: uname -r 4.19.66+
>    Client: raspberry pi 3: uname -r 5.10.17-v7+
>    I’ve followed the
>    information here [https://github.com/NetworkBlockDevice/nbd] and a lot of
>    other sites but I think I’m doing something wrong on the server setup
>    because I get this on the client:
>    $ sudo mount /dev/nbd2 /home/pi/Vols/nbd1-recipes/
>    mount: /home/pi/Vols/nbd1-recipes: can't read superblock on /dev/nbd2
>    Also it appears to be listening on default port - NOT ones specified
>    in config file.
>    This is how I’ve set up the server & client, it’s probably something
>    obvious to more experienced folk.
>    == rpi-C3 (192.168.1.14) server setup
>    > sudo apt-get update
>    > sudo apt-get install nbd-server
>    > sudo nano /etc/nbd-server/config 
>    [generic]
>    # If you want to run everything as root rather than the nbd user, you
>    # may either say "root" in the two following lines, or remove them
>    # altogether. Do not remove the [generic] section, however.
>            user = nbd
>            group = nbd
>            includedir = /etc/nbd-server/conf.d
>            allowlist = true
>    # What follows are export definitions. You may create as much of them as
>    # you want, but the section header has to be unique.
>    [images]
>            exportname = /home/pi/media/500G_FAITH/images
>            port = 510029

The per-export port numbers are no longer supported. You should see a
warning about that in syslog when you start nbd-server.

>    [recipes]
>            exportname = /home/pi/media/500G_FAITH/recipes
>            port = 510030
>    [movie]
>            exportname = /home/pi/media/500G_FAITH/movies
>            port = 510031
>    > sudo modprobe nbd  # NOT nbd-server!
>    > lsmod | grep nbd
>    nbd                    40960  0
>    > sudo service nbd-server force-reload  # if already running
>    == client side
>    > sudo apt-get install nbd-client  # done
>    > sudo modprobe nbd
>    > nbd-client 192.168.1.14 -l
>    Negotiation: ..
>    images
>    recipes
>    movie
>    > sudo nbd-client 192.168.1.14 -N recipes /dev/nbd2
>    Negotiation: ..size = 0MB
>    Connected /dev/nbd2
>    > sudo nbd-client 192.168.1.14 -N movie /dev/nbd3
>    Negotiation: ..size = 0MB
>    Connected /dev/nbd3
>    > sudo nbd-client 192.168.1.14 -N images /dev/nbd1
>    Negotiation: ..size = 0MB
>    Connected /dev/nbd1

These all show that the export is 0 bytes large.

Do the paths that you point to in the exportname parameters exist? Are
they files? Are they readable and writable by the "nbd" user? Do they
have a non-zero size?

If the answer to any of these is "no", then that's your problem.

Note that you can also have nbd-server create the exported files on the
fly if you specify a wanted size; see the "filesize" parameter for that.

>    > dmesg | tail -n 10
>    [ 1417.883364] Buffer I/O error on dev nbd1, logical block 0, async page
>    read
>    [ 1417.884614] block nbd1: Other side returned error (22)

Error 22 is NBD_EINVAL. It is expected that you receive that, if you
connect a zero-sized NBD device, because all reads with a non-zero
offset will go beyond the end of the device, and that is an invalid
request.

Everything else you try returns that error, for the same reason.

[...]
>    I’d be very grateful for any pointers, or other resources that my be of
>    help.

Hope that helped,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

