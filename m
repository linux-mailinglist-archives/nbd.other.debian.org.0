Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE224045C7
	for <lists+nbd@lfdr.de>; Thu,  9 Sep 2021 08:48:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9C99D2076D; Thu,  9 Sep 2021 06:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  9 06:48:09 2021
Old-Return-Path: <BATV+ab606af41e2b6213a0ed+6591+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 203F7207A9
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Sep 2021 06:32:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id orToLYgaPAJI for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Sep 2021 06:32:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AD0DA20778
	for <nbd@other.debian.org>; Thu,  9 Sep 2021 06:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=41B3xOaMOkOmkYBxAKE/Vt8LAMpecipLwlcFajaS190=; b=bmbhsHTpBgF2UF3+6HWRRO5QfG
	63oHMi5nIn0c6pZA5vdIKY/UXIl6vfB6znesd2KbFRhVXEEXYKRl5nY9cFifcVgqVSheJorjh7ekW
	aEmfKcsbLK/kgH59on5+f9CcRoOgK9OhIc6eBXtoCr8uxTV0VE71b3XM2zxv1JGKSqnbTgT58bVhY
	Z8cPepq+4rXdwPozI2ooTWIKNwoi4jRn6eFtine3zFc6lbCoXp5Y4NbXdgJI57vGMgy7mYeWmIGpv
	YAfvBnlRUNGq7sA+dXit3craTzunBcHuuPRikYVVqF3WDSZ1z4FedDYHgVbFMmE108bprdjN/rEWe
	oVVkHFhw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mODaO-009Xty-Sq; Thu, 09 Sep 2021 06:31:06 +0000
Date: Thu, 9 Sep 2021 07:31:00 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, yixingchen@bytedance.com
Subject: Re: [PATCH] nbd: clear wb_err in bd_inode on disconnect
Message-ID: <YTmqJHd7YWAQ2lZ7@infradead.org>
References: <20210907121425.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907121425.91-1-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <J9mF2mMAJrL.A.qVE.p4aOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1420
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTmqJHd7YWAQ2lZ7@infradead.org
Resent-Date: Thu,  9 Sep 2021 06:48:09 +0000 (UTC)

On Tue, Sep 07, 2021 at 08:14:25PM +0800, Xie Yongji wrote:
> When a nbd device encounters a writeback error, that error will
> get propagated to the bd_inode's wb_err field. Then if this nbd
> device's backend is disconnected and another is attached, we will
> get back the previous writeback error on fsync, which is unexpected.
> To fix it, let's clear out the wb_err on disconnect.

I really do not like how internals of the implementation like into
drivers here.  Can you add a block layer helper to clear any state
instead? This should incude e.g. the size just cleared above and should
also be used by the loop driver as well.

