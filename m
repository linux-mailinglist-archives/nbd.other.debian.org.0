Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C302B725720
	for <lists+nbd@lfdr.de>; Wed,  7 Jun 2023 10:15:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 96B4C2057F; Wed,  7 Jun 2023 08:15:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  7 08:15:12 2023
Old-Return-Path: <BATV+e57f13fd7911cf5fc1b0+7227+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8265820565
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Jun 2023 07:58:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.49 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4WT61O_z57VU for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Jun 2023 07:58:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1232 seconds by postgrey-1.36 at bendel; Wed, 07 Jun 2023 07:58:16 UTC
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B36AE2054B
	for <nbd@other.debian.org>; Wed,  7 Jun 2023 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=uFJ/YLyasn02ccX4eOnPN90GJE
	ZXSadDNXdmXgzlGpqxVfyn1LuXll8QWajHB1C5k42xmowA61EKHp8hHIsBaGIexP1cMN1und6YZjn
	cguL618L/Wv6O7jrl3wD75Wwz+uKZB2ZaNlH77W/+4k5YsIxLzbLCMqSJtUgzGFCR+XkNZrKF6jj0
	FKZVtUfXntHxrLzfUABYRjeZl7mMwWx2aHPA51P3yyMFD0TFpHWhOhJ7U91wSopztEd0FdL+rWj2w
	KqLAZF+DmQXepg0oqUG85ajHHSP2m9ZS7NB3oSgIX0w8i7ghkNI1HqsBnNGLgMJOXKlRvNDEWTo8g
	N+cnR/Rw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q6njY-004lfP-37;
	Wed, 07 Jun 2023 07:37:32 +0000
Date: Wed, 7 Jun 2023 00:37:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zhong Jinghua <zhongjinghua@huaweicloud.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	zhongjinghua@huawei.com, yi.zhang@huawei.com, yukuai3@huawei.com,
	yangerkun@huawei.com
Subject: Re: [PATCH -next] nbd: Add the maximum limit of allocated index in
 nbd_dev_add
Message-ID: <ZIAzvKZuGrcQUx82@infradead.org>
References: <20230605122159.2134384-1-zhongjinghua@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605122159.2134384-1-zhongjinghua@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YqDwLzHopTO.A.khG.QyDgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2525
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZIAzvKZuGrcQUx82@infradead.org
Resent-Date: Wed,  7 Jun 2023 08:15:12 +0000 (UTC)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

