Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618E8D310E
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 10:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 12751204C4; Wed, 29 May 2024 08:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 08:24:09 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2A0D1204C0
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 08:06:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 405JgH4XDcNq for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 08:06:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 367 seconds by postgrey-1.36 at bendel; Wed, 29 May 2024 08:06:50 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3255F204B8
	for <nbd@other.debian.org>; Wed, 29 May 2024 08:06:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C2D6CE1676;
	Wed, 29 May 2024 08:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1365C2BD10;
	Wed, 29 May 2024 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716969637;
	bh=G8ukn4/ipULjaA61nZoKSh0N7cnsV0YBmRdlGxpAHeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SuVzllmYSRfquuJcDcRWnc0GHSPtFNyp26AyBluVbJ0up4tbRtITWjDNuKs1XeKsj
	 9unRV1rYyOv2gxNp3rc+jY9sEkrRoqVZBHFucwYGOw+cZtDcO5G4HtfEKacdVyOA5g
	 6mlURbCvBUcRD04eBHxPfjMS/Igzp8+knm7PD62kn5RYL66jlTq5s1KxPqTq4ABeHL
	 J7gn1nDulWyl0ZYRxhgciUY+N6bzgokG2U4wmuyIXgq6xnWCSKMrB/TqQkHYeFuDg7
	 CGmud4af4+/jP58GUdbsQFpcZukByzTLb1+jCTWsClYve1yVdsTgRE9/fLAmqjluGl
	 t4JqpvDKBOzCw==
Message-ID: <8878dcb7-5f18-4e34-b917-ee5e1ee15cff@kernel.org>
Date: Wed, 29 May 2024 17:00:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] ubd: untagle discard vs write zeroes not support
 handling
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-2-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8McAgPxztLJ.A.InEC.oYuVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2827
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8878dcb7-5f18-4e34-b917-ee5e1ee15cff@kernel.org
Resent-Date: Wed, 29 May 2024 08:24:09 +0000 (UTC)

On 5/29/24 14:04, Christoph Hellwig wrote:
> Discard and Write Zeroes are different operation and implemented
> by different fallocate opcodes for ubd.  If one fails the other one
> can work and vice versa.
> 
> Split the code to disable the operations in ubd_handler to only
> disable the operation that actually failed.
> 
> Fixes: 50109b5a03b4 ("um: Add support for DISCARD in the UBD Driver")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/um/drivers/ubd_kern.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index ef805eaa9e013d..a79a3b7c33a647 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -471,9 +471,14 @@ static void ubd_handler(void)
>  		for (count = 0; count < n/sizeof(struct io_thread_req *); count++) {
>  			struct io_thread_req *io_req = (*irq_req_buffer)[count];
>  
> -			if ((io_req->error == BLK_STS_NOTSUPP) && (req_op(io_req->req) == REQ_OP_DISCARD)) {
> -				blk_queue_max_discard_sectors(io_req->req->q, 0);
> -				blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
> +			if (io_req->error == BLK_STS_NOTSUPP) {
> +				struct request_queue *q = io_req->req->q;
> +
> +				if (req_op(io_req->req) == REQ_OP_DISCARD)
> +					blk_queue_max_discard_sectors(q, 0);
> +				if (req_op(io_req->req) == REQ_OP_WRITE_ZEROES)

Nit: this can be an "else if".

Otherwise, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> +					blk_queue_max_write_zeroes_sectors(q,
> +							0);
>  			}
>  			blk_mq_end_request(io_req->req, io_req->error);
>  			kfree(io_req);

-- 
Damien Le Moal
Western Digital Research

