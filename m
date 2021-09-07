Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D977403055
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 23:35:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F3AEE2090E; Tue,  7 Sep 2021 21:35:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 21:35:37 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5F7C6208FD
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 21:35:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.628 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UNJu6ek4THix for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 21:35:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id A9046207EE
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631050519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vr2TJ7BcfGBonYt61OeaQmBDAEHyd8+p706TTBVmIYs=;
	b=PKMu19zVxnaQdpprdkTVE9pAFdGDGd7dLuu58pTcpIFpAJT8zbtW70v1/OaipiCarZMlHc
	XbQFlrHmFRN36vkcOwgmVlIxSfTxRCVjseTxZuahtQktZ2FgGp2vTTJJ+TdBpYjwk2dAxt
	zegGsjzXJoOs9n589O/IsF5dADAOsWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-SKEnWex7MKeWtl-LPwznHg-1; Tue, 07 Sep 2021 17:35:17 -0400
X-MC-Unique: SKEnWex7MKeWtl-LPwznHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 147DB107ACC7;
	Tue,  7 Sep 2021 21:35:16 +0000 (UTC)
Received: from redhat.com (ovpn-112-95.phx2.redhat.com [10.3.112.95])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB8815D9CA;
	Tue,  7 Sep 2021 21:35:15 +0000 (UTC)
Date: Tue, 7 Sep 2021 16:35:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Josh Triplett <josh@joshtriplett.org>
Cc: nbd@other.debian.org
Subject: Re: Linux kernel NBD driver support for structured replies?
Message-ID: <20210907213513.aq5qxd3d6v3ss676@redhat.com>
References: <YTfXZDs4YHrxHYJe@localhost>
MIME-Version: 1.0
In-Reply-To: <YTfXZDs4YHrxHYJe@localhost>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4EDEaQ1-EuF.A.2IE.ps9NhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1408
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210907213513.aq5qxd3d6v3ss676@redhat.com
Resent-Date: Tue,  7 Sep 2021 21:35:37 +0000 (UTC)

On Tue, Sep 07, 2021 at 02:19:32PM -0700, Josh Triplett wrote:
> I'm currently using the NBD client driver in the Linux kernel. At some
> point, I'd be interested in adding support for structured replies,
> specifically so that an NBD server can efficiently handle ranges of
> zeroes (e.g.  "for the 4k block you asked for, here are 200 bytes of
> data, and the rest if zero").

I don't know if you'll get the granularity of 200 bytes given the
nature of file system blocking, but it's definitely worth adding the
support so that "for the 64k block you asked for, here are 4k of data
and the rest is zero".

It will also pay dividends if you also add support for querying the
"base:allocation" meta context information, so that the kernel can
then acurately implement lseek(SEEK_HOLE) and similar on an NBD
device, since that also requires structured reply support.

> 
> Does that seem reasonable to add to the kernel driver? I wanted to check
> before considering development of a patch.

I'm not aware of anyone else doing it yet (I haven't yet been brave
enough to dive into implementing this in the kernel, although I have
implemented it in user space in both qemu and libnbd).  I'm certainly
happy to help with integration testing, or give you tips on how to
test it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

