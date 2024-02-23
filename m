Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B1E860D25
	for <lists+nbd@lfdr.de>; Fri, 23 Feb 2024 09:47:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6C16421DBF; Fri, 23 Feb 2024 08:47:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 23 08:47:19 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8ECF321D90
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Feb 2024 08:47:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NMkflElfgJQX for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Feb 2024 08:46:58 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C662721D67
	for <nbd@other.debian.org>; Fri, 23 Feb 2024 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=k4/SJmrmJrIWPkrRmJ689Gkm3P7VkwBtPCe747pET7Y=; b=QG8uvVDZ9uRv++krVRnXkBGOh1
	XULPkRg6sqHlI6ZxxeewHfN3EQkgMvZANCGIeni1hLrGLtVmLQ1PDCPvN5xD2m36SwoFhikajEJDn
	MdLk1HfJW00wv8PQgh+foENPzGpeHg1W6oWAMwB4tHIRud8Zsp861X06eNqxMeSiZjX6Dev1bvd4x
	+zLSpT+imHJ1LZoQaXlTE/KdAgM6dSOy3ma1IEeprOWn8gfMMIlHL2U9EirFMdRpHxP6KABR5HqwG
	j0JUlCIndb0KW7o417zJOMvc6GZaDnwCVRBWzIulEXkoyWd/bnZdxiFgf707GEYlxOe3KwrdIYG5D
	TkncbGtg==;
Received: from [102.39.148.255] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rdRCq-008zax-0g;
	Fri, 23 Feb 2024 09:46:56 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rdRCg-000000004A6-3KL7;
	Fri, 23 Feb 2024 10:46:46 +0200
Date: Fri, 23 Feb 2024 10:46:46 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, guestfs@lists.libguestfs.org
Subject: Re: what size should NBD_OPT_INFO report?
Message-ID: <Zdhbdr4xizNjehmx@pc220518.home.grep.be>
References: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hVi7OSfbXuN.A.hCE.XuF2lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2767
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zdhbdr4xizNjehmx@pc220518.home.grep.be
Resent-Date: Fri, 23 Feb 2024 08:47:19 +0000 (UTC)

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
> NBD_OPT_GO, not NBD_OPT_INFO.

Yeah, that's a bug. Obviously we don't want to commit_client when we do
OPT_INFO (it's meant to do "everything needed to make sure the export is
ready to go"), but I apparently missed that it also makes sure it has
certain bits of information that OPT_INFO needs.

> The upshot is that for NBD_OPT_GO,
> there are some scenarios (treefile, F_WAIT) where nbd-server
> advertises a size of 9223372036854775807 (0x7fffffff_ffffffff) meaning
> unknown, but a size of 0 there is only possible if the file was
> successfully opened and really is zero bytes in length.  Conversely,
> NBD_OPT_INFO is always advertising a size of 0, which means most of
> the time, the size changes between NBD_OPT_INFO and NBD_OPT_GO.

That should not happen :)

I think the standard is clear enough that OPT_INFO and OPT_GO should
return the same information. The fact that I messed up doesn't mean I
think we should change the standard :-)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

