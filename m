Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04F93F8AE
	for <lists+nbd@lfdr.de>; Mon, 29 Jul 2024 16:50:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 653CC2088B; Mon, 29 Jul 2024 14:50:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 29 14:50:14 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C94762086F
	for <lists-other-nbd@bendel.debian.org>; Mon, 29 Jul 2024 14:50:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4N_6f2wfCkon for <lists-other-nbd@bendel.debian.org>;
	Mon, 29 Jul 2024 14:49:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id BA8E42086A
	for <nbd@other.debian.org>; Mon, 29 Jul 2024 14:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722264593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRE5RrgObf6hIPX2jQRQDISH432Pxhs7kksQSqduC0M=;
	b=Mx5Oy607myycca8VSQbadAEZ01W4KtA9pfotOxg5c5d3WQb8fDdGdvI/k3TavDYxtYASeF
	8uf2uGRPMzbQJpgWiVUx9RurklSfd9YMo1uniLDBOpyb1Ab+EYpx537PL+jDF1Q7Nepx8k
	2XkrQAf8OMGj9R4NC0h05N8c+U3Q6bk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-xDDq_JQgNXGkt3yyFuL4_A-1; Mon,
 29 Jul 2024 10:49:49 -0400
X-MC-Unique: xDDq_JQgNXGkt3yyFuL4_A-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 10CC019560B1;
	Mon, 29 Jul 2024 14:49:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.72])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62E50300018D;
	Mon, 29 Jul 2024 14:49:47 +0000 (UTC)
Date: Mon, 29 Jul 2024 09:49:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Connor Kuehl <cipkuehl@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Status flags definition for NBD_REPLY_TYPE_BLOCK_STATUS
Message-ID: <wljfepvxq7arxc5aawbrxuw55igjyxpdrgyqlvzonvkpdt3pef@axbpgnpevxgi>
References: <2B83C3DC-D923-4D9C-94C3-66336F41FB2E@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2B83C3DC-D923-4D9C-94C3-66336F41FB2E@gmail.com>
User-Agent: NeoMutt/20240425
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eSow5csT-QP.A.VndE.mw6pmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3109
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/wljfepvxq7arxc5aawbrxuw55igjyxpdrgyqlvzonvkpdt3pef@axbpgnpevxgi
Resent-Date: Mon, 29 Jul 2024 14:50:14 +0000 (UTC)

On Sat, Jul 27, 2024 at 08:02:35PM GMT, Connor Kuehl wrote:
> Hello,
> 
> I am implementing the client-side of the NBD protocol and I've gotten
> a little stuck on the NBD_REPLY_TYPE_BLOCK_STATUS structured reply.
> 
> The protocol description[1] states:
> 
> > * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)
> > 
> >   *length* MUST be 4 + (a positive integer multiple of 8).  This reply
> >   represents a series of consecutive block descriptors where the sum
> >   of the length fields within the descriptors is subject to further
> >   constraints documented below.  A successful block status request MUST
> >   have exactly one status chunk per negotiated metadata context ID.
> > 
> >   The payload starts with:
> > 
> >   32 bits, metadata context ID  
> > 
> >   and is followed by a list of one or more descriptors, each with this
> >   layout:
> > 
> >   32 bits, length of the extent to which the status below
> >      applies (unsigned, MUST be nonzero)  
> >   32 bits, status flags  
> 
> I can't seem to find the definition for these status flags. It's likely
> I may have just missed it. Any pointers will be much appreciated.

The status flags are defined per-metacontext.  The spec defines the
"base:allocation" metacontext:

https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#baseallocation-metadata-context

which in turn defines flag 0x01 for NBD_STATE_HOLE (clear by default
or if the extent is known to be allocated, set only if the extent is
known to be unallocated), and flag 0x02 for NBD_STATE_ZERO (clear by
default or if the extent is known to contain non-zero data, set only
if the extent is known to read as zero).

If you are implementing NBD_BLOCK_STATUS on top of files,
lseek(SEEK_HOLE) can be used to set NBD_STATE_HOLE|NBD_STATE_ZERO in
parallel (either both bits are clear or both bits are set).  But there
are some other storage mechanisms where the distinction between bits
is meaningful (for example, iSCSI has the notion of some hardware that
supports the notion of allocation but does not promise whether
unallocated regions read as zero; conversely, qcow2 files have a
notion of regions of a disk image that read as zero but which are
already allocated so that writing to those regions won't expand the
qcow2 file size).

There are other defined metacontexts linked from the NBD spec; in
particular, QEMU defines two metacontexts at
https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/nbd.txt

where "qemu:dirty-bitmap:XXX" defines 0x01 to be set if an extent is
known to be dirty in the bitmap named XXX, and where "qemu:allocation"
is an integer representing the depth of where the allocation comes
from (0 for unallocated, 1 for the current image, 2 for the first
backing layer, 3 for the second backing layer, and so forth).

There may be other NBD metacontexts out there, but so far, none of
them have submitted a patch to be included in the mention from the NBD
spec.  One proposal that I have considered (but have not actually
coded up) would be a series of NBD metacontexts allowing the ability
to expose Zoned Block Devices (ZBD,
https://zonedstorage.io/docs/linux/overview) across NBD; in
particular, this would include metacontexts that reveal information
such as the current 64-bit append location within a given zone
(getting 64-bit block status would require the use of extended
headers, currently mentioned as experimental in spec but currently
implemented by qemu and libnbd).

For what it's worth, the nbdkit project can be used for testing
interoperability with your client implementation (among other things,
nbdkit provides it easy to write a shell script server that advertises
various block status combinations for "base:allocation" for testing
how your client reacts).  To date, no one has contributed patches to
nbdkit to support the emulation of any NBD metacontext other than
"base:allocation", but if it would help integration testing, that may
be a worthwhile feature to add to nbdkit.
https://libguestfs.org/nbdkit.1.html

I can also point you to the libnbd project that may serve as a way to
incorporate an existing client implementation into your project rather
than writing a client from scratch.
https://libguestfs.org/libnbd.3.html

> 
> Thank you,
> 
> Connor
> 
> [1] https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

