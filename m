Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3B155370
	for <lists+nbd@lfdr.de>; Fri,  7 Feb 2020 09:04:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7FE5A2060D; Fri,  7 Feb 2020 08:04:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb  7 08:04:59 2020
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A38952045C
	for <lists-other-nbd@bendel.debian.org>; Fri,  7 Feb 2020 08:04:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pFdTitRRHea1 for <lists-other-nbd@bendel.debian.org>;
	Fri,  7 Feb 2020 08:04:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E92EC202FE
	for <nbd@other.debian.org>; Fri,  7 Feb 2020 08:04:46 +0000 (UTC)
Received: from [105.184.214.45] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1izyd1-0000tk-C6; Fri, 07 Feb 2020 09:04:43 +0100
Received: from wouter by gangtai.home.grep.be with local (Exim 4.93-RC4)
	(envelope-from <w@uter.be>)
	id 1izyct-0002eg-LM; Fri, 07 Feb 2020 10:04:35 +0200
Date: Fri, 7 Feb 2020 10:04:35 +0200
From: Wouter Verhelst <w@uter.be>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: nbd@other.debian.org, den@openvz.org, eblake@redhat.com
Subject: Re: [PATCH] doc/proto: drop max-block restriction for data-less
 commands
Message-ID: <20200207080435.GA10124@grep.be>
References: <20200204120257.3685-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204120257.3685-1-vsementsov@virtuozzo.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UK4R2tD19s.A.AJ.roRPeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/802
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200207080435.GA10124@grep.be
Resent-Date: Fri,  7 Feb 2020 08:04:59 +0000 (UTC)

Thanks, applied.

On Tue, Feb 04, 2020 at 03:02:57PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> max-block restriction make sense for NBD_CMD_WRITE and NBD_CMD_READ to
> avoid big data transfer and long io operations at server side.
> NBD_CMD_WRITE_ZEROES still may be realized on server through direct
> writing zeroes, which may lead to long operation and huge allocation
> and should be restricted by max-block.
> Same for NBD_CMD_CACHE: long operation / big allocation.
> 
> Still, NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS and NBD_CMD_WRITE_ZEROES with
> NBD_CMD_FLAG_FAST_ZERO set are over-restricted by it. So, for better
> performance, drop these restrictions.
> 
> Note, that Qemu nbd server already works accordingly to this patch: it
> doesn't check the restriction for NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS
> and NBD_CMD_WRITE_ZEROES.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> RFC question: hmm, Qemu nbd doesn't check restriction for WRITE_ZEROES
> at all, even without NBD_CMD_FLAG_FAST_ZERO flag.
> 
> So, we probably could go further, and allow big WRITE_ZEROES without
> this flag..
> 
> Or may be change s/MUST NOT/SHOULD NOT/ for this case..
> 
> 
>  doc/proto.md | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index fc7baf6..4b067f5 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -815,9 +815,12 @@ Where a transmission request can have a nonzero *offset* and/or
>  the client MUST ensure that *offset* and *length* are integer
>  multiples of any advertised minimum block size, and SHOULD use integer
>  multiples of any advertised preferred block size where possible.  For
> -those requests, the client MUST NOT use a *length* larger than any
> -advertised maximum block size or which, when added to *offset*, would
> -exceed the export size.  The server SHOULD report an `NBD_EINVAL` error if
> +those requests, the client MUST NOT use a *length* which, when added to
> +*offset*, would exceed the export size. Also for NBD_CMD_READ,
> +NBD_CMD_WRITE, NBD_CMD_CACHE and NBD_CMD_WRITE_ZEROES (except for
> +when NBD_CMD_FLAG_FAST_ZERO is set), the client MUST NOT use a *length*
> +larger than any advertised maximum block size.
> +The server SHOULD report an `NBD_EINVAL` error if
>  the client's request is not aligned to advertised minimum block size
>  boundaries, or is larger than the advertised maximum block size.
>  Notwithstanding any maximum block size advertised, either the server
> -- 
> 2.21.0
> 
> 

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

