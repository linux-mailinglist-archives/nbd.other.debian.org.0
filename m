Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B67068CC
	for <lists+nbd@lfdr.de>; Wed, 17 May 2023 15:00:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7702F204A2; Wed, 17 May 2023 13:00:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 17 13:00:12 2023
Old-Return-Path: <willy@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8030E204A2
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 May 2023 12:44:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.41 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Bpwxuq1R_nft for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 May 2023 12:44:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1442 seconds by postgrey-1.36 at bendel; Wed, 17 May 2023 12:44:35 UTC
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0E0992049F
	for <nbd@other.debian.org>; Wed, 17 May 2023 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NrmV1RlXNUksQObxSTnk5T7ZKt0dHdVGx6FKtxXOMuE=; b=lz5gMl8DB28Tk7MctDq2tS5GlA
	6jrqXdvhj1jiLFhVKu9DBa7R/C1q/NIQQzW+3uK7M1QZbsB+VkHpUo+2SfY1FTkpked+w8haV+oZB
	VJSl3NByTzlAgkfrlAEkODeNDuHWkNQyA4r6mm9EckjjrPNUCcjd5qjkBNy89TZbWuqR6KcOYko9c
	KEVSjvVE/iWEJYSQC4qIao/hxYfWZxBNHfY5dfhuCdx1nXs2GHVQjN6AdC1n64DkHzEUk5cfetqBc
	NkQhEuQxcWD0XuJIJelG8PGF+FmDmdrKyt/Y3R8S9ffXUS38IT0aoAKtMtjXOqgwZNYtI6dmURcT1
	M/1FPFzA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pzG8m-0054gz-A1; Wed, 17 May 2023 12:20:24 +0000
Date: Wed, 17 May 2023 13:20:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: yang lan <lanyang0908@gmail.com>
Cc: viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
	josef@toxicpanda.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, syzkaller-bugs@googlegroups.com,
	linux-fsdevel@vger.kernel.org, axboe@kernel.dk,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, brauner@kernel.org
Subject: Re: INFO: task hung in blkdev_open bug
Message-ID: <ZGTGiNItObrI2Z34@casper.infradead.org>
References: <CAAehj2=HQDk-AMYpVR7i91hbQC4G5ULKd9iYoP05u_9tay8VMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAehj2=HQDk-AMYpVR7i91hbQC4G5ULKd9iYoP05u_9tay8VMw@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uPW5TUtazKI.A.B8E.c_MZkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2468
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZGTGiNItObrI2Z34@casper.infradead.org
Resent-Date: Wed, 17 May 2023 13:00:12 +0000 (UTC)

On Wed, May 17, 2023 at 07:12:23PM +0800, yang lan wrote:
> root@syzkaller:~# uname -a
> Linux syzkaller 5.10.179 #1 SMP PREEMPT Thu Apr 27 16:22:48 CST 2023

Does this reproduce on current kernels, eg 6.4-rc2?

> root@syzkaller:~# gcc poc_blkdev.c -o poc_blkdev

You need to include poc_blkdev.c as part of your report.

> Please let me know if I can provide any more information, and I hope I
> didn't mess up this bug report.

I suspect you've done something that is known to not work (as root,
so we won't necessarily care).  But I can't really say without seeing
what you've done.  Running syzkaller is an art, and most people aren't
good at it.  It takes a lot of work to submit good quality bug reports,
see this article:

https://blog.regehr.org/archives/2037

