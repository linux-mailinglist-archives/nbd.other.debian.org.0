Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837E860D05
	for <lists+nbd@lfdr.de>; Fri, 23 Feb 2024 09:39:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 28F5E21DB4; Fri, 23 Feb 2024 08:39:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 23 08:39:31 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 4FBEE21C31
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Feb 2024 08:39:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id I2Wm4-znV7Qj for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Feb 2024 08:39:13 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 29E1321C30
	for <nbd@other.debian.org>; Fri, 23 Feb 2024 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XuUMe2YLlgar5UbmicrTjBQPtoAmUHAidQTLOvoRIXc=; b=eCxkTos/rBndoFxmxMYYkqRjvf
	5fwYnXHSndePm7ZLRwDW+cXJqkkHNUmMvUnygA/ATgP2dswDrOmtSRqooyq0w862HfCka3h5+XI90
	zuTezJrAwpChVvLfn2MDqlRs+tBAMrdrLUNsbNaCmWpCFgn+nMukFCYfQ27DellFMtXrcjESEJXND
	w3y62lpsr+gcaNlAsSXZa+TH2thtjfQZDvCoFee4A3CJnJgJ60fDLLYWUbCbHmscUTts0LHWmQXvi
	xu1MYA0ICg0Aq6w4pYI7YObMUePs50T8B/MEYzpCPvFlz37i6Y8hYDP7+wYEIHbwyWH2tLljYDD3P
	XzXuN47g==;
Received: from [102.39.148.255] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rdR5K-008vqZ-0u;
	Fri, 23 Feb 2024 09:39:10 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rdR5D-000000003gq-0nSD;
	Fri, 23 Feb 2024 10:39:03 +0200
Date: Fri, 23 Feb 2024 10:39:03 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, guestfs@lists.libguestfs.org
Subject: Re: [RFC PATCH] server: Advertise nicer size for NBD_OPT_INFO
Message-ID: <ZdhZpw-3tz2l940x@pc220518.home.grep.be>
References: <20240221203813.1776879-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221203813.1776879-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a6WPu1bxIhG.A.xgB.DnF2lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2766
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZdhZpw-3tz2l940x@pc220518.home.grep.be
Resent-Date: Fri, 23 Feb 2024 08:39:31 +0000 (UTC)

On Wed, Feb 21, 2024 at 02:35:25PM -0600, Eric Blake wrote:
> NBD_OPT_GO either advertises the actual size (possibly with an
> override from the command line or config file), the value OFFT_MAX (if
> multitree or F_WAIT means computing a real size would take too long),
> or the value UINT64_MAX (if size_autodetect fails, such as when fd is
> non-seekable); the only time it ever advertises a size of 0 is when it
> is serving a regular file that really is empty.
> 
> On the other hand, NBD_OPT_INFO had been blindly advertising 0 no
> matter what.  While we can't always compute a real size, we can do a
> lot better by advertising the same sentinels as NBD_OPT_GO.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Rich has already chimed in on my question about what size SHOULD
> nbd-server report when NBD_OPT_GO wants to list an indeterminate size;
> if we start changing the spec, then this may be incomplete or need
> tweaking.  Here, I only tackled the simple case of a single-file (or
> block device) export; there are multifile cases where NBD_OPT_GO still
> reports a more accurate number than this.  There's also the question
> of whether we want to address the information leak (right now, the
> code can succeed on NBD_OPT_INFO even when it will later fail for
> NBD_OPT_GO because the client is not authorized to used the export).

I think that should probably be fixed, too. If the client is not
authorized to use the export, I think we should also not leak
information about the export.

Second thought: does it make sense to see if the overlap of what
probe_client does could be extracted from commit_client, with
commit_client then just calling probe_client and then only doing the
other things it still needs to do? Otherwise this feels like duplicate
code, and I don't like duplicate code :)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

