Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 044378C62A4
	for <lists+nbd@lfdr.de>; Wed, 15 May 2024 10:17:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8C47C20715; Wed, 15 May 2024 08:17:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 15 08:17:29 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2091B20713
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 May 2024 08:17:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M_EPGdHoQlok for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 May 2024 08:17:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6E01C20667
	for <nbd@other.debian.org>; Wed, 15 May 2024 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VASx7YWqqr0mCD0MOuWhTk1uP70snMduQlm3Ytwj0OM=; b=jLgiYE1UsinY3Jnbu0aOEVq7j/
	t1ZkOE2KpJU/zMTvzpTa8PwwucSbcK2OION9JqfFBuywwm5XpktPm3LoHMwlJ9HBAEnvupDn/qVmX
	Ep0sTx8hof/6SYrkuV2SZtyEbtetBi7Vbb9DfTy6oDfvWGGqAPQNNK1Oayxi3179ZnLYott+BnRm0
	wLkBh4UOPBpZDFdrG3dck7yGyyNu6PMwBDPzI390Q+0kqirxEhYJYzwTCmJPFpuedbv7nCwk70EMy
	jVdQOsGBWezZ8TdZQTrQJnT4P5XRZq5TKIbJrJjsEPiIav/9GGlGI20vMHCtRhc8Vgb+37RvwWUoS
	Bdw7QYog==;
Received: from [102.39.198.120] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1s79ow-00FFjb-0d;
	Wed, 15 May 2024 10:17:06 +0200
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1s79oo-000000002aC-1TCL;
	Wed, 15 May 2024 10:16:58 +0200
Date: Wed, 15 May 2024 10:16:58 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, guestfs@lists.libguestfs.org
Subject: Re: [Libguestfs] Re: what size should NBD_OPT_INFO report?
Message-ID: <ZkRveqZCVu24Z6jP@pc220518.home.grep.be>
References: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
 <paxaxd3fxa2nhbp2ldllolydeibtv7dsonti67cxvuz27hmtcf@6is65mo7ar3y>
 <fuy47nk42oe5jffsojcfykpdik7ld4mlp7gdwi52siopozwqa6@r7fhrfoljbs7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fuy47nk42oe5jffsojcfykpdik7ld4mlp7gdwi52siopozwqa6@r7fhrfoljbs7>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Rl3yOXvsbUH.A.yWD.Z-GRmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2808
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZkRveqZCVu24Z6jP@pc220518.home.grep.be
Resent-Date: Wed, 15 May 2024 08:17:29 +0000 (UTC)

Hi Eric,

On Tue, May 07, 2024 at 07:02:56AM -0500, Eric Blake wrote:
> On Wed, Feb 21, 2024 at 12:26:08PM -0600, Eric Blake wrote:
> > On Wed, Feb 21, 2024 at 12:19:49PM -0600, Eric Blake wrote:
> > > setupexport()
> > > - default to client->server->expected_size (if one was provided),
> > >   further validating that actual size is large enough when actual size
> > >   can be computed
> > > - if neither treefile or F_WAIT is set, compute actual size by opening
> > >   one or more files and using size_autodetect() (which does the right
> > >   thing for block devices, so my earlier thought about over-reliance
> > >   on stat() was wrong)
> > > 
> > > but these functions are only reached for NBD_OPT_EXPORT_NAME and
> > > NBD_OPT_GO, not NBD_OPT_INFO.  The upshot is that for NBD_OPT_GO,
> > > there are some scenarios (treefile, F_WAIT) where nbd-server
> > > advertises a size of 9223372036854775807 (0x7fffffff_ffffffff) meaning
> > > unknown, but a size of 0 there is only possible if the file was
> > > successfully opened and really is zero bytes in length.  Conversely,
> > > NBD_OPT_INFO is always advertising a size of 0, which means most of
> > > the time, the size changes between NBD_OPT_INFO and NBD_OPT_GO.
> > 
> > Amending myself: reading size_autodetect(), it tries ioctl(fd,
> > BLKGETSIZE64) first (even when fd is not a block device!), then falls
> > back to fstat(fd) coupled with lseek(SEEK_END) if fstat() reported
> > st_size of 0 and not a regular file; but if all of those fail, it
> > reports UINT64_MAX, which is different than OFFT_MAX.
> 
> Another wrinkle:
> 
> On BSD systems, lseek(fd_of_block, 0, SEEK_END) behaves identically to
> lseek(fd_of_block, 0, SEEK_START), because BSD has the idea that the
> size of a seekable file descriptor is whatever gets reported in
> stat().st_size which is 0 on block devices (Linux is the odd system
> out where lseek() and stat() disagree on this point - all other
> systems surveyed either reliably report the block capacity in st_size
> and SEEK_END, or use offset 0 in both places).  See this POSIX bug for
> more details:
> 
> https://austingroupbugs.net/view.php?id=1817

Sigh :-/

> If we are going to report correct capacity of block devices, it
> requires a LOT more code; compare what nbdkit is adding:
> 
> https://gitlab.com/nbdkit/nbdkit/-/merge_requests/54/diffs?commit_id=532b61745

Yeah.

In this context, I've never done much on non-Linux systems. We do indeed
try stat and lseek, but I didn't realize that was not portable. We also
use the BLKGETSIZE64 ioctl to figure out the size of a block device,
but that's *definitely* Linux-specific.

I'm definitely OK with improving that situation if we can make it
happen...

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

