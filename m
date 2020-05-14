Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF411D2C1A
	for <lists+nbd@lfdr.de>; Thu, 14 May 2020 12:04:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8F9AD2039B; Thu, 14 May 2020 10:04:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 14 10:04:11 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B25742038A
	for <lists-other-nbd@bendel.debian.org>; Thu, 14 May 2020 10:04:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.202 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KVBPJqwDLDNe for <lists-other-nbd@bendel.debian.org>;
	Thu, 14 May 2020 10:03:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id EC2742026A
	for <nbd@other.debian.org>; Thu, 14 May 2020 10:03:58 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589450633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=cSFZwUg+63NtN4frq2oOy6EahVjDHLZVr3M1yfDgl/Q=;
	b=NTY5nw5xkMVCjP/b7kUgQLdV9Orx0EiF8FFkSlGIVXsz8I2qqtaOyKBv9H+Oqr4SQ6uuXg
	vMM6Bm4wDCj9yD4Lq5/ljFutCQGyws6IRLb145S/g5Fiu9K/vEB88Q7vgFZrQuguAMVpEq
	ugIAy8woMJud2+rk32524XyzaTR+k68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-BJwWtKWtPGys2ttUOkW1uA-1; Thu, 14 May 2020 06:03:50 -0400
X-MC-Unique: BJwWtKWtPGys2ttUOkW1uA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38035835B44
	for <nbd@other.debian.org>; Thu, 14 May 2020 10:03:49 +0000 (UTC)
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7E4E7529E
	for <nbd@other.debian.org>; Thu, 14 May 2020 10:03:48 +0000 (UTC)
Date: Thu, 14 May 2020 11:03:47 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: nbd@other.debian.org
Subject: Wikipedia page
Message-ID: <20200514100347.GA12100@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MLXyHRadPgF.A.0OF.beRveB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/878
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200514100347.GA12100@redhat.com
Resent-Date: Thu, 14 May 2020 10:04:11 +0000 (UTC)

[Hopefully this change won't be reverted too quickly ...]

The Wikipedia page for NBD was very sad :-(  It was the main source for
knowledge about NBD, and yet it was all over the place and didn't
really describe what NBD is in the modern Linux world.

So I've had a go at attacking this page and hopefully made it more
relevant.  My revision is here:

https://en.wikipedia.org/w/index.php?title=Network_block_device&oldid=956617740

I hope it remains neutral while being a bit more relevant to readers,
but of course feel free to edit/adjust as you believe necessary.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

