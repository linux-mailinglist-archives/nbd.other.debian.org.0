Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 062364F8F8C
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 09:25:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A6431204AC; Fri,  8 Apr 2022 07:25:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 07:25:26 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4DFBA204AA
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 07:25:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.09 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zIE3NofUinvn for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 07:25:13 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1977B204A8
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gm+6POeCFlu34dMRAZbtAwLqwWVDSjh97ibHKso8Kow=; b=TkOHWe0ZMFEMSfPppWe8TCEPni
	SVE6y8n0aFwsQoXhURd+r5UkI+dQfmcbG1FZa4cycBvFDYPWNx/X9snhfeAh9WS6Mm80tiUij5VbM
	kWQhqZn822p4W90xTAie/8v76+XqkL8YW1FiGSyVYQd2nVSoJmLVo9RhDVgx+Gn+vqSdRvg9F4VuZ
	AWpKQIx1USKrVhvF3swCVs6OfJV1bHiRyf27rKXEH+YOdlr5bvi20FLvYQorgnjurbuhQGoxD2Fh7
	fmAL/ItCMUXAMTUje+Kr9Ggtq0n2kCiFd6bwKbBkhcitp9xtwSqRDseM5JjdJO9jfTGk3vBQCIVbF
	VPV75zNw==;
Received: from [197.245.197.46] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1ncizV-00EG8X-32; Fri, 08 Apr 2022 09:25:09 +0200
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1ncizN-0001tS-HV;
	Fri, 08 Apr 2022 09:25:01 +0200
Date: Fri, 8 Apr 2022 09:25:01 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org,
	v.sementsov-og@mail.ru
Subject: Re: [PATCH 1/2] spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS
 length
Message-ID: <Yk/jTZcHpW5qWsvg@pc181009.grep.be>
References: <20220407213720.250252-1-eblake@redhat.com>
 <20220407213720.250252-2-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407213720.250252-2-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a_vBu7TYSiE.A.zhE.mN-TiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1925
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yk/jTZcHpW5qWsvg@pc181009.grep.be
Resent-Date: Fri,  8 Apr 2022 07:25:26 +0000 (UTC)

Hi Eric,

On Thu, Apr 07, 2022 at 04:37:19PM -0500, Eric Blake wrote:
> The spec was silent on how many extents a server could reply with.
> However, both qemu and nbdkit (the two server implementations known to
> have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
> cap, and will truncate the amount of extents in a reply to avoid
> sending a client a reply larger than the maximum NBD_CMD_READ response
> they are willing to tolerate:
> 
> When qemu first implemented NBD_CMD_BLOCK_STATUS for the
> base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
> as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
> responded with more than one extent.  Later, when adding its
> qemu:dirty-bitmap:XXX context extension (qemu commit 3d068aff16, Jun
> 2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
> applied to base:allocation once qemu started sending multiple extents
> for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
> extents are never smaller than 512 bytes (other than an exception at
> the end of a file whose size is not aligned to 512), but even so, a
> request for just under 4G of block status could produce 8M extents,
> resulting in a reply of 64M if it were not capped smaller.
> 
> When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
> Mar 2019), it did not impose any restriction on the number of extents
> in the reply chunk.  But because it allows extents as small as one
> byte, it is easy to write a server that can amplify a client's request
> of status over 1M of the image into a reply over 8M in size, and it
> was very easy to demonstrate that a hard cap was needed to avoid
> crashing clients or otherwise killing the connection (a bad server
> impacting the client negatively); unique to nbdkit's situation is the
> fact that because it is designed for plugin server implementations,
> not capping the length of extent also posed a problem to nbdkit as the
> server (a client requesting large block status could cause the server
> to run out of memory depending on the plugin providing the server
> callbacks).  So nbdkit enforced a bound of 1M extents (8M+4 bytes,
> nbdkit commit 6e0dc839ea, Jun 2019).
> 
> Since the limit chosen by these two implementations is different, and
> since nbdkit has versions that were not limited, add this as a SHOULD
> NOT instead of MUST NOT constraint on servers implementing block
> status.  It does not matter that qemu picked a smaller limit that it
> truncates to, since we have already documented that the server may
> truncate for other reasons (such as it being inefficient to collect
> that many extents in the first place).  But documenting the limit now
> becomes even more important in the face of a future addition of 64-bit
> requests, where a client's request is no longer bounded to 4G and
> could thereby produce even more than 8M extents for the corner case
> when every 512 bytes is a new extent, if it were not for this
> recommendation.

It feels backwards to me to make this a restriction on the server side.
You're saying there are server implementations that will be inefficient
if there are more than 2^20 extents, and therefore no server should send
more than those, even if it can do so efficiently.

Isn't it up to the server implementation to decide what can be done
efficiently?

Perhaps we can make the language about possibly reducing length of
extens a bit stronger; but I don't think adding explicit limits for a
server's own protection is necessary.

> ---
>  doc/proto.md | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index bacccfa..c3c7cd9 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -1815,6 +1815,12 @@ MUST initiate a hard disconnect.
>    the different contexts need not have the same number of extents or
>    cumulative extent length.
> 
> +  Servers SHOULD NOT send more than 2^20 extents in a single reply
> +  chunk; in other words, the maximum size of
> +  `NBD_REPLY_TYPE_BLOCK_STATUS` should not be more than 4 + 8*2^20
> +  (8,388,612 bytes), even if this requires that the server truncate
> +  the response in relation to the *length* requested by the client.
> +
>    Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
>    its request, the server MAY return fewer descriptors in the reply
>    than would be required to fully specify the whole range of requested
> @@ -2181,10 +2187,13 @@ The following request types exist:
>      multiple descriptors, and the final descriptor MAY extend beyond
>      the original requested size if the server can determine a larger
>      length without additional effort.  On the other hand, the server MAY
> -    return less data than requested. However the server MUST return at
> -    least one status descriptor (and since each status descriptor has
> -    a non-zero length, a client can always make progress on a
> -    successful return).  The server SHOULD use different *status*
> +    return less data than requested.  In particular, a server SHOULD NOT
> +    send more than 2^20 status descriptors in a single chunk.
> +
> +    However the server MUST return at least one status descriptor,
> +    and since each status descriptor has a non-zero length, a client
> +    can always make progress on a successful return.  The server SHOULD
> +    use different *status*
>      values between consecutive descriptors where feasible, although
>      the client SHOULD be prepared to handle consecutive descriptors
>      with the same *status* value.  The server SHOULD use descriptor
> -- 
> 2.35.1
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

