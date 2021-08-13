Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C43EB757
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 17:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7402620354; Fri, 13 Aug 2021 15:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 15:03:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F3FA32041A
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 14:47:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gdgGrSXEUo89 for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 14:47:16 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x731.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0B9A820416
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 14:47:12 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id p22so9806492qki.10
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pJUAeuT5dql7SLbNjaubRSET7ltdy9O4i1dg9BO//tA=;
        b=JDv5ki/1sxSbU7ZwM+tiXT7s1oV87pX6XrIMJSlTG+75fdgGHGabiZ07E6zUPxRqtB
         dZa1kAOLhm5YCgXxrowEg6P+LxAYZ6k2/VRq7x1ykS23q9WbM7JQ9ZpMMNzKSNJzrHDF
         EPQ8yhmBsgOhVQz+pMUvOyiS6oB26CYN/tczi36HxDhFks4/gjQf/auDWf8yXwqA78jv
         qupzqjLpiw8Si4hb1dvvGIGIS/I+cCRU0Tt9xNUrH9lxAjoEtZNmvGh189pmMO3yXEVz
         7Mlhs9wmQG8BDUZ8Xk8JSybsJhXgYSxRM3Hze2kXHDBpxiP+RzMRhmXqO00VC/AcKJqg
         5a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pJUAeuT5dql7SLbNjaubRSET7ltdy9O4i1dg9BO//tA=;
        b=bFFhJ53ySg6Hpp00Yhp4Pz0GIVHPyQbxckyIlebwKmQN6k/ITRoPtC/yLvyxsaQ9RU
         TV6AEm6mwVn4/h9Pdfjibx+kVOsvwmvPYUSqXfXGoEc6BKV74hklUv4HbLggzPu/ykWj
         QGHkW8KDBzCFYmwS4HnE36xdxnNvxnmCBkUu7XowSv3slCzYCIH698B2L0avtXpw3TGu
         RCZSAla0tFz0EcLYDAkY189rPaAhSNqcJX6dyI6Sso5Rdq8Px2NqT1olXFZUFBWoty6i
         QF9pVBj382+KtVOdaULkXAyVp31/lwqWCqK4g21ZWCMlRTTGmqhNEAufoJVOyi7b04lf
         OjuA==
X-Gm-Message-State: AOAM532uDH9QcNSTH3eyreEtGlEq7qnXvFwMTGNjJdUMDBip21eBkwpp
	irQrINRcjdJ0vYm5YQHY7pb3lw==
X-Google-Smtp-Source: ABdhPJx5kN1RkqRHoEePn16yTxBHjudVhJVbO3/Q43sdjV0l6jLJKyNapALDMeOF3R3TaVv0AQMIKw==
X-Received: by 2002:a05:620a:13c8:: with SMTP id g8mr2511824qkl.258.1628866029169;
        Fri, 13 Aug 2021 07:47:09 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id j18sm981673qke.75.2021.08.13.07.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 07:47:08 -0700 (PDT)
Subject: Re: [PATCH 6/6] nbd: reduce the nbd_index_mutex scope
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Tao <houtao1@huawei.com>
References: <20210811124428.2368491-1-hch@lst.de>
 <20210811124428.2368491-7-hch@lst.de>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <be56a424-7599-77f5-3f57-1f4609b3a0e6@toxicpanda.com>
Date: Fri, 13 Aug 2021 10:47:04 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811124428.2368491-7-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZHQVhgemaQJ.A.WOC.tmoFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1281
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/be56a424-7599-77f5-3f57-1f4609b3a0e6@toxicpanda.com
Resent-Date: Fri, 13 Aug 2021 15:03:09 +0000 (UTC)

On 8/11/21 8:44 AM, Christoph Hellwig wrote:
> nbd_index_mutex is currently held over add_disk and inside ->open, which
> leads to lock order reversals.  Refactor the device creation code path
> so that nbd_dev_add is called without nbd_index_mutex lock held and
> only takes it for the IDR insertation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/block/nbd.c | 55 +++++++++++++++++++++++----------------------
>   1 file changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 0b46a608f879..4054cc33fc1e 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1681,7 +1681,7 @@ static const struct blk_mq_ops nbd_mq_ops = {
>   	.timeout	= nbd_xmit_timeout,
>   };
>   
> -static struct nbd_device *nbd_dev_add(int index)
> +static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>   {
>   	struct nbd_device *nbd;
>   	struct gendisk *disk;
> @@ -1707,6 +1707,7 @@ static struct nbd_device *nbd_dev_add(int index)
>   	if (err)
>   		goto out_free_nbd;
>   
> +	mutex_lock(&nbd_index_mutex);
>   	if (index >= 0) {
>   		err = idr_alloc(&nbd_index_idr, nbd, index, index + 1,
>   				GFP_KERNEL);
> @@ -1717,6 +1718,7 @@ static struct nbd_device *nbd_dev_add(int index)
>   		if (err >= 0)
>   			index = err;
>   	}
> +	mutex_unlock(&nbd_index_mutex);
>   	if (err < 0)
>   		goto out_free_tags;
>   	nbd->index = index;
> @@ -1743,7 +1745,7 @@ static struct nbd_device *nbd_dev_add(int index)
>   
>   	mutex_init(&nbd->config_lock);
>   	refcount_set(&nbd->config_refs, 0);
> -	refcount_set(&nbd->refs, 1);
> +	refcount_set(&nbd->refs, refs);
>   	INIT_LIST_HEAD(&nbd->list);
>   	disk->major = NBD_MAJOR;
>   	disk->first_minor = index << part_shift;
> @@ -1847,34 +1849,35 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
>   		nbd = idr_find(&nbd_index_idr, index);
>   	}
>   
> -	if (!nbd) {
> -		nbd = nbd_dev_add(index);
> -		if (IS_ERR(nbd)) {
> +	if (nbd) {
> +		if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
> +		    test_bit(NBD_DISCONNECT_REQUESTED, &nbd->flags)) {
> +			nbd->destroy_complete = &destroy_complete;
>   			mutex_unlock(&nbd_index_mutex);
> -			pr_err("nbd: failed to add new device\n");
> -			return PTR_ERR(nbd);
> +
> +			/* wait until the nbd device is completely destroyed */
> +			wait_for_completion(&destroy_complete);
> +			goto again;
>   		}
> -	}
>   
> -	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
> -	    test_bit(NBD_DISCONNECT_REQUESTED, &nbd->flags)) {
> -		nbd->destroy_complete = &destroy_complete;
> +		if (!refcount_inc_not_zero(&nbd->refs)) {
> +			mutex_unlock(&nbd_index_mutex);
> +			if (index == -1)
> +				goto again;
> +			pr_err("nbd: device at index %d is going down\n",
> +		       		index);

Errant whitespace here.  Thanks,

Josef

