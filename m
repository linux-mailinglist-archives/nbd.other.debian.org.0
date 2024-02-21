Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37285E73E
	for <lists+nbd@lfdr.de>; Wed, 21 Feb 2024 20:26:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 131AC20DC8; Wed, 21 Feb 2024 19:26:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 21 19:26:35 2024
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 04C3420B18
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 Feb 2024 19:26:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.562 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.451, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fQ4fRmB3t6pI for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 Feb 2024 19:26:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 306 seconds by postgrey-1.36 at bendel; Wed, 21 Feb 2024 19:26:14 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id EF98820A2B
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708543569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JqoyUcYSvGZwzpTCYwj0E0PR7PWAk92mhZvk/fQV5Yc=;
	b=ZeTkz665aiK9FGxALv3hAHLQFx+XJg8eqJVzCFSEbX25D6Stq10MviGJzpbJF4CLF8uGms
	ZvlFeglRHipIsIvcsRLAJBx5xNLRhHTRiPcfJyjTxHmBbOzWhHjHeJuWmlFV2TzT4JS9uX
	72578W3gVfCxfBfDtsUFNldHBY8IslE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-R_q0xdMRPTWTRHFjCo-fFw-1; Wed, 21 Feb 2024 14:19:52 -0500
X-MC-Unique: R_q0xdMRPTWTRHFjCo-fFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 047B584AC65;
	Wed, 21 Feb 2024 19:19:52 +0000 (UTC)
Received: from localhost (unknown [10.42.28.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A91B61C1A806;
	Wed, 21 Feb 2024 19:19:51 +0000 (UTC)
Date: Wed, 21 Feb 2024 19:19:51 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, guestfs@lists.libguestfs.org
Subject: Re: [Libguestfs] what size should NBD_OPT_INFO report?
Message-ID: <20240221191951.GY15275@redhat.com>
References: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
MIME-Version: 1.0
In-Reply-To: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lJmI-Fve_M.A.idC.r5k1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2761
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240221191951.GY15275@redhat.com
Resent-Date: Wed, 21 Feb 2024 19:26:36 +0000 (UTC)

On Wed, Feb 21, 2024 at 12:19:47PM -0600, Eric Blake wrote:
> I noticed during integration testing that nbd-server blindly reports a
> size of 0 for all NBD_OPT_INFO requests, unless I pass a size argument
> on the command line to nbd-server.  At first, I thought it was a side
> effect of me trying to use nbd-server on a block device (an LVM
> partition), as it is a common bug to rely on stat().st_size which only
> works for regular files (a block device has to use lseek(SEEK_END));
> but then I noticed it happening when using nbd-server to serve regular
> files as well.
> 
> I then turned to the source code, where I see that client->exportsize
> is set in just these places:
> 
> commit_client()
> - exportsize = OFFT_MAX, then try setupexport()
> 
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
> 
> For comparison, both nbdkit and qemu as an NBD server always advertise
> the same size for both NBD_OPT_INFO and NBD_OPT_GO (but it should also
> be noted that neither of these has the complexity of multifile like
> nbd-server).
> 
> Should we tweak the NBD standard to recommend that a server advertise
> a size of OFFT_MAX for NBD_OPT_INFO if it is prohibitive to determine
> an actual size, rather than 0?

No no no, this is a cop out!  Just calculate the correct size.
If nbdkit & qemu-nbd can do it, then so can nbd-server.

> Furthermore, is it worth adding code
> to make NBD_OPT_INFO try harder to provide a sensible value when
> possible (if expected_size was set, or if we are not multifile or
> F_WAIT, then a stat() is enough to get the size for serving a regular
> file; and if stat() says we have a block device, we can still try the
> open/lseek/close)?
> 
> Also, is it worth trying to specify that since no known NBD servers
> allow exports with sizes larger than OFFT_MAX, a server MUST NOT
> report a size equal or larger than 9223372036854775808
> (0x80000000_00000000)?

Yes, nbdkit supports up to and including 7fffffff_ffffffff and qemu up
to and including 7fffffff_c0000000 (although that's a bug in qemu IMHO).

The Linux kernel itself doesn't support anything larger than
7fffffff_ffffffff.

> There are definitely a few places that I could
> simplify in libnbd if we have a protocol guarantee that a valid export
> size will never have the most significant bit set, and therefore we
> don't have to worry about whether size is represented as a signed or
> unsigned value (which also implies that libnbd's function
> nbd_get_size() returning ssize_t instead of size_t is acceptable).
> But if we do that, then maybe 0x80000000_00000000 or even
> 0xffffffff_ffffffff would serve as a better recommended sentinel than
> 0x7fffffff_ffffffff for representing an indeterminate size.

Yeah I don't know where 7fffffff_ffffffff meaning "unknown" comes
from.  nbdkit supports real, known sizes as large as this, and there's
no such concept as "unknown size" in nbdkit.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

