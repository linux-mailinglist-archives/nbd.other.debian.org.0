Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EA82E9F90F8
	for <lists+nbd@lfdr.de>; Fri, 20 Dec 2024 12:12:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D32EA2055F; Fri, 20 Dec 2024 11:12:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec 20 11:12:30 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 328CB20585
	for <lists-other-nbd@bendel.debian.org>; Fri, 20 Dec 2024 11:12:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VjVOO4x1_lJJ for <lists-other-nbd@bendel.debian.org>;
	Fri, 20 Dec 2024 11:12:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1125 seconds by postgrey-1.36 at bendel; Fri, 20 Dec 2024 11:12:16 UTC
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B0C542056B
	for <nbd@other.debian.org>; Fri, 20 Dec 2024 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5zR6+Pag9akRP1lGYZSxOvIwpSRiTlh7c808LcjVmjM=; b=NggiKMf9h+of5KJxgrMhOc+LBU
	EkNBsdf0mUvdtbdW8bzdO2oD81yHivEbKCXI3HgVAvb8cRGaT/SxZq1y3INFbR9TT2DtWs1gDnHO0
	/qr/otZlQvGg2a/HeDjnC09Dnh8jYRwNUXtHT+F288pkFj+FnUxKvkeqzRdcdaZPm7yk0fut4Ul/J
	wSBmmJT/4Xcl3JIIFHg9j3DdsLO2agEYw1rTwWgLolUM4B/ETmjY/ucas5NdXauGNotgJ9tCGrtlQ
	//c1OTNtWXxGxNQZG6uTAhh9tB3d3mW0Ash59V+35i/xtduHLwkntXaF/gQZuYBil7eBwiOv6ZAg+
	DaOyqFsQ==;
Received: from [102.39.140.57] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1tOadM-000387-1B;
	Fri, 20 Dec 2024 11:53:28 +0100
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1tOadD-00000000IAy-2NnG;
	Fri, 20 Dec 2024 12:53:19 +0200
Date: Fri, 20 Dec 2024 12:53:19 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, stefanha@redhat.com
Subject: Re: [PATCH 0/2] Add support for setting netlink backend string
Message-ID: <Z2VMn__hjblWkLx-@pc220518.home.grep.be>
References: <20241119233057.2248038-1-eblake@redhat.com>
 <eurcm2jfmaynf4ycx3qqpmiojrtaewzog3znjwnhderza7txrt@4u7mh2gt7cuh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eurcm2jfmaynf4ycx3qqpmiojrtaewzog3znjwnhderza7txrt@4u7mh2gt7cuh>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AieGQ70efPG.A.wZeB.eEVZnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3202
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z2VMn__hjblWkLx-@pc220518.home.grep.be
Resent-Date: Fri, 20 Dec 2024 11:12:30 +0000 (UTC)

Hi Eric,

Sorry for the late reply; I was travelling a lot in the last two or so
months and had little time to look at things in my time off.

This looks good to me; please commit.

On Thu, Dec 12, 2024 at 12:36:22PM -0600, Eric Blake wrote:
> ping
> 
> This patch series is being added as a dependency to KubeSAN:
> https://gitlab.com/kubesan/kubesan/-/merge_requests/100/diffs?commit_id=89a370dcde
> https://quay.io/repository/kubesan/nbd-client-i
> 
> so it would be nice to have it upstream instead of in a one-off fork.
> 
> On Tue, Nov 19, 2024 at 05:27:27PM -0600, Eric Blake wrote:
> > Stefan Hajnoczi pointed out to me that since kernel 5.14 (commit
> > 6497ef8d in Apr 2021), the netlink interface has allowed userspace to
> > pass in an arbitrary backend string visible at
> > /sys/block/nbdN/backend, and which prevents the abuse of netlink to
> > arbitrarily reconfigure an active NBD connection to a different
> > backend, for some added safety when multiple threads might be racing
> > to create NBD devices.  Time to expose it in nbd-client, along with
> > first fixing some regressions along the way.
> > 
> > Eric Blake (2):
> >   nbd-client: Fix use without -N
> >   nbd-client: Add support for setting /sys/block/nbdN/backend
> > 
> >  .gitignore               |  1 +
> >  man/nbd-client.8.sgml.in | 24 +++++++++++++++++++++++-
> >  nbd-client.c             | 30 ++++++++++++++++++++++++------
> >  nbd-netlink.h            |  7 +++++--
> >  4 files changed, 53 insertions(+), 9 deletions(-)
> > 
> > -- 
> > 2.47.0
> > 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.
> Virtualization:  qemu.org | libguestfs.org
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

