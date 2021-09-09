Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA74045E5
	for <lists+nbd@lfdr.de>; Thu,  9 Sep 2021 09:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6E40320780; Thu,  9 Sep 2021 07:00:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  9 07:00:10 2021
Old-Return-Path: <BATV+ab606af41e2b6213a0ed+6591+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 32872207EC
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Sep 2021 06:43:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HF3DKmH4CVEw for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Sep 2021 06:43:35 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C8EBA207DF
	for <nbd@other.debian.org>; Thu,  9 Sep 2021 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=ZCnLsYvuS3291/ykaTnxYxXK3A
	//Ot/DWxChH7LJ9EtShPlrY+l4pLZkV4L1QDtqyByukH5XOw8ix8XDTG64+r65Ti3EWTV913Z9Lt5
	xtBJT01aoq/+w/OW1ugGXf01ZUgHSeqk/U3fepvd8yFtNKaGvAtmTjzMhGPfmecEJLnyA9UTGoi++
	IjW3y2TZEYe9HaXgjzI8/a7pCJWlZdbuHREHRkSAsoYby1vZ9EAYxuWrh7lWqzq5fnJhI5YfRJQfK
	emC1F9+s/PrCePAR9WWK8l67Vky92Vl5x4JzTH1TB0UnxGuaZokoaRxmvApBRGDL1J5+MOFQMLiQt
	ikLPW/xQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mODkv-009YKp-An; Thu, 09 Sep 2021 06:42:13 +0000
Date: Thu, 9 Sep 2021 07:41:53 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v4 6/6] nbd: don't start request if nbd_queue_rq() failed
Message-ID: <YTmsse4cDT49i5My@infradead.org>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
 <20210907140154.2134091-7-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907140154.2134091-7-yukuai3@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HUPzFHPzxTM.A.IpD.6DbOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1422
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTmsse4cDT49i5My@infradead.org
Resent-Date: Thu,  9 Sep 2021 07:00:10 +0000 (UTC)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

