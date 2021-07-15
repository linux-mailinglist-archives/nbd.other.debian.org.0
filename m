Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2573C99AD
	for <lists+nbd@lfdr.de>; Thu, 15 Jul 2021 09:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6949720A42; Thu, 15 Jul 2021 07:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 15 07:33:09 2021
Old-Return-Path: <BATV+3cac5ad57d752804f19d+6535+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1CAAF20A63
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Jul 2021 07:17:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 72tMsjLOGbW2 for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Jul 2021 07:17:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1163 seconds by postgrey-1.36 at bendel; Thu, 15 Jul 2021 07:17:00 UTC
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1AEF020670
	for <nbd@other.debian.org>; Thu, 15 Jul 2021 07:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r2B8rzvM85EDJe553QQKer4o53/ntJG7vQdEqG7ZqEM=; b=Uf+ZVCN7UQuEBeb89xCO5Ofk4m
	EUW2IEDAypOGWKFpRGalnhM7+vHZotOrtwXkHq/YFz+5qDbKTgmW/hwcpqVZw4czO82L4D26hHvIq
	sVgbo59+Hxd4RVNZOWbxVNzlSXWp7ektl+H8/kHjxxHyPVLFYOVmlR9/UUM+k6Y3wsaZh6PgyFGy3
	C1nEGOyWVaBt5js9j33oXoBebUuwFms+/CmS0xLo8q/PkpDZzDIn3g8FyWnB7ncz2QtOYNAuoSI0r
	sNFqKxTj5RCrEPgZh9WkpvqMAceBcAgbI+9OeA5sb5OUFARwfJG2+0KvI9actmzi8nlivX6clD5cE
	yULzkFKQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3vHQ-0034j9-C3; Thu, 15 Jul 2021 06:56:21 +0000
Date: Thu, 15 Jul 2021 07:55:32 +0100
From: Christoph Hellwig <hch@infradead.org>
To: axboe@kernel.dk
Cc: Guoqing Jiang <guoqing.jiang@linux.dev>, josef@toxicpanda.com,
	chaitanya.kulkarni@wdc.com, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH V2] nbd: fix order of cleaning up the queue and freeing
 the tagset
Message-ID: <YO/b5Gmc6k3Xfzqk@infradead.org>
References: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
 <20210706040016.1360412-1-guoqing.jiang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706040016.1360412-1-guoqing.jiang@linux.dev>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <d2hLr_KkFXG.A.eDF.1S-7gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1221
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YO/b5Gmc6k3Xfzqk@infradead.org
Resent-Date: Thu, 15 Jul 2021 07:33:09 +0000 (UTC)

Jens, can you pick this up?

On Tue, Jul 06, 2021 at 12:00:16PM +0800, Guoqing Jiang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> We must release the queue before freeing the tagset.
> 
> Fixes: 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and blk_cleanup_disk")
> Reported-and-tested-by: syzbot+9ca43ff47167c0ee3466@syzkaller.appspotmail.com
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> Signed-off-by: Guoqing Jiang <jiangguoqing@kylinos.cn>
> ---
> V2 changes: Correct the fixes tag and mail address.
> 
>  drivers/block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index b7d663736d35..c38317979f74 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -239,8 +239,8 @@ static void nbd_dev_remove(struct nbd_device *nbd)
>  
>  	if (disk) {
>  		del_gendisk(disk);
> -		blk_mq_free_tag_set(&nbd->tag_set);
>  		blk_cleanup_disk(disk);
> +		blk_mq_free_tag_set(&nbd->tag_set);
>  	}
>  
>  	/*
> -- 
> 2.25.1
> 
---end quoted text---

