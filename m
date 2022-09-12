Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD55B6398
	for <lists+nbd@lfdr.de>; Tue, 13 Sep 2022 00:21:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 86DA82071D; Mon, 12 Sep 2022 22:21:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 12 22:21:12 2022
Old-Return-Path: <g.danti@assyoma.it>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=RDNS_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 844B820695
	for <lists-other-nbd@bendel.debian.org>; Mon, 12 Sep 2022 22:05:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.217 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RDNS_NONE=0.793, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tK4svq8exhIv for <lists-other-nbd@bendel.debian.org>;
	Mon, 12 Sep 2022 22:05:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 593 seconds by postgrey-1.36 at bendel; Mon, 12 Sep 2022 22:05:15 UTC
Received: from plutone.assyoma.it (unknown [212.237.56.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C0F6F20689
	for <nbd@other.debian.org>; Mon, 12 Sep 2022 22:05:15 +0000 (UTC)
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id A141E16A1948;
	Mon, 12 Sep 2022 23:55:18 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 12 Sep 2022 23:55:18 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: Discuss <zfs-discuss@list.zfsonlinux.org>
Cc: libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [zfs-discuss] ZFS-on-NBD
In-Reply-To: <ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com>
References: <ee18c441-0734-412e-8533-4ace1973a715@www.fastmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <230432cbcf171bee3f575edefd0e9805@assyoma.it>
X-Sender: g.danti@assyoma.it
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Qvi0yz3sN3P.A.8g.YD7HjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2220
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/230432cbcf171bee3f575edefd0e9805@assyoma.it
Resent-Date: Mon, 12 Sep 2022 22:21:12 +0000 (UTC)

Il 2022-09-12 22:30 Nikolaus Rath ha scritto:
> Hi all,
> 
> In case people have been wondering about the background of the various
> questions that I asked on these lists in the last few months:
> 
> I've been experimenting with running ZFS-on-NBD as a cloud backup
> solution (and potential alternative to S3QL, which I am using for this
> purpose at the moment).
> 
> In case someone is interested, here is the (rather long) write-up:
> https://www.rath.org/s3ql-vs-zfs-on-nbd.html

Interesting reading, thanks!

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

