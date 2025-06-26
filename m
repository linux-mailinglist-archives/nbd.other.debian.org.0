Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B7878AE9ECD
	for <lists+nbd@lfdr.de>; Thu, 26 Jun 2025 15:31:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ECA0F205CC; Thu, 26 Jun 2025 13:31:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 26 13:31:43 2025
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F2B2720592
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Jun 2025 13:31:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ApKNTAcpbt-a for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Jun 2025 13:31:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1182 seconds by postgrey-1.36 at bendel; Thu, 26 Jun 2025 13:31:27 UTC
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 20A952057D
	for <nbd@other.debian.org>; Thu, 26 Jun 2025 13:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZPS6g3ExNjpAuv5/90vOclx8ilELgu1nGs7u4i9OQ0Y=; b=Gk8LScupAyUUYUwXRJU7QPNNDj
	7Dryje2b8o8uhBVTlLV/9+E6xajdMr8N6PQG40GRCZTx3T9lRJe8bluBqsCL8uq23Kz8rbn+5f+Nn
	RmyFFEpKnriqyUlFDaykI8veJNpAs4KWynO4OS5yYDoAqNYKQu4r39v7UdxhkF0RxA8rn1nDvdVZZ
	h14tQDoAuwXUl4FCLh5rJOjtz+VN0ar+I2PsxbLxIyRVZdouTveZ8Y7Ly8JeiMgMWlcJ8A9KNvlbX
	GEZDwm9TqePN1ynRCv/TTaAIiw9X2OZqreOA3IaRFt/Q3Psx+/yMHYfC7bdACWbvC151dS2N5vx+H
	Y8I0LnzQ==;
Received: from [102.39.139.203] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1uUmOE-00FVD1-2P;
	Thu, 26 Jun 2025 15:11:42 +0200
Received: from wouter by pc220518 with local (Exim 4.98.2)
	(envelope-from <w@uter.be>)
	id 1uUmO7-00000001QV2-0Klm;
	Thu, 26 Jun 2025 15:11:35 +0200
Date: Thu, 26 Jun 2025 15:11:35 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: [RFC PATCH] spec: Relax block status alignment to match existing
 servers
Message-ID: <aF1HBwIbUFky3il6@pc220518.home.grep.be>
References: <20250531154146.855670-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531154146.855670-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6EwIlpcD-6M.A.XjE._uUXoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3392
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aF1HBwIbUFky3il6@pc220518.home.grep.be
Resent-Date: Thu, 26 Jun 2025 13:31:43 +0000 (UTC)

Hi Eric,

On Sat, May 31, 2025 at 10:38:42AM -0500, Eric Blake wrote:
> At least nbdkit 1.42 has several scenarios where it can advertise a
> minimum block size, but where block status results are not aligned to
> that size.  While most of those instances are bugs fixed in the
> upcoming 1.44, we have to consider the case when a server advertises
> an image size which is not a multiple of the minimum block size.  The
> spec is already clear that a server SHOULD advertise aligned sizes,
> but when it doesn't, the requirement that block status results be
> aligned is impossible to meet.  Relaxing the standard from MUST to
> SHOULD warns clients to be prepared for weaknesses in the server, as
> well as making it less troublesome to try and collect block status
> even for an unaligned tail of an image.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> I'm not sure if I want to apply this patch as-is, or if we should come
> up with a better wording.

Yeah, I don't think I can come up with anything better, either. Please
apply.

> Of note: we already use SHOULD and not MUST
> on structured replies to NBD_CMD_READ splitting a response into
> multiple chunks when reading holes is encountered.  The biggest reason
> for this patch is to inform clients that not all servers are always
> compliant (in particular, nbdkit 1.42 has several issues, and while
> I'm patching most of them for 1.44, nbdkit still takes the approach
> that it has no problem with a plugin advertising unaligned sizes, at
> which point an unaligned block status request and response are the
> only way to learn about that unaligned tail).
> 
>  doc/proto.md | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 565fbebc..b403bae1 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -2267,8 +2267,10 @@ The following request types exist:
>      places for an exception), in part to avoid an amplification effect
>      where a series of smaller descriptors can cause the server's reply
>      to occupy more bytes than the *length* of the client's request.
> -    The server MUST use descriptor lengths that are an integer
> -    multiple of any advertised minimum block size. The status flags
> +    The server SHOULD use descriptor lengths that are an integer
> +    multiple of any advertised minimum block size, with an obvious
> +    exception at the end of the image if the image size itself is
> +    unaligned. The status flags
>      are intentionally defined so that a server MAY always safely
>      report a status of 0 for any block, although the server SHOULD
>      return additional status values when they can be easily detected.
> -- 
> 2.49.0
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

