Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 621EA54FBD0
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 19:01:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 46442203DF; Fri, 17 Jun 2022 17:01:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 17:01:06 2022
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 776BF203F8
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 16:43:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.616 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.228, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, TO_TOO_MANY=1,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Tw9kt2bhugot for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 16:43:20 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-f173.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3C0E520692
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 16:33:18 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id t2so4313763pld.4
        for <nbd@other.debian.org>; Fri, 17 Jun 2022 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZFZOF4kIZf5haKivlSJCFlw6yEpj+kTMN6wkZ1f2sSk=;
        b=UtjpRm5D8LM3JYdUbibOB6FAFX6fk75Lq2p67CgkHqaaRCQz1XJz8Uv06rpc6bayms
         HAktCXbEkS5clTxf2qdT0c0Kwrmy+Xip2fCF7j7dWpNmeYsAjGwzgB8ncvLxa9c2TVAV
         E8IqzPDz4D1o2iFdZPIA4gb/kBCEZlZXxEtO/N9cSQ5JfTTtKIvGvx70zu0S9oTyWHMO
         EzXCyt/byBTu4YxsIuKXilFKiv/pvax5Dl4Owur7jDs1o5Y5tgTXZsS1+yNzFVtSVS98
         mmNnYwIB2ZwMqZhDvnApPzx3NC/BmRXdVC+3L6VAj9wGUbclMcBz1OqT8XPsiZ+r23qz
         pr5g==
X-Gm-Message-State: AJIora/Ols7r4m2QYPlhURFNi/y3fGyOW5YJM0snsV8pnJj2RPXjgZUp
	koKtWyG9eyF7fIFR/knj0c8=
X-Google-Smtp-Source: AGRyM1tFt6HG3OqcSvJKpLgUFiFTa/8qOGRuw+HZNz8Qnbyh9yDTQ+C2yWV2UI5DfkTd9FHmrT3DIw==
X-Received: by 2002:a17:902:7886:b0:167:5c8c:4d3e with SMTP id q6-20020a170902788600b001675c8c4d3emr10521665pll.74.1655483594617;
        Fri, 17 Jun 2022 09:33:14 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:5d24:3188:b21f:5671? ([2620:15c:211:201:5d24:3188:b21f:5671])
        by smtp.gmail.com with ESMTPSA id j1-20020a170903028100b00163d4c3ffabsm3774192plr.304.2022.06.17.09.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 09:33:13 -0700 (PDT)
Message-ID: <017cae1e-b45f-04fd-d34c-22ae736b28e5@acm.org>
Date: Fri, 17 Jun 2022 09:33:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/5] blk-mq: Drop 'reserved' member of busy_tag_iter_fn
Content-Language: en-US
To: John Garry <john.garry@huawei.com>, axboe@kernel.dk,
 damien.lemoal@opensource.wdc.com, hch@lst.de, jejb@linux.ibm.com,
 martin.petersen@oracle.com, hare@suse.de, satishkh@cisco.com,
 sebaddel@cisco.com, kartilak@cisco.com
Cc: linux-rdma@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
 <1655463320-241202-6-git-send-email-john.garry@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1655463320-241202-6-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Xcd8iXH01oN.A.juH.SNLriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2156
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/017cae1e-b45f-04fd-d34c-22ae736b28e5@acm.org
Resent-Date: Fri, 17 Jun 2022 17:01:06 +0000 (UTC)

On 6/17/22 03:55, John Garry wrote:
> We no longer use the 'reserved' member in for any iter function so it
                                          ^^^^^^
One of these two words probably should be removed.

> diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
> index 2dcd738c6952..b8cc8b41553f 100644
> --- a/block/blk-mq-tag.c
> +++ b/block/blk-mq-tag.c
> @@ -266,7 +266,6 @@ static bool bt_iter(struct sbitmap *bitmap, unsigned int bitnr, void *data)
>   	struct blk_mq_hw_ctx *hctx = iter_data->hctx;
>   	struct request_queue *q = iter_data->q;
>   	struct blk_mq_tag_set *set = q->tag_set;
> -	bool reserved = iter_data->reserved;
>   	struct blk_mq_tags *tags;
>   	struct request *rq;
>   	bool ret = true;
> @@ -276,7 +275,7 @@ static bool bt_iter(struct sbitmap *bitmap, unsigned int bitnr, void *data)
>   	else
>   		tags = hctx->tags;
>   
> -	if (!reserved)
> +	if (!iter_data->reserved)
>   		bitnr += tags->nr_reserved_tags;
>   	/*
>   	 * We can hit rq == NULL here, because the tagging functions

Is the above change really necessary?

> @@ -337,12 +336,11 @@ static bool bt_tags_iter(struct sbitmap *bitmap, unsigned int bitnr, void *data)
>   {
>   	struct bt_tags_iter_data *iter_data = data;
>   	struct blk_mq_tags *tags = iter_data->tags;
> -	bool reserved = iter_data->flags & BT_TAG_ITER_RESERVED;
>   	struct request *rq;
>   	bool ret = true;
>   	bool iter_static_rqs = !!(iter_data->flags & BT_TAG_ITER_STATIC_RQS);
>   
> -	if (!reserved)
> +	if (!(iter_data->flags & BT_TAG_ITER_RESERVED))
>   		bitnr += tags->nr_reserved_tags;
>   
>   	/*

Same question here: is the above change really necessary?

Thanks,

Bart.

