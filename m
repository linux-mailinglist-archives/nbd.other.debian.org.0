Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121A40C1E6
	for <lists+nbd@lfdr.de>; Wed, 15 Sep 2021 10:39:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 283D52079B; Wed, 15 Sep 2021 08:39:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 15 08:39:10 2021
Old-Return-Path: <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 594DD20654
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Sep 2021 08:22:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id esbULQ78EfmT for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Sep 2021 08:22:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C71A2206AA
	for <nbd@other.debian.org>; Wed, 15 Sep 2021 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cnf2Z7l1EQTLpLkBteMlHZ53Wr/+qX1SRjJPZPtj5Kw=; b=ZGI1MAyFQHmfAGyw/4YdJvqSTe
	3ZceMG97ii7G0GcvEfojovEA55KFVfJ0iKpuGkbqRRxBQiFNHegRUap/3P45l4AqH0/gpm8tgJY98
	wSaL1jefV1O/+7DlhLT10nF6noACc0ZCmzbwObKhXj2WVWA2gTbFqMquqnFK4PDh/vFYQCMVDHdpd
	gdyl5S8fkt3OeoJVLrZfzeL4xpHgoxtkICPMEQd964PbN1dTXumy7/UBirodiutOW2bvMGyG34PpH
	/8jks350ROrpgjswN+7DZ+onBrnvaLhA1Q2v05dxhJwFXmbDguPItXkfOHKzWe2x1jAGeNYaCrMK1
	HuafnVMQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQQ9Q-00FV1x-Mp; Wed, 15 Sep 2021 08:20:30 +0000
Date: Wed, 15 Sep 2021 09:20:16 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, ming.lei@redhat.com,
	hch@infradead.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH v6 6/6] nbd: fix uaf in nbd_handle_reply()
Message-ID: <YUGswNyMnFHxigsW@infradead.org>
References: <20210915081537.1684327-1-yukuai3@huawei.com>
 <20210915081537.1684327-7-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915081537.1684327-7-yukuai3@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BQAj8_kBOUM.A.xAG.uEbQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1473
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUGswNyMnFHxigsW@infradead.org
Resent-Date: Wed, 15 Sep 2021 08:39:10 +0000 (UTC)

On Wed, Sep 15, 2021 at 04:15:37PM +0800, Yu Kuai wrote:
> +++ b/block/blk-core.c
> @@ -489,6 +489,7 @@ void blk_queue_exit(struct request_queue *q)
>  {
>  	percpu_ref_put(&q->q_usage_counter);
>  }
> +EXPORT_SYMBOL(blk_queue_exit);

These needs to be an EXPORT_SYMBOL_GPL.  But more importantly it
needs to be a separate properly documented patch, and this function
needs to grow a kerneldoc comment as well.

> +		/*
> +		 * Get q_usage_counter can prevent accessing freed request
> +		 * through blk_mq_tag_to_rq() in nbd_handle_reply(). If
> +		 * q_usage_counter is zero, then no request is inflight, which
> +		 * means something is wrong since we expect to find a request to
> +		 * complete here.
> +		 */
> +		if (!percpu_ref_tryget(&q->q_usage_counter)) {
> +			dev_err(disk_to_dev(nbd->disk), "%s: no io inflight\n",
> +				__func__);
> +			break;
> +		}

And this needs a properly documented wrapper as well.

> +
>  		cmd = nbd_handle_reply(nbd, args->index, &reply);
> -		if (IS_ERR(cmd))
> +		if (IS_ERR(cmd)) {
> +			blk_queue_exit(q);
>  			break;
> +		}
>  
>  		rq = blk_mq_rq_from_pdu(cmd);
>  		if (likely(!blk_should_fake_timeout(rq->q)))
>  			blk_mq_complete_request(rq);
> +		blk_queue_exit(q);

That being said I can't say I like how this exposed block layer
internals.  We don't really need a reference to the queue here
anywhere, you just use it as a dumb debug check.  If we really want to
reuse (abuse?) q_usage_counter a helper to just grab a reference and
immediately drop it might be a better fit.

