Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503F3E3BC3
	for <lists+nbd@lfdr.de>; Sun,  8 Aug 2021 19:00:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B65A2203DD; Sun,  8 Aug 2021 17:00:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug  8 17:00:09 2021
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3975C203E5
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Aug 2021 16:44:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.249,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nFJ7yxIaQ3o3 for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Aug 2021 16:44:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pj1-f46.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 81110203E4
	for <nbd@other.debian.org>; Sun,  8 Aug 2021 16:44:46 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id nt11so980611pjb.2
        for <nbd@other.debian.org>; Sun, 08 Aug 2021 09:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x86zqrZwK8I05NlyS2GLyhKTx+s5Y6a+1HCAxehwg2w=;
        b=R053Oi0ms5pPbQIcuogKxxeYAV9G1GTac+O06UHRBQSkuRC3vJW73nqF1O0gJR3/UB
         hEhgiaq54On1G3/nto/ilNLPhH0num+K9WqejwUIbxJJ7x83yY7zItNrJI37CqvVOCGS
         YX3r1eX4Pcr/QxK6G6I6Gx0Sc4SjxqQEnXOD9hkh/BpLBXEmEVi9tm9Y7Zuoxa7kEt2p
         3q0L8D5gHMBIVd0PguCKHYlOTCZu3I8V+540Yz1M/kTakgKlWLnRUtEziuMGkLYNM/RD
         MnfEYJdTRJ/rOeE7TZ9n6ChTsxOfYYVJQUPOESFnkzsVThEu/OucpUHRamKOBn4y94dP
         NS7Q==
X-Gm-Message-State: AOAM532uZjEfr7RUqN9rvFL/CuWPEFaB+n369nakJ+3wGUIMWdKzOOmg
	PzJb2OZEQoFeuipCR5eKVdw=
X-Google-Smtp-Source: ABdhPJwvbbi5JS3KyD8WVO0nXH9edgpsA9afRMG70uzrlKFAWrm/QmKeLtxu9UFauTgeoXXDJW1gpw==
X-Received: by 2002:aa7:9828:0:b029:3bd:dc3d:de5f with SMTP id q8-20020aa798280000b02903bddc3dde5fmr20227411pfl.47.1628441083293;
        Sun, 08 Aug 2021 09:44:43 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:b494:57cd:2ed2:765? ([2601:647:4000:d7:b494:57cd:2ed2:765])
        by smtp.gmail.com with ESMTPSA id v10sm4105622pfu.100.2021.08.08.09.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Aug 2021 09:44:42 -0700 (PDT)
Subject: Re: [PATCH 1/2] blk-mq: add two interfaces to lock/unlock
 blk_mq_tags->lock
To: Yu Kuai <yukuai3@huawei.com>, axboe@kernel.dk, josef@toxicpanda.com,
 ming.lei@redhat.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, yi.zhang@huawei.com
References: <20210808031752.579882-1-yukuai3@huawei.com>
 <20210808031752.579882-2-yukuai3@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <1e6b1a1e-eb45-f6c7-a8ce-e534b8cda710@acm.org>
Date: Sun, 8 Aug 2021 09:44:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210808031752.579882-2-yukuai3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <33nWI2i0zvO.A.WNH.Z2AEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1250
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1e6b1a1e-eb45-f6c7-a8ce-e534b8cda710@acm.org
Resent-Date: Sun,  8 Aug 2021 17:00:09 +0000 (UTC)

On 8/7/21 8:17 PM, Yu Kuai wrote:
> +void blk_mq_tags_lock(struct blk_mq_tags *tags, unsigned long *flags)
> +{
> +	spin_lock_irqsave(&tags->lock, *flags);
> +}
> +EXPORT_SYMBOL(blk_mq_tags_lock);
> +
> +void blk_mq_tags_unlock(struct blk_mq_tags *tags, unsigned long *flags)
> +{
> +	spin_unlock_irqrestore(&tags->lock, *flags);
> +}
> +EXPORT_SYMBOL(blk_mq_tags_unlock);

The tag map lock is an implementation detail and hence this lock must
not be used directly by block drivers. I propose to introduce and export
a new function to block drivers that does the following:
* Lock tags->lock.
* Call blk_mq_tag_to_rq().
* Check whether the request is in the started state. If so, increment
its reference count.
* Unlock tags->lock.

Thanks,

Bart.

