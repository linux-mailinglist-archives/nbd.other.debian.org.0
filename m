Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8999086B5
	for <lists+nbd@lfdr.de>; Fri, 14 Jun 2024 10:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 411E020B8F; Fri, 14 Jun 2024 08:48:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 14 08:48:24 2024
Old-Return-Path: <anton.ivanov@cambridgegreys.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=4.0 tests=CC_TOO_MANY,KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D367720B82
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Jun 2024 08:31:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.389 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, KHOP_HELO_FCRDNS=0.399,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GzY4lpk9mUT2 for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Jun 2024 08:31:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from www.kot-begemot.co.uk (ns1.kot-begemot.co.uk [217.160.28.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8485F20B85
	for <nbd@other.debian.org>; Fri, 14 Jun 2024 08:31:35 +0000 (UTC)
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
	by www.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1sI1MY-004Axd-Js; Fri, 14 Jun 2024 07:28:42 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
	by jain.kot-begemot.co.uk with esmtp (Exim 4.96)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1sI1MU-000Wne-1M;
	Fri, 14 Jun 2024 08:28:42 +0100
Message-ID: <b15de345-838b-4cbb-a156-22b527ed03b6@cambridgegreys.com>
Date: Fri, 14 Jun 2024 08:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] ubd: refactor the interrupt handler
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240531074837.1648501-1-hch@lst.de>
 <20240531074837.1648501-2-hch@lst.de>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
In-Reply-To: <20240531074837.1648501-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_L-9wjeF0UJ.A.9ClK.YPAbmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3008
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b15de345-838b-4cbb-a156-22b527ed03b6@cambridgegreys.com
Resent-Date: Fri, 14 Jun 2024 08:48:24 +0000 (UTC)



On 31/05/2024 08:47, Christoph Hellwig wrote:
> Instead of a separate handler function that leaves no work in the
> interrupt hanler itself, split out a per-request end I/O helper and
> clean up the coding style and variable naming while we're at it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>   arch/um/drivers/ubd_kern.c | 49 ++++++++++++++------------------------
>   1 file changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index ef805eaa9e013d..0c9542d58c01b7 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -447,43 +447,30 @@ static int bulk_req_safe_read(
>   	return n;
>   }
>   
> -/* Called without dev->lock held, and only in interrupt context. */
> -static void ubd_handler(void)
> +static void ubd_end_request(struct io_thread_req *io_req)
>   {
> -	int n;
> -	int count;
> -
> -	while(1){
> -		n = bulk_req_safe_read(
> -			thread_fd,
> -			irq_req_buffer,
> -			&irq_remainder,
> -			&irq_remainder_size,
> -			UBD_REQ_BUFFER_SIZE
> -		);
> -		if (n < 0) {
> -			if(n == -EAGAIN)
> -				break;
> -			printk(KERN_ERR "spurious interrupt in ubd_handler, "
> -			       "err = %d\n", -n);
> -			return;
> -		}
> -		for (count = 0; count < n/sizeof(struct io_thread_req *); count++) {
> -			struct io_thread_req *io_req = (*irq_req_buffer)[count];
> -
> -			if ((io_req->error == BLK_STS_NOTSUPP) && (req_op(io_req->req) == REQ_OP_DISCARD)) {
> -				blk_queue_max_discard_sectors(io_req->req->q, 0);
> -				blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
> -			}
> -			blk_mq_end_request(io_req->req, io_req->error);
> -			kfree(io_req);
> -		}
> +	if (io_req->error == BLK_STS_NOTSUPP &&
> +	    req_op(io_req->req) == REQ_OP_DISCARD) {
> +		blk_queue_max_discard_sectors(io_req->req->q, 0);
> +		blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
>   	}
> +	blk_mq_end_request(io_req->req, io_req->error);
> +	kfree(io_req);
>   }
>   
>   static irqreturn_t ubd_intr(int irq, void *dev)
>   {
> -	ubd_handler();
> +	int len, i;
> +
> +	while ((len = bulk_req_safe_read(thread_fd, irq_req_buffer,
> +			&irq_remainder, &irq_remainder_size,
> +			UBD_REQ_BUFFER_SIZE)) >= 0) {
> +		for (i = 0; i < len / sizeof(struct io_thread_req *); i++)
> +			ubd_end_request((*irq_req_buffer)[i]);
> +	}
> +
> +	if (len < 0 && len != -EAGAIN)
> +		pr_err("spurious interrupt in %s, err = %d\n", __func__, len);
>   	return IRQ_HANDLED;
>   }
>   
Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>
-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

