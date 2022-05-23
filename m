Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D481531157
	for <lists+nbd@lfdr.de>; Mon, 23 May 2022 16:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9AB0820194; Mon, 23 May 2022 14:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 23 14:33:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 433B72017B
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 May 2022 14:15:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yKjHn4tAnQrs for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 May 2022 14:15:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x82d.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A338B20170
	for <nbd@other.debian.org>; Mon, 23 May 2022 14:15:53 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id x7so9400912qta.6
        for <nbd@other.debian.org>; Mon, 23 May 2022 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TeTm3K7EF1EHFf4zmoe+1aSPiBLGVwE736RxR6JriQw=;
        b=dUgXLYssqjZOWLLmGZ0Y4NRp9EshPYtG+0fwuB/KWuaOLfXyG0etFLRwpPjzLGby9u
         OQoAmsd3vaBSwoXAu+BB0gKbAXMa/mJJqJNO2aNn9Z7Jv5IhKyIbzS806hyNENGwtWYS
         Dq0chKEovCxugRgG8xQBCDm4wNtyDrfH6FqFlfVNq7I7Jbqdt+34VIoglN/XLkMN8Vds
         eI766KmxRlTbhXjW5hoH0fdi9s10E7pSk5ISpsWrWfySDKpXnqgYcY4oOdxDsR6//zYh
         usPENfThWB9sGRfV4iB6gfwHrVfgOxn/C1PQEJqBya0H5C2IOYB82vaPEb/uw88Un+xK
         h6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TeTm3K7EF1EHFf4zmoe+1aSPiBLGVwE736RxR6JriQw=;
        b=YnHQrpSsawd4L3E5SHjGsojTB8fuZ/wssvqqx9YUrlB18VN2YmLOevv6KTAUzBVDRH
         KR2aeBSss54gE78pWr81VRap6auhA2q0wjBnrRh9EywEm9SjcvCXsvEJZlCEbVhb5a3E
         wjcvHU4zdAfAHPmFQsfPCdcWV7hFoeYLtojVEFOLVlj3uUBeOHLzEE+rp0kcHckPcntx
         iIaUawcslvsze6MNB9Sw4VQQPkIiuM3PCibZ/cuKS0CGRxtYQwQszZ9PdhBV8b3xwoxs
         K+WU6IrRvVGbkP6lLTidTNVl4IefsAqrXeNNgA+4UYSvM1IrwCpt4smLD/STS3R4WWgE
         +NKg==
X-Gm-Message-State: AOAM531NqGX3Rg0gik4t0q6d0BiBNiTa2n2mq+pVXasfNOsFnbA9jifd
	kLPeIyGj5DFMys7uedrW7BvWVQ==
X-Google-Smtp-Source: ABdhPJyYSwBudmx7Eh413f6ybyywikS0oqi8vmZ/dzTR4gPFdR6wC52IyA/VVVnXlTeoeq9xmWHmSQ==
X-Received: by 2002:ac8:5915:0:b0:2f3:db7f:7ad8 with SMTP id 21-20020ac85915000000b002f3db7f7ad8mr16039086qty.77.1653315350326;
        Mon, 23 May 2022 07:15:50 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id w36-20020a05622a192400b002f39b99f69dsm4250366qtc.55.2022.05.23.07.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:15:49 -0700 (PDT)
Date: Mon, 23 May 2022 10:15:48 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, ming.lei@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH -next v3 5/6] nbd: fix possible overflow on 'first_minor'
 in nbd_dev_add()
Message-ID: <YouXFG5+HEie9muN@localhost.localdomain>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
 <20220521073749.3146892-6-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521073749.3146892-6-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zlxpruWU06N.A.aRC.ls5iiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2097
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YouXFG5+HEie9muN@localhost.localdomain
Resent-Date: Mon, 23 May 2022 14:33:09 +0000 (UTC)

On Sat, May 21, 2022 at 03:37:48PM +0800, Yu Kuai wrote:
> From: Zhang Wensheng <zhangwensheng5@huawei.com>
> 
> When 'index' is a big numbers, it may become negative which forced
> to 'int'. then 'index << part_shift' might overflow to a positive
> value that is not greater than '0xfffff', then sysfs might complains
> about duplicate creation. Because of this, move the 'index' judgment
> to the front will fix it and be better.
> 
> Fixes: b0d9111a2d53 ("nbd: use an idr to keep track of nbd devices")
> Fixes: 940c264984fd ("nbd: fix possible overflow for 'first_minor' in nbd_dev_add()")
> Signed-off-by: Zhang Wensheng <zhangwensheng5@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

