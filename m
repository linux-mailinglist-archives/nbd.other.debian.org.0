Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DF54FBFD
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 19:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 50CA1203F6; Fri, 17 Jun 2022 17:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 17:12:09 2022
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=FOURLA,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D273A202D3
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 16:55:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.119 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, FOURLA=0.1,
	FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-1.228, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XrSujc2LDPdh for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 16:55:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-f171.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5023B20278
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 16:55:40 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d13so4333991plh.13
        for <nbd@other.debian.org>; Fri, 17 Jun 2022 09:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NQvpbNnhd1Hb0j8v30FPXqT+MFqFElEXEqSS6ck3brY=;
        b=CC7NPIhM+nG/ij8/6vKGb/vcJhGuQtbnZ6W310zVlbbyzGfF2xt/podm5s64YJCtBS
         SPnr4WxQPEaDW4v5JjP9vtRMPjvvg0IxVs+ORDkxUIvb9wH+9qF63c6qnpU3Ixe9aVvI
         PdVHTYf7QOVPiZhJjUfGCcRNAfbGKr9+KZNEmp8FS1bpqacv4BVZZN8HSjPRMyBUQdZc
         Np3axJBtlmSRQaNdStbkK81gVRmPRMyva1KI4XBqPYTB8ZLGPKjfjCyP9foYDiuMCk5D
         /Pk20TdjqQonxIc9mkSJYFhm4IBYc7UhFKmF9YHN3aL3J46OwhfdamUkUc2G4SSIXQOD
         nlug==
X-Gm-Message-State: AJIora+q6P+Y50Wopk6BUhSgdKMikw5PnzYbspQ6GuSHaPNgotNOnA8G
	bWgmJPgUI3pcOq1rq3eZiC8=
X-Google-Smtp-Source: AGRyM1uVwwnPkhP6RYNzI5TunYKnnEx27Gq+Jz+noCToEfYq5XweGJSbPYfjWq1VJ+qXOBF2dFKLpw==
X-Received: by 2002:a17:90a:784f:b0:1ea:fa7d:7013 with SMTP id y15-20020a17090a784f00b001eafa7d7013mr7943869pjl.222.1655484936639;
        Fri, 17 Jun 2022 09:55:36 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:5d24:3188:b21f:5671? ([2620:15c:211:201:5d24:3188:b21f:5671])
        by smtp.gmail.com with ESMTPSA id x1-20020a170902820100b001690b65b2absm3014083pln.175.2022.06.17.09.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 09:55:35 -0700 (PDT)
Message-ID: <c6a0eb8d-ad51-01b1-bc17-758acc37f216@acm.org>
Date: Fri, 17 Jun 2022 09:55:34 -0700
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
 <017cae1e-b45f-04fd-d34c-22ae736b28e5@acm.org>
 <a18fa379-5a9b-ff45-3be4-b253efd96a50@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <a18fa379-5a9b-ff45-3be4-b253efd96a50@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H8NvP-s7CmK.A.89.pXLriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2158
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c6a0eb8d-ad51-01b1-bc17-758acc37f216@acm.org
Resent-Date: Fri, 17 Jun 2022 17:12:09 +0000 (UTC)

On 6/17/22 09:42, John Garry wrote:
> On 17/06/2022 17:33, Bart Van Assche wrote:
>> On 6/17/22 03:55, John Garry wrote:
>>> @@ -276,7 +275,7 @@ static bool bt_iter(struct sbitmap *bitmap, 
>>> unsigned int bitnr, void *data)
>>>       else
>>>           tags = hctx->tags;
>>> -    if (!reserved)
>>> +    if (!iter_data->reserved)
>>>           bitnr += tags->nr_reserved_tags;
>>>       /*
>>>        * We can hit rq == NULL here, because the tagging functions
>>
>> Is the above change really necessary?
> 
> It's not totally necessary. Since local variable 'reserved' would now 
> only be used once I thought it was better to get rid of it.
> 
> I can keep it if you really think that is better.

I'd prefer that these changes are either left out or that these are 
moved into a separate patch. I think that will make this patch series 
easier to review.

Thanks,

Bart.

