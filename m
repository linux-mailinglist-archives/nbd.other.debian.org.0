Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3E6AA474
	for <lists+nbd@lfdr.de>; Fri,  3 Mar 2023 23:33:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 05B6E208DF; Fri,  3 Mar 2023 22:33:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar  3 22:33:39 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A9E7C208C6
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Mar 2023 22:33:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 69T_sNW8K_uB for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Mar 2023 22:33:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8500F208B1
	for <nbd@other.debian.org>; Fri,  3 Mar 2023 22:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677882795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jtj7LRv49ez7NJ+K9IudD5hglJEn1EJeRaTSAYJlx0=;
	b=BZPVjYB+b3z1Rn15l38+IysZSVXnNmQ56S0CxCNrSt5h+j6LZNDMqVsMBsHQOPLAktwGQY
	kMbh/vYZT9dfbCUh1BvDQFxPqJYOttDu++JWFBTyxfvXlJV0OzjGU+bgmXF53DB3TX+Vm+
	2vEJnvc0p/6b9f4OsBO2BhnwnRVe9+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-qdS-Y_Q_P8GepLiNJMfLuQ-1; Fri, 03 Mar 2023 17:17:43 -0500
X-MC-Unique: qdS-Y_Q_P8GepLiNJMfLuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6DB8185A78B;
	Fri,  3 Mar 2023 22:17:42 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 431092166B26;
	Fri,  3 Mar 2023 22:17:42 +0000 (UTC)
Date: Fri, 3 Mar 2023 16:17:40 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: Re: [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <20230303221740.pdwc6jtozstntih7@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
 <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pVSP1WNKUXK.A.cNG.DXnAkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2339
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230303221740.pdwc6jtozstntih7@redhat.com
Resent-Date: Fri,  3 Mar 2023 22:33:40 +0000 (UTC)

On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 11/15/22 01:46, Eric Blake wrote:
> > The spec was silent on how many extents a server could reply with.
> > However, both qemu and nbdkit (the two server implementations known to
> > have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
> > cap, and will truncate the amount of extents in a reply to avoid
> > sending a client a reply so large that the client would treat it as a
> > denial of service attack.  Clients currently have no way during
> > negotiation to request such a limit of the server, so it is easier to
> > just document this as a restriction on viable server implementations
> > than to add yet another round of handshaking.  Also, mentioning
> > amplification effects is worthwhile.
> > 
> > When qemu first implemented NBD_CMD_BLOCK_STATUS for the
> > base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
> > as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
> > responded with more than one extent.  Later, when adding its
> > qemu:dirty-bitmap:XYZ context extension (qemu commit 3d068aff16, Jun
> > 2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
> > applied to base:allocation once qemu started sending multiple extents
> > for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
> > extents are never smaller than 512 bytes (other than an exception at
> > the end of a file whose size is not aligned to 512), but even so, a
> > request for just under 4G of block status could produce 8M extents,
> > resulting in a reply of 64M if it were not capped smaller.
> > 
> > When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
> > Mar 2019), it did not impose any restriction on the number of extents
> > in the reply chunk.  But because it allows extents as small as one
> > byte, it is easy to write a server that can amplify a client's request
> > of status over 1M of the image into a reply over 8M in size, and it
> > was very easy to demonstrate that a hard cap was needed to avoid
> > crashing clients or otherwise killing the connection (a bad server
> > impacting the client negatively).  So nbdkit enforced a bound of 1M
> > extents (8M+4 bytes, nbdkit commit 6e0dc839ea, Jun 2019).  [Unrelated
> > to this patch, but worth noting for history: nbdkit's situation also
> > has to deal with the fact that it is designed for plugin server
> > implementations; and not capping the number of extents in a reply also
> > posed a problem to nbdkit as the server, where a plugin could exhaust
> > memory and kill the server, unrelated to any size constraints enforced
> > by a client.]
> > 
> > Since the limit chosen by these two implementations is different, and
> > since nbdkit has versions that were not limited, add this as a SHOULD
> > NOT instead of MUST NOT constraint on servers implementing block
> > status.  It does not matter that qemu picked a smaller limit that it
> > truncates to, since we have already documented that the server may
> > truncate for other reasons (such as it being inefficient to collect
> > that many extents in the first place).  But documenting the limit now
> > becomes even more important in the face of a future addition of 64-bit
> > requests, where a client's request is no longer bounded to 4G and
> > could thereby produce even more than 8M extents for the corner case
> > when every 512 bytes is a new extent, if it were not for this
> > recommendation.
> 
> s-o-b line missed.

I'm not sure if the NBD project has a strict policy on including one,
but I don't mind adding it.

> 
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> -- 
> Best regards,
> Vladimir
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

