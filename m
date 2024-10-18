Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E09DB9A41F2
	for <lists+nbd@lfdr.de>; Fri, 18 Oct 2024 17:06:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BD18020570; Fri, 18 Oct 2024 15:06:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 18 15:06:14 2024
Old-Return-Path: <leon@is.currently.online>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9A2B42054E
	for <lists-other-nbd@bendel.debian.org>; Fri, 18 Oct 2024 14:50:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.399 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, FROM_SUSPICIOUS_NTLD=0.5, PDS_OTHER_BAD_TLD=1.999]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0NrLhrR4rWcC for <lists-other-nbd@bendel.debian.org>;
	Fri, 18 Oct 2024 14:50:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 544 seconds by postgrey-1.36 at bendel; Fri, 18 Oct 2024 14:50:09 UTC
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 337252053B
	for <nbd@other.debian.org>; Fri, 18 Oct 2024 14:50:09 +0000 (UTC)
Received: from galatea.uberspace.de (galatea.uberspace.de [185.26.156.241])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id D8E6217F889
	for <nbd@other.debian.org>; Fri, 18 Oct 2024 16:40:34 +0200 (CEST)
Received: (qmail 5142 invoked by uid 989); 18 Oct 2024 14:40:34 -0000
Authentication-Results: galatea.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by galatea.uberspace.de (Haraka/3.0.1) with ESMTPSA; Fri, 18 Oct 2024 16:40:34 +0200
From: Leon Schuermann <leon@is.currently.online>
To: Ming Lei <ming.lei@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, josef@toxicpanda.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, nbd@other.debian.org, eblake@redhat.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: Kernel NBD client waits on wrong cookie, aborts connection
In-Reply-To: <Zw8i6-DVDsLk3sq9@fedora>
References: <Zw5CNDIde6xkq_Sf@redhat.com>
 <CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com>
 <Zw5b1mwk3aG01NTg@fedora>
 <CAFj5m9+x+tiAAKj3dX_WcFczkdSNaR6nguDHm9FXuYjQHd8YcA@mail.gmail.com>
 <Zw5nMQoPrSIq9axl@fedora> <Zw6S6RoKWzUnNVpu@redhat.com>
 <Zw8i6-DVDsLk3sq9@fedora>
Date: Fri, 18 Oct 2024 10:40:32 -0400
Message-ID: <87bjzh4gpr.fsf@silicon.host.schuermann.io>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.469622) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.569622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=is.currently.online; s=uberspace;
	h=from:to:cc:subject:date;
	bh=JVrCoboDiUiYRLORxxPe9PdtamvYplW3bwRbxTchpLg=;
	b=vZOu+pcIQRAx5WkNzV/4eDch58/ygHrwolw4/Vc7wUw4U1NBItKxlamBHM8z6x2FC202gUcPQi
	DwDeoAFGo9GQFdRokVEZKAF827gouJDlk6Jc9VBIQZTdQoAWTmb9kHXPyf76ZPA45Um8tcEowBXC
	M2apFw6levChiNXRcecWXR9Mp87hGbWtJTVUzQAgmsjGmXK6yf7bwiDH4dFshr+ph0ENa4VINXjD
	OwBY078dr2UH2U61NZeZsaG69JpK8tyA/3EzuNhajj33Hfw8w43ZOheNMdzs7X/RMGiESsjSa0LW
	qbG/OmsP3lhzMCETVA+G4ph5kx1OQ4xCgOfslIx8QCcbyE+hDxZYtkbIdKWyHYmM9x3QCbXEIKYH
	n3Dofl/5yp/3qiG8NQBgor5exwtUWfuqBO62UDLafebHOSlwqYlylvng9BXy7sY+odx5slCo+enl
	ArWHLCYyGllWajrgrAsazeAKUJWioj2AmG3qQHX12fE0OYxRNBrb8OGlnarvNwrAKTw3rxA6BHTx
	8++AuKdtgXwAnfwDLDFW/mQQv4H26/uqzbXlK2OxFp5Te9HkhixSkrib3wRLR2XDDNBj23p30jwX
	GnnfsZzjzK7atK8fm7aWxcxmfoGx6wnHEPlYOsBRtlRfMFLFwA2jisASMSJE9Vg/mmYRQLftzByT
	Q=
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LYJd6uMM1pE.A.kLk.mlnEnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3179
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/87bjzh4gpr.fsf@silicon.host.schuermann.io
Resent-Date: Fri, 18 Oct 2024 15:06:14 +0000 (UTC)

Thanks for CCing me on this thread. Indeed this seems to be the exact
same issue that I (and Vincent Chen) reported in the other thread [1].

Ming Lei <ming.lei@redhat.com> writes:
> diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
> index 2cafcf11ee8b..3cc14fc76546 100644

I can confirm that this patch fixes these issues.

Prior to this patch, I managed to reproduce both the "Unexpected reply"
and "Double reply" bugs reliably via a TCP/IP connection between two
AMD64 VMs on different hosts, two aarch64 VMs, and an aarch64 Raspberry
Pi 5 SBC connecting to an NBD server on another host.

With this patch, at least in the AMD64 VM setup, it survived an
hour-long stress test using the `stress-ng` command from [1]. Also,
sending a SIGINT to a process actively using the disk often manifested
this bug. I could not reproduce this faulty behavior with this patch.

I'm still working on backporting this to and compiling the v6.6
Raspberry Pi vendor kernel and will report my observations there. I'll
also try Ming's v2 from [2].

Thanks!

-Leon

[1]: https://lore.kernel.org/linux-block/87jzea4w2n.fsf@silicon.host.schuermann.io/
[2]: https://lore.kernel.org/linux-block/20241018140831.3064135-1-ming.lei@redhat.com/

