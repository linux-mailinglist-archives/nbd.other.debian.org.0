Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F485E685
	for <lists+nbd@lfdr.de>; Wed, 21 Feb 2024 19:41:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A0235210E2; Wed, 21 Feb 2024 18:41:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 21 18:41:58 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2830B210D7
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 Feb 2024 18:41:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.943 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.451, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id c4mhpPYUgXTu for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 Feb 2024 18:41:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id A0499210D0
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 18:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708540893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfs+hy3p5ycpRSwymgxZJJFB/75Rg7GVn/+QxVmMBM0=;
	b=KLujHsYqnclZpG0Ccg63lkAnavWli/GXZiYRJsAakQ3mrGVLDiUHqxMwJ2UVvqiOr4aEmT
	RvMQ7mAZJY3z5DAMM8MbOlZ2+M973bezFOKHlXBtNVGBINfW2u5Lm4b0oY77HccAYA7mzD
	mqyvyk9r1nUZbVmRHRoPUQ3e1YREQs0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-CaQ2lRroNk6VnhTb2y9ojg-1; Wed,
 21 Feb 2024 13:26:11 -0500
X-MC-Unique: CaQ2lRroNk6VnhTb2y9ojg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34A5C3C2E0B1;
	Wed, 21 Feb 2024 18:26:11 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EC478CE8;
	Wed, 21 Feb 2024 18:26:10 +0000 (UTC)
Date: Wed, 21 Feb 2024 12:26:08 -0600
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: guestfs@lists.libguestfs.org
Subject: Re: what size should NBD_OPT_INFO report?
Message-ID: <paxaxd3fxa2nhbp2ldllolydeibtv7dsonti67cxvuz27hmtcf@6is65mo7ar3y>
References: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
MIME-Version: 1.0
In-Reply-To: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
User-Agent: NeoMutt/20240201
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WTzUn5ybl_C.A.Hl.2Pk1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2759
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/paxaxd3fxa2nhbp2ldllolydeibtv7dsonti67cxvuz27hmtcf@6is65mo7ar3y
Resent-Date: Wed, 21 Feb 2024 18:41:58 +0000 (UTC)

On Wed, Feb 21, 2024 at 12:19:49PM -0600, Eric Blake wrote:
> setupexport()
> - default to client->server->expected_size (if one was provided),
>   further validating that actual size is large enough when actual size
>   can be computed
> - if neither treefile or F_WAIT is set, compute actual size by opening
>   one or more files and using size_autodetect() (which does the right
>   thing for block devices, so my earlier thought about over-reliance
>   on stat() was wrong)
> 
> but these functions are only reached for NBD_OPT_EXPORT_NAME and
> NBD_OPT_GO, not NBD_OPT_INFO.  The upshot is that for NBD_OPT_GO,
> there are some scenarios (treefile, F_WAIT) where nbd-server
> advertises a size of 9223372036854775807 (0x7fffffff_ffffffff) meaning
> unknown, but a size of 0 there is only possible if the file was
> successfully opened and really is zero bytes in length.  Conversely,
> NBD_OPT_INFO is always advertising a size of 0, which means most of
> the time, the size changes between NBD_OPT_INFO and NBD_OPT_GO.

Amending myself: reading size_autodetect(), it tries ioctl(fd,
BLKGETSIZE64) first (even when fd is not a block device!), then falls
back to fstat(fd) coupled with lseek(SEEK_END) if fstat() reported
st_size of 0 and not a regular file; but if all of those fail, it
reports UINT64_MAX, which is different than OFFT_MAX.

> 
> For comparison, both nbdkit and qemu as an NBD server always advertise
> the same size for both NBD_OPT_INFO and NBD_OPT_GO (but it should also
> be noted that neither of these has the complexity of multifile like
> nbd-server).
> 
> Should we tweak the NBD standard to recommend that a server advertise
> a size of OFFT_MAX for NBD_OPT_INFO if it is prohibitive to determine
> an actual size, rather than 0?  Furthermore, is it worth adding code
> to make NBD_OPT_INFO try harder to provide a sensible value when
> possible (if expected_size was set, or if we are not multifile or
> F_WAIT, then a stat() is enough to get the size for serving a regular
> file; and if stat() says we have a block device, we can still try the
> open/lseek/close)?
> 
> Also, is it worth trying to specify that since no known NBD servers
> allow exports with sizes larger than OFFT_MAX, a server MUST NOT
> report a size equal or larger than 9223372036854775808
> (0x80000000_00000000)?  There are definitely a few places that I could
> simplify in libnbd if we have a protocol guarantee that a valid export
> size will never have the most significant bit set, and therefore we
> don't have to worry about whether size is represented as a signed or
> unsigned value (which also implies that libnbd's function
> nbd_get_size() returning ssize_t instead of size_t is acceptable).
> But if we do that, then maybe 0x80000000_00000000 or even
> 0xffffffff_ffffffff would serve as a better recommended sentinel than
> 0x7fffffff_ffffffff for representing an indeterminate size.

And the fact that nbd-server already has two different sentinel values
(depending on whether it even attempted an open, vs whether the
attempt to read size from an open fd failed) is another factor into
what makes the most sense to do going forward.  If we do tweak the NBD
standard, at best it should only be an advisory on best server
practice (with the caveat that clients have to be prepared for servers
that return other odd values, like 0, even when a size is not known).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

