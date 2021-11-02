Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9C442F06
	for <lists+nbd@lfdr.de>; Tue,  2 Nov 2021 14:21:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DBBCD204A1; Tue,  2 Nov 2021 13:21:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  2 13:21:21 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 33306204A2
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Nov 2021 13:04:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yT-GwK71L5u6 for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Nov 2021 13:04:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x734.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DBC6D204A0
	for <nbd@other.debian.org>; Tue,  2 Nov 2021 13:04:22 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id az8so8325744qkb.2
        for <nbd@other.debian.org>; Tue, 02 Nov 2021 06:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dn4BqaMm8E/Ym9b6CTx4iFhLLdRskhG8/BnMWQZMYiA=;
        b=CV7GUn5h7t+R98AniHQ+e3FbXFOMEsvZSd1hvuNMLgjeEftTO6nejnTl8CX3JEks84
         BrapEDNZbfWvf92QCz0OUemnwTATzFp37+VH//NuzccwImZ92esGMPDXXoqCuNIynyNX
         nyo3+OojZlZreduNyWOMdGQjy6xy2QhhQBbv10q8vmkX0R6az/sP1MXcB89v7TeiMEss
         2cKH6f+rR5UqoGtizvM0KK/8l1nLerqgDl2QbZ6ozhAF9GREznf2k99QroLvyvq7si5W
         kzi7SJOc/AObDiez/X8TwMNpd05WjseQc8SLwlzFMBH1kqlL3Z6P6cqVkzIuVl56U+of
         AzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dn4BqaMm8E/Ym9b6CTx4iFhLLdRskhG8/BnMWQZMYiA=;
        b=X7Cq8/V5KdTcUjboa/YTyy6L0xrO6vVDWVC7C92WWsP6MgAANSHcrtjAKqkvN77m8o
         NQU0EBcYy6/myCfPoA6ZXwjHhch8H5skK7W0iWEEgnlNxLEeRKcEji+pRxAw93UD+eme
         vNB7wYaFj+gulLnbMIwtRZgfj7RFa81+M8AvEnOoIxeQ0Sw4jOLIZCRXUjatIDf1qLzg
         9c/PiIxI/dbWX2xuMnLLsksGSpG8StatTTv8VsKbCFXgcDVC0976wYUUBk11mxTF5SeO
         ekqlDjGaongt555lteA6UDquGvmXru1Q4qNkd1GdpGb8Rs4xaYZsqLBNgoQsSPiaN2LR
         XT3A==
X-Gm-Message-State: AOAM531Z5s2ccgqglN1WBj9W3T9m3XKjziy+8elm0L+n/5Rs3wfkKuaY
	l8rSSDE45w9NF2qiiylbrGc5xA==
X-Google-Smtp-Source: ABdhPJwM+zF/tlJ4BLYeH2ZKxc5LHh/BOCcEJcjNkHrZZDYjDhcr8F0U+JBW/PrHDJZEppOhOYYJqg==
X-Received: by 2002:a05:620a:4015:: with SMTP id h21mr28584785qko.300.1635858259569;
        Tue, 02 Nov 2021 06:04:19 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id u185sm11980615qkd.48.2021.11.02.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 06:04:19 -0700 (PDT)
Date: Tue, 2 Nov 2021 09:04:16 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Ye Bin <yebin10@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v4 0/4] Fix hungtask when nbd_config_put and sanity
 check for first_minor
Message-ID: <YYE3UK//36MbVzC3@localhost.localdomain>
References: <20211102015237.2309763-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102015237.2309763-1-yebin10@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1AubCahpdAH.A.2IB.RtTghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1605
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YYE3UK//36MbVzC3@localhost.localdomain
Resent-Date: Tue,  2 Nov 2021 13:21:21 +0000 (UTC)

On Tue, Nov 02, 2021 at 09:52:33AM +0800, Ye Bin wrote:
> This patchset include two patchsets as follows:
> 1. Fix hungtask when nbd_config_put
> https://patchwork.kernel.org/project/linux-block/list/?series=573381
> 2. nbd: fix sanity check for first_minor
> https://lore.kernel.org/linux-block/20211021122936.758221-1-yukuai3@huawei.com/
> 
> I have consulted with Yu Kuai, and his modification has also been confirmed by him.
> 
> Ye Bin (2):
>   nbd: Fix incorrect error handle when first_minor is illegal in
>     nbd_dev_add
>   nbd: Fix hungtask when nbd_config_put
> 
> Yu Kuai (2):
>   nbd: fix max value for 'first_minor'
>   nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
> 
>  drivers/block/nbd.c | 42 +++++++++++++++++++-----------------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
> 

Perfect, thanks guys, you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

to the series,

Josef

