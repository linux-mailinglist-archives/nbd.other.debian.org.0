Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A46E5D4E
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 11:27:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E49BB20B02; Tue, 18 Apr 2023 09:27:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 09:27:18 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8B37C20B0A
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 09:27:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id r9Sh68lj3RjV for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 09:26:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C937720B02
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NpwnnF3fe6jWRm1RPmOKxrjAXNDpWA9KvXmeuUBb9z4=; b=PqwkMtqL281egBgp1bX5yQoYkw
	ut/pufqznToLCnqtzP0mEQurfKI7X13UAY/rs6e/gVDbzghj/+TQVI93+8TLx8S/cu9nusOV2g7NX
	JzIIz+pwUwkUCXJwwyNbC7udyxapi9UbCbCLE5blwYG/R4G2Nq+9D7HPv9Hd0rZX4I8KN7DS3f7wC
	vr1uc38IYrHNG79UG4qynl2IPKAYPwGUEcVN4NJWpGljZMinatdDzGBej+g74EeM6JnVD423Ljel3
	R3E0d0B4kLrAwWpSHxnAah19quoPUyfNE0qksXwjWujj/yiAbjdH+WKpO2MyLOzCbRGUjco1m0yRC
	4tM4RzoQ==;
Received: from [217.111.249.126] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pohc0-00DNdm-L2; Tue, 18 Apr 2023 11:26:56 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pohbu-0007hA-0y;
	Tue, 18 Apr 2023 11:26:50 +0200
Date: Tue, 18 Apr 2023 11:26:40 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH v3 2/6] spec: Change maximum block size to maximum
 payload size
Message-ID: <ZD5iUNqjxne6c5Y1@pc220518.home.grep.be>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-3-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413220241.1396012-3-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0outGMzyjrO.A.urF.2JmPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2430
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZD5iUNqjxne6c5Y1@pc220518.home.grep.be
Resent-Date: Tue, 18 Apr 2023 09:27:18 +0000 (UTC)

On Thu, Apr 13, 2023 at 05:02:37PM -0500, Eric Blake wrote:
> Commit 9f30fedb improved the spec to allow non-payload requests like
> NBD_CMD_TRIM that exceed any advertised maximum block size.  Take this
> one step further by documenting that the server may use NBD_EOVERFLOW
> as a hint to the client when a non-payload request is oversize (while
> permitting NBD_EINVAL for back-compat), and by rewording the text to
> explicitly call out that what is being advertised is the maximum
> payload length, not maximum block size.  Furthermore, favor the term
> 'maximum payload size' instead of 'maximum block size', as the real
> limitation here is how many bytes are sent in one direction as part of
> the command (a maximum payload size may be related to maximum block
> size, but existing implementations of both servers and clients that
> actually implement NBD_INFO_BLOCK_SIZE have generally been advertising
> things like a 32M or 64M data cap, and not an underlying block size
> constraint).
> 
> Document existing practice that structured replies can slightly exceed
> payload size (a client requesting a 32M NBD_CMD_READ can get a single
> NBD_REPLY_TYPE_OFFSET_DATA of size 32M+8 bytes, rather than the server
> splitting it across two chunks); the only hard limit here is that on
> client/server pairs that permit larger payloads than 32M, the reply
> type still has a 32-bit limit on payload size (no known client or
> server actually tries to do an NBD_CMD_READ of 4G-1 bytes, but the
> spec shouldn't prevent it).
> 
> This becomes more important when we add 64-bit extensions, where it
> becomes possible to extend `NBD_CMD_BLOCK_STATUS` to have both an
> effect length (how much of the image does the client want status on -
> may be larger than 32 bits) and an optional payload length (a way to
> filter the response to a subset of negotiated metadata contexts).  In
> the shorter term, it means that a server may (but not must) accept a
> read request larger than the maximum block size if it can use
> structured replies to keep each chunk of the response under the
> maximum payload limits.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> 
> v3: Completely drop 'maximum block length', and reword things even
> more to emphasize maximum payload.  Clarify that a server's structured
> reply CAN exceed the maximum payload by the amount of overhead
> required by the reply type.
> ---
>  doc/proto.md | 148 ++++++++++++++++++++++++++++++---------------------
>  1 file changed, 87 insertions(+), 61 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 0cb84f2..2651f13 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -747,8 +747,8 @@ text unless the client insists on TLS.
> 
>  During transmission phase, several operations are constrained by the
>  export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
> -as well as by three block size constraints defined here (minimum,
> -preferred, and maximum).
> +as well as by three block size constraints defined here (minimum
> +block, preferred block, and maximum payload).

I think this may be reworded as:

"as well as by three size constraint defined here"

as they're now no longer all block size constraints.

(this occurs more below)

Other than that,

Reviewed-By: Wouter Verhelst <w@uter.be>

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

