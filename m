Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2855D9D1505
	for <lists+nbd@lfdr.de>; Mon, 18 Nov 2024 17:06:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5119320EE3; Mon, 18 Nov 2024 16:06:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 18 16:06:29 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8D98A20EB5
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Nov 2024 16:06:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.917 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QyIHtoYN-npb for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Nov 2024 16:06:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 5357E20E13
	for <nbd@other.debian.org>; Mon, 18 Nov 2024 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731945969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Dmzb4+cxeMVzEsNyz6tayZ5fsd2SQQrSivWHjLxk98=;
	b=ciPDByBxBH9p/P34xl7Yi4vQQAND5700xnoNZ3PstRL8UGmpnZFM14RXT1IJ5oRUFCmBZw
	/ycGYV44KBBQwdFNmcxXPV6ahD2KhvBTEkIGQcQI9+myF8rp/s+e701kOMsmutVX0iieG9
	qt6B4a+EHZCPSxg6CT0Po5zx1fkA1YI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-9j1azjOPN-G_rCgil3L2kQ-1; Mon,
 18 Nov 2024 11:05:00 -0500
X-MC-Unique: 9j1azjOPN-G_rCgil3L2kQ-1
X-Mimecast-MFC-AGG-ID: 9j1azjOPN-G_rCgil3L2kQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C7C651955EA7;
	Mon, 18 Nov 2024 16:04:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.76])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C36853003B7E;
	Mon, 18 Nov 2024 16:04:57 +0000 (UTC)
Date: Mon, 18 Nov 2024 10:04:55 -0600
From: Eric Blake <eblake@redhat.com>
To: linux-block@vger.kernel.org, nbd@other.debian.org, 
	Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: question on NBD idempotency
Message-ID: <idugnvijxhmiybvyggxzeyxccbuom3pjblwhbye5fnbmp27rpj@k3lhml2c6zsh>
References: <2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih>
User-Agent: NeoMutt/20241002
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2FXLtkJHtWH.A.QQxC.FY2OnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3189
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/idugnvijxhmiybvyggxzeyxccbuom3pjblwhbye5fnbmp27rpj@k3lhml2c6zsh
Resent-Date: Mon, 18 Nov 2024 16:06:29 +0000 (UTC)

On Fri, Nov 15, 2024 at 09:43:24AM -0600, Eric Blake wrote:
> Is there an existing set of ioctls where the creation of an NBD device
> could associate a user-space tag with the device, and I can then later
> query the device to get the tag back?  A finite-length string would be
> awesome (I could store "nbd://$ip:$port/$export" as the tag on
> creation, to know precisely which server the device is talking to),
> but even an integer tag (32- or 64-bit) might be enough (it's easier
> to choose an integer tag in the full 2^64 namespace that is unlikely
> to cause collisions with other processes on the system, than it is to
> avoid collisions in the limited first few $N of the /dev/nbd$N device
> names chosen to pick the lowest unused integer first).  If not, would
> it be worth adding such ioctls for the NBD driver?

Aha - Stefan pointed me to NBD_ATTR_BACKEND_IDENTIFIER, in use in
places such as

https://github.com/vitalif/vitastor/blob/156d0054129c43cc26262663ff2c1cbb5b206513/src/client/nbd_proxy.cpp#L164
https://github.com/xdavidwu/ceph/blob/2f1768caeb96425877d3f5cbfa779c590a23e938/src/tools/rbd_nbd/rbd-nbd.cc#L1394

which looks like I can associate a given string directly with the
netlink creation, then later modification via netlink insists that the
same backend string be present, and where sysfs can be used to grab
the contents of nbd->backend as stored in the kernel.  The only
problem: nbd-client does not (yet) set this netlink parameter.  Looks
like I get to patch nbd-client, as that netlink field sounds exactly
like what I want.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

