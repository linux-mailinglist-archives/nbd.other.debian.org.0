Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C8A41889
	for <lists+nbd@lfdr.de>; Mon, 24 Feb 2025 10:16:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0FCED20595; Mon, 24 Feb 2025 09:16:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 24 09:16:13 2025
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 08E382056C
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Feb 2025 09:16:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t_s9kgOV90_N for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Feb 2025 09:16:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0BDD620564
	for <nbd@other.debian.org>; Mon, 24 Feb 2025 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7rTJxRHxdBE2qicRw4ofRCz6Hf+a9YdsNnbwytkS0uo=; b=jXi3inwkewOux+RGbVXqI+X3Di
	mi1nguu+y0UlH6Wu7FqMeZUOFAEg/nIqTWAEcBeOWE44jP7kn/z+FqaSBARvwtIY59MT7nggaOBQZ
	3Sq8v1QKFegd+nRWpfp2FV5DINpuWoKVenvrO3NWA4hFhljzEOkCJDeo25PZk9tm1CsblVKuhph6X
	KPuWwFkhqCvfza0A+450qSqsY0dCGmrA0EUW0zMYqxD7bMV9JlKSqwxfd++Bvo9hEiLB9EyHMHQcU
	GKHe8koh1dUWYY679xkahZv0AEJEGJmLm7VSfyDHas9Tzs8g9PnwwnHOi83NRTfCp5kAW6LDM7kj8
	xNRzh4kQ==;
Received: from [102.39.140.57] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1tmUZA-0025t6-2T;
	Mon, 24 Feb 2025 10:15:56 +0100
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1tmUWu-00000001X6i-44Yz;
	Mon, 24 Feb 2025 11:13:36 +0200
Date: Mon, 24 Feb 2025 11:13:36 +0200
From: Wouter Verhelst <w@uter.be>
To: Thomas Pellegatta <boitutile@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Failed to netboot NBD rootfs
Message-ID: <Z7w4QFm5OnPjsnbd@pc220518.home.grep.be>
References: <5537C251-DD61-4457-88F2-45EDADE94F85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5537C251-DD61-4457-88F2-45EDADE94F85@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2-S6CCkzG2E.A.XHSC.djDvnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3372
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z7w4QFm5OnPjsnbd@pc220518.home.grep.be
Resent-Date: Mon, 24 Feb 2025 09:16:13 +0000 (UTC)

On Thu, Feb 06, 2025 at 04:07:28PM +0100, Thomas Pellegatta wrote:
>    Hello,
> 
>    I can’t find any solution on the internet so I’m reaching you by email.
> 
>    I’m trying to achieve netboot on one of my devices. To do so I made a
>    dedicated image:
> 
>    truncate -s 10G debian-nbd.img
> 
>    mkfs.btrfs debian-nbd.img
> 
>    sudo mount -t btrfs -o loop debian-nbd.img /mnt
> 
>    rsync -avPAHXxe path/to/existing/debian/rootfs /mnt
> 
>    sudo umount /mnt
> 
>    Then I created a NBD conf /etc/nbd-server/conf.d/diskless.conf:
> 
>    [node]
> 
>      exportname = /path/to/debian-nbd.img
> 
>    And I edited /etc/nbd-server/config:
> 
>    [generic]
> 
>      user = root
> 
>      group = root

This misses an includedir option:

includedir = /etc/nbd-server/conf.d

Without that option, your "diskless.conf" is ignored, and thn obviously
the export is unknown.

Also, using the root user is the default, but I don't recommend it. It's
safer to use a non-root user and to grant read/write permissions for the
file you're trying to export.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

