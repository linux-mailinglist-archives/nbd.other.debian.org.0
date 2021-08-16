Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFB3ED9D2
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 17:25:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4CA65206BA; Mon, 16 Aug 2021 15:25:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 15:25:36 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FUZZY_OFFERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D57A7206B9
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 15:25:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UUr_eUiWpK6x for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 15:25:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CD00E206A3
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ExXJurjjXMstF8EaYwQ6L479EL+9o1Tc+EEWjKyddCI=; b=BbIYWS26UGf2w0VeDSjluNn75W
	O35wsULbwQieFiOazKj2RdbJ46utg7uBt+rf9Tc3Nd4xs0rtYWhi6ggd9zt3iTntjGiYVw8b+MtVt
	x30SurpHSyXCN5nz4MRVEB9SHXDmRSeLHrlgSc0Nx+2Np99e/1RrLEz0OzSHmXeEZ+YzVTMtvuoUd
	zE91FV49d+ACj6eIvEP72c9qu7t6F/d7s3rLB4Y/nJqBT1VKky6zC04K2I/BJdK8wbbvF7ExQ4ExZ
	hnd+v5+zooG6ZFMFpBVU4fFZ1eVfrZudhCVAOYzSSR8vynk73j+zMOgYCIi8NQQa8DAvbp+h8r0hJ
	mDb8WdYA==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFeUH-003tmu-LP; Mon, 16 Aug 2021 17:25:17 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFeU2-000Jyg-Qm; Mon, 16 Aug 2021 17:25:02 +0200
Date: Mon, 16 Aug 2021 17:25:02 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH] docs: Link to protocol security considerations in uri
 docs
Message-ID: <YRqDTsGF5/5nKQto@pc181009.grep.be>
References: <20210810180859.2100611-1-eblake@redhat.com>
 <20210812143924.sliiwlp6nhxlzy34@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210812143924.sliiwlp6nhxlzy34@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GCbDZfInRiB.A.z4.wNoGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1289
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YRqDTsGF5/5nKQto@pc181009.grep.be
Resent-Date: Mon, 16 Aug 2021 15:25:36 +0000 (UTC)

On Thu, Aug 12, 2021 at 09:39:24AM -0500, Eric Blake wrote:
> On Tue, Aug 10, 2021 at 01:08:59PM -0500, Eric Blake wrote:
> > Especially useful in light of the recent publishing of
> > https://nostarttls.secvuln.info/, which documents a variety of
> > implementations vulnerable to downgrade attacks in SMTP and IMAP, as
> > well as its caution that that any protocol with a STARTTLS operation
> > (which includes NBD) needs to be aware of the potential downgrade
> > attacks.
> > 
> > The NBD protocol documentation already covers what is necessary to
> > avoid the effects of a downgrade attack, and all known implementations
> > of NBD servers and clients with working NBD_OPT_STARTTLS have at least
> > one mode where TLS is mandatory rather than opportunistic.  So I don't
> > see this as a CVE against the NBD protocol itself, so much as a worry
> > about the potential for future poor implementations that disregard the
> > documentation.
> > ---
> > 
> > I'm likely to push this to the NBD spec later this week if it doesn't
> > receive any reviews beforehand.
> 
> As a followup, I got this reply from Hanno Böck on oss-security:
> 
> https://www.openwall.com/lists/oss-security/2021/08/11/8
> | The buffering vulnerabilities we found are in STARTTLS implementations
> | that have the expectation to enforce a secure connection, but suffer
> | from various vulnerabilities in the implementation.
> 
> One of the reasons that SMTP and IMAP were particularly problematic in
> implementations is that they are line-based protocols, with
> arbitrary-sized packets where the length isn't known until the \n is
> reached.  Both clients and servers have to choose whether to read one
> character at a time (painfully slow) or read ahead into a buffer and
> then processing what is in the buffer.  Many of the CVEs raised were
> in regards to mishandling such buffers, such as acting on
> previously-buffered plaintext even after the switch to encryption.
> 
> Thankfully, the NBD protocol has a much more structured handshake
> (while different NBD_OPT commands can have different payload lenghts,
> at least the header of each packet designates the length in advance,
> reducing the need for read-ahead buffering), as well as documentation
> that the NBD_OPT_ phase is a lockstep algorithm (neither client nor
> server should be building up a buffer of more than one
> command/response).
> 
> Another aspect of the SMTP/IMAP security holes came from incorrectly
> carrying state across the transition to encryption (making a false
> assumption that the answer made in plaintext will be the same when
> encrypted).  Unfortunately, I have realized that the NBD spec has one
> bit of state (NBD_OPT_SET_META_CONTEXT) where it is currently silent
> on how to handle that state across a transition to encrypted.  So I
> plan on posting a followup patch that matches the actual
> implementation of nbdkit in opportunistic mode (qemu-nbd does not
> offer opportunistic mode, and nbd-server does not suport
> NBD_OPT_SET_META_CONTEXT): a server in opportunistic mode MUST treat
> the NBD_OPT_STARTTLS command as wiping out any earlier
> NBD_OPT_SET_META_CONTEXT.

This all makes sense, thanks.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

