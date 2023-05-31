Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 660127186FA
	for <lists+nbd@lfdr.de>; Wed, 31 May 2023 18:04:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1FDAB20A0D; Wed, 31 May 2023 16:04:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 31 16:04:41 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C567D20A05
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 May 2023 16:04:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.632 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id afCIiDi2NCgQ for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 May 2023 16:04:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id A6701209DF
	for <nbd@other.debian.org>; Wed, 31 May 2023 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685549058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+siqsdC6+hVLO/IhMIQliknQUxnqmbWgsdgs59WtSQ=;
	b=AV+s8Xnb7XbevKjvbOkl0hpU0lJM8DPBPUfTGAEiGgAASWhUN+jpBx4xr5oBEhwDcvXv3x
	1T+MfIxZ0jXo0d6MG7iRcki0rn8Vuv24uJtyvksrsB33OEOHGxn1krU+EaXF+7d+bMHQAt
	6nSEmUicf/jQfpnGXBiqSzZcEogGwsE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-WZ03SOFtMk6r_-JTMWLxrA-1; Wed, 31 May 2023 12:04:14 -0400
X-MC-Unique: WZ03SOFtMk6r_-JTMWLxrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0327F1019C9E;
	Wed, 31 May 2023 16:04:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A55140CFD45;
	Wed, 31 May 2023 16:04:08 +0000 (UTC)
Date: Wed, 31 May 2023 11:04:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, libguestfs@redhat.com, 
	qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 03/22] protocol: Add definitions
 for extended headers
Message-ID: <gdrdshhhjqzmhwdwvum6vahnex4d4ei5rgvxxucbwwrwidvmuy@zg2ceuzzqmah>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-4-eblake@redhat.com>
 <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
 <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
 <7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com>
 <5w3fbetyz62qb7rdiqu5xxpfbdhezlmkk24nvuxe6p4sem2j4w@c5lxwuc5yukh>
 <3dba1488-9b41-bd30-dd9d-f8b0402769a1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3dba1488-9b41-bd30-dd9d-f8b0402769a1@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bz2Td52xSQL.A.hLH.ZA3dkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2517
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/gdrdshhhjqzmhwdwvum6vahnex4d4ei5rgvxxucbwwrwidvmuy@zg2ceuzzqmah
Resent-Date: Wed, 31 May 2023 16:04:41 +0000 (UTC)

On Wed, May 31, 2023 at 01:29:30PM +0200, Laszlo Ersek wrote:
> >> Putting aside alignment even, I don't understand why reducing "count" to
> >> uint16_t would be reasonable. With the current 32-bit-only block
> >> descriptor, we already need to write loops in libnbd clients, because we
> >> can't cover the entire remote image in one API call [*]. If I understood
> >> Eric right earlier, the 64-bit extensions were supposed to remedy that
> >> -- but as it stands, clients will still need loops ("chunking") around
> >> block status fetching; is that right?
> > 
> > While the larger extents reduce the need for looping, it does not
> > entirely eliminate it.  For example, just because the server can now
> > tell you that an image is entirely data in just one reply does not
> > mean that it will actually do so - qemu in particular limits block
> > status of a qcow2 file to reporting just one cluster at a time for
> > consistency reasons, where even if you use the maximum size of 2M
> > clusters, you can never get more than (2M/16)*2M = 256G status
> > reported in a single request.
> 
> I don't understand the calculation. I can imagine the following
> interpretation:
> 
> - QEMU never sends more than 128K block descriptors, and each descriptor
> covers one 2MB sized cluster --> 256 GB of the disk covered in one go.
> 
> But I don't understand where the (2M/16) division comes from, even
> though the quotient is 128K.

Ah, I need to provide more backstory on the qcow2 format.  A qcow2
image has a fixed cluster size, chosen between between 512 and 2M
bytes.  A smaller cluster size has less wasted space for small images,
but uses more overhead.  Each cluster has to be stored in an L1 map,
where pages of the map are also a cluster in length, with 16 bytes per
map entry.  So if you pick a cluster size of 512, you get 512/16 or 32
entries per L1 page; if you pick a cluster size of 2M, you get 2M/16
or 128k entries per L1 page.  When reporting block status, qemu reads
at most one L1 page to then say how each cluster referenced from that
page is mapped.

https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qcow2.txt#L491

> 
> I can connect the constant "128K", and
> <https://github.com/NetworkBlockDevice/nbd/commit/926a51df>, to your
> paragraph [*] above, but not the division.

In this case, the qemu limit on reporting block status of at most one
L1 map page at a time happens to have no relationship to the NBD
constant of limiting block status reports to no more than 1M extents
(8M bytes) in a single reply, nor the fact that qemu picked a cap of
1M bytes (128k extents) on its NBD reply regardless of whether the
underlying image is qcow2 or some other format.

> 
> > But without 64-bit lengths, you are
> > guaranteed to need at least 2 (and possibly more) round trips to map
> > out an entire 6G image, while with 64-bit lengths, you can often get
> > an entire image map in one round trip.
> > 
> > Reducing 'count' to uint16_t for 64-bit responses would be possible if
> > we wanted to hard-code a server limit of never sending more than 64k
> > extents in one go; but above, I argued that existing servers currently
> > do exceed that cap even for 32-bit responses.
> > 
> 
> OK, understood. Looping is still required, but we expect to see it less
> exercised in practice, with extended headers.
> 
> >>
> >> Let me emphasize again that I'm not challenging the spec; also I don't
> >> secretly wish for the patches to do more than required by the spec. I
> >> guess I'd like to understand the intent of the spec, plus the
> >> consequences for client applications.
> >>
> >> [*] References (in this order!):
> >>
> >> - https://github.com/libguestfs/virt-v2v/commit/27c056cdc6aa0
> >> - https://gitlab.com/nbdkit/libnbd/-/commit/0e714a6e06e6
> >> - https://github.com/libguestfs/virt-v2v/commit/a2afed32d8b1f
> >>
> >> To be less cryptic, the first commit added "chunked" block status
> >> fetching to virt-v2v. Because our OCaml language libnbd mappings weren't
> >> proper at the time, that loop could move backwards and get stuck. We
> >> fixed that in the second commit (regarding the bindings) and then
> >> adapted virt-v2v's loop to the fixed bindings in the thirds commit. I've
> >> been hoping that such complexities could be eliminated in the future by
> >> virtue of not having to "chunk" the block status fetching.
> >>
> > 
> > We'll always have to deal with servers that send shorter replies than
> > we asked for, and where consecutive replies may have the same status.
> > The best the spec was able to do was recommend that the server return
> > as much as it can, and without consecutive status, where feasible.
> > 
> >> (
> >>
> >> BTW I'm foreseeing a problem: if the extended block descriptor can
> >> provide an unsigned 64-bit length, we're going to have trouble exposing
> >> that in OCaml, because OCaml only has signed 64-bit integers. So that's
> >> going to reproduce the same issue, only for OCaml callers of the *new* API.
> > 
> > At one point, I was playing with an idea to add a patch to the NBD
> > spec to REQUIRE that an export be capped at 2^63-1 bytes (that is, the
> > maximum of 'off_t').  It doesn't change any existing implementations,
> > and actually frees us up to use signed 64-bit numbers where negative
> > values are indeed error cases.  I'll probably try to revisit my
> > thoughts on that patch front, but don't think it holds up this series.
> > 
> >>
> >> I can see Eric's series includes patches like "ocaml: Add example for
> >> 64-bit extents" -- I've not looked at those yet; for now I'm just
> >> wondering what tricks we might need in the bindings generator. The
> >> method seen in the "middle patch" above won't work; we don't have a
> >> native OCaml "i128" type for example that we could use as an escape
> >> hatch, for representing C's uint64_t.
> > 
> > I _did_ go with the (currently implicit) assumption that no server
> > will ever expose larger than off_t can represent, and therefore a
> > signed 64-bit size is good enough.
> 
> I'll have to see that patch later, but for now I think making that
> assumption explicit would be nice (assert, abort, etc).
> 
> > Flags has to be unsigned, but flags
> > is representing something different than image size.
> 
> I take it you mean "nbd_block_descriptor_ext.status_flags", which is a
> "uint64_t".

Yes

> 
> If it's only used as a bitmap, that should be safe; first because some
> spec (dependent on metacontext) will introduce each bit one by one, and
> probably not start with bit#63; second because it makes no sense to sum
> bitmaps.
> 
> However, Wouter mentions up-thread that (dependent on metacontext)
> status_flags could actually stand for a length too:
> 
> 'Some metadata namespaces treat the "flags" field as an unsigned
> integer, to specify offsets or counters. I that context, the flags field
> should indeed be extended to 64 bits.'
> 
> and then dealing with those particular metacontexts in OCaml could be a
> problem.
> 
> It's probably best to catch unrepresentable values when converting
> between OCaml's int64 and C's uint64_t (both ways) in the generator as
> centrally as possible.

Indeed; that's where I'm hoping Rich may chime in with ideas for what
is best for the C <=> OCaml translation.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

