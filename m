Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A03D495
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2019 19:50:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 76786203F1; Tue, 11 Jun 2019 17:50:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 17:50:52 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 45EE8203DA
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2019 17:50:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QA0Trha8IeJ7 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2019 17:50:41 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D829B203A9
	for <nbd@other.debian.org>; Tue, 11 Jun 2019 17:50:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AAB93162919;
	Tue, 11 Jun 2019 17:50:37 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DDA62B58F;
	Tue, 11 Jun 2019 17:50:35 +0000 (UTC)
Date: Tue, 11 Jun 2019 18:50:34 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <wouter@grep.be>
Cc: nbd@other.debian.org, w@uter.be, eblake@redhat.com, berrange@redhat.com,
	mkletzan@redhat.com
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190611175034.GR3888@redhat.com>
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
 <20190611132903.5e2vdq2ng27vlhtd@grep.be>
 <20190611135147.GO3888@redhat.com>
 <20190611174038.bggo3rdmxrq5p3kl@grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611174038.bggo3rdmxrq5p3kl@grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 11 Jun 2019 17:50:37 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EBgRpH5SLzM.A.MKB.8n-_cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/577
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190611175034.GR3888@redhat.com
Resent-Date: Tue, 11 Jun 2019 17:50:52 +0000 (UTC)

On Tue, Jun 11, 2019 at 07:40:38PM +0200, Wouter Verhelst wrote:
> [1] theoretically it should be possible to detect the oldstyle magic
>     number and fall back to oldstyle if supported, but that's a bit ugly
>     and I don't want to write that in stone for clients/libraries that
>     support it.

This is in fact what libnbd does :-)

https://github.com/libguestfs/libnbd/blob/4026742c751ed42b5f96c12a5ae7bdb4a6c82b1e/generator/states-magic.c#L45-L53

However I totally take your more general points that (a) newstyle
should be preferred in all circumstances and (b) we shouldn't require
clients to implement oldstyle.  Hopefully nothing in the URI document
should imply that.

But I don't think we need to add the protocol version to the URI
because it can be easily detected in clients that support that, and
other clients will just error out when they see a non-supported
version.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

