Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C375D481621
	for <lists+nbd@lfdr.de>; Wed, 29 Dec 2021 20:06:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 891D220220; Wed, 29 Dec 2021 19:06:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Dec 29 19:06:21 2021
Old-Return-Path: <BATV+cd30f1ead4a39aaa8e4e+6702+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3C924201C0
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 Dec 2021 18:50:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id s5ezBQmroadb for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 Dec 2021 18:50:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 4489 seconds by postgrey-1.36 at bendel; Wed, 29 Dec 2021 18:50:49 UTC
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8187D201B8
	for <nbd@other.debian.org>; Wed, 29 Dec 2021 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8upZYbBQJptXDs6sEu9pcLyNTYjynBlYbcVuzKtbkL0=; b=izkEcKST5rHTQh2/36t6bEb6rc
	SoTIoDugwKTY/RcaVs+8hPCe8FiMyMSINUFh81CYhnxGIwfgIHkgQuo2B3xn5Gl2vwMROS5kAUdIh
	dgNbb4D6yvxyybHt29dTNFHp+oykssLHccVSuzmHMPPhBvpkqJhXrJSw8yw9lnskZPIr1Fp0K0Zee
	9tTN8/ncH2ogdlkyXKOQNjEnT4qwo0RSl9LjN/igFWuC7WtZzu3hH/Kdw77n2VRorP8yEY436jdM1
	O65/7FS3mBquGuFXHq4PQMSvaiQLTB7lLl1hqytJYNIPLUUpafD4XyNUh1hiV+uArT6X2C1Kc0Y0p
	Cpq9x1Dw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2crd-003CVV-NS; Wed, 29 Dec 2021 17:35:49 +0000
Date: Wed, 29 Dec 2021 09:35:49 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, bvanassche@acm.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
Message-ID: <Ycycda8w/zHWGw9c@infradead.org>
References: <20211227091241.103-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227091241.103-1-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fFt63-RPjmC.A.aqH.tGLzhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1664
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Ycycda8w/zHWGw9c@infradead.org
Resent-Date: Wed, 29 Dec 2021 19:06:21 +0000 (UTC)

On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> The rescuer thread might take over the works queued on
> the workqueue when the worker thread creation timed out.
> If this happens, we have no chance to create multiple
> recv threads which causes I/O hung on this nbd device.

If a workqueue is used there aren't really 'receive threads'.
What is the deadlock here?

