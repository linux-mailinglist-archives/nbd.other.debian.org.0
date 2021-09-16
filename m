Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BE35840D45D
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 10:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 91915208AE; Thu, 16 Sep 2021 08:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 08:18:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 832BE20655
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 08:01:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZepqcU_m92ke for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 08:01:36 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id EF54420625
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 08:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631779291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ltWApKc0XWyxwWW4FSF9b1OI2qV7gCHnVIU8GT27nWA=;
	b=btimZo7ClzS/fhkJpn+E9M00bD4rM1pAPOcvlwgUWaqmbB9Uq8T27VNbd1Z/0lrmc2BMJS
	cK822cJvaI59G/je5N1gXUoOOXDAgmbWkCfxBe9aDsnXHUKSTDMIYf4ofp0FcfOZnLuQOu
	taPD7vYpdHBh8roDAgJoqaF9MPlFaLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-HV3MMAAFMo6Z0FlUJAt_MQ-1; Thu, 16 Sep 2021 04:00:20 -0400
X-MC-Unique: HV3MMAAFMo6Z0FlUJAt_MQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB1FE9126D;
	Thu, 16 Sep 2021 08:00:18 +0000 (UTC)
Received: from T590 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C90100164C;
	Thu, 16 Sep 2021 08:00:10 +0000 (UTC)
Date: Thu, 16 Sep 2021 16:00:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v7 5/6] nbd: partition nbd_read_stat() into
 nbd_read_reply() and nbd_handle_reply()
Message-ID: <YUL5lm2h+f9lG8LD@T590>
References: <20210915092010.2087371-1-yukuai3@huawei.com>
 <20210915092010.2087371-6-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915092010.2087371-6-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XkmgaEu033.A.xIC.B3vQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1488
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUL5lm2h+f9lG8LD@T590
Resent-Date: Thu, 16 Sep 2021 08:18:09 +0000 (UTC)

On Wed, Sep 15, 2021 at 05:20:09PM +0800, Yu Kuai wrote:
> Prepare to fix uaf in nbd_read_stat(), no functional changes.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/block/nbd.c | 76 +++++++++++++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 22c91d8901f6..9a7bbf8ebe74 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -694,38 +694,45 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
>  	return 0;
>  }
>  
> -/* NULL returned = something went wrong, inform userspace */
> -static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> +static int nbd_read_reply(struct nbd_device *nbd, int index,
> +			  struct nbd_reply *reply)
>  {
> -	struct nbd_config *config = nbd->config;
> -	int result;
> -	struct nbd_reply reply;
> -	struct nbd_cmd *cmd;
> -	struct request *req = NULL;
> -	u64 handle;
> -	u16 hwq;
> -	u32 tag;
> -	struct kvec iov = {.iov_base = &reply, .iov_len = sizeof(reply)};
> +	struct kvec iov = {.iov_base = reply, .iov_len = sizeof(*reply)};
>  	struct iov_iter to;
> -	int ret = 0;
> +	int result;
>  
> -	reply.magic = 0;
> -	iov_iter_kvec(&to, READ, &iov, 1, sizeof(reply));
> +	reply->magic = 0;
> +	iov_iter_kvec(&to, READ, &iov, 1, sizeof(*reply));
>  	result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
> -	if (result <= 0) {
> -		if (!nbd_disconnected(config))
> +	if (result < 0) {
> +		if (!nbd_disconnected(nbd->config))

The above is actually sort of functional change, I'd suggest to do it in one
single patch because sock_xmit() won't return zero.

-- 
Ming

