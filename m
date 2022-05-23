Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964F531158
	for <lists+nbd@lfdr.de>; Mon, 23 May 2022 16:33:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 10CCA20181; Mon, 23 May 2022 14:33:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 23 14:33:20 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3EF9B2011B
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 May 2022 14:16:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id isWfbLWXSy59 for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 May 2022 14:16:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x82a.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CD86520118
	for <nbd@other.debian.org>; Mon, 23 May 2022 14:16:19 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id u35so12579942qtc.13
        for <nbd@other.debian.org>; Mon, 23 May 2022 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H767C2i0qpntP2Hc25tbjn02oMYnv32wuUYy29Xv2ng=;
        b=VKeQ6xPhdr+J56IKqkCNNphoFA9/Dp/YQhSmkGwfWDKX1rbeX8HmFE31UJPFRkHOFx
         uEhxIkgD8DHNx4OWFSVU1Nqh6ZQwz7m/4I5ANeTsgKMLiKJLRkc35PzktklEcXUTAWp1
         MMPXycGF/aRmwO5QdDU2rJ1O32iAeffGYuTnGw2LAmGa4n1yzj5y+FLvaTbCp676rYBH
         //o4NKTmMCRpfHL/yl5hNQvqG5opsemec2n3ZTxWXnYwr0ITu1IO6e/47ZJIXEIt22+u
         jtmbKxyXVxT2hxvIl6MDdYWeJe5FeELdljLp9cAYp8viRD9ZX1IEroTJZ41CkKrDo+zN
         qx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H767C2i0qpntP2Hc25tbjn02oMYnv32wuUYy29Xv2ng=;
        b=MRJWd4mpOIWT1qoJT4rAQQz9K5R2vcdlkn5CtCDbpGOzwhsc6LMqcperGGskLjALH4
         ODW73G7yQ+JBxjySr3vd56KETt/hj3P6H6eyyK9V6rIr3Cwjg95fYQD2tIVSFIaR9fW0
         z+N2CYUw1kXrnqO848azz66N2G3yqcxnvjSvzr+wKZCYNIFnrHRsn1tOKpjH+5vNlFR3
         eQgBBzFcB/Xzx/IA6pVFsS7LTGHv9zAng8deIDfF7L83qf4qMaAn/OEnUkSrvpFTh5ce
         zFTfBON5XK6ga8c9+hcO6iDRLCq3yuZR05lFvd+LSpw0519an40flD7rsJ8t616lTKnf
         jzoA==
X-Gm-Message-State: AOAM530jYuUbRHiXF+5bSvBPzOjm7jvMsyj5oF5v24Awjeg9zCvKVsIq
	YocFn7KG56tOKyzqypQTholl3w==
X-Google-Smtp-Source: ABdhPJyWvmxgvwQh77GvbLiPrvty8oAChia/sMMFwbpgZEYfGVYSwOCRw3DbsadOlhmz2+uVGVAMsQ==
X-Received: by 2002:ac8:5889:0:b0:2f3:bb3f:b0d2 with SMTP id t9-20020ac85889000000b002f3bb3fb0d2mr16130738qta.593.1653315376387;
        Mon, 23 May 2022 07:16:16 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id c19-20020a05620a165300b0069fc13ce1e5sm4348806qko.22.2022.05.23.07.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:16:15 -0700 (PDT)
Date: Mon, 23 May 2022 10:16:14 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, ming.lei@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH -next v3 6/6] nbd: use pr_err to output error message
Message-ID: <YouXLg33YEIuV2aO@localhost.localdomain>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
 <20220521073749.3146892-7-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521073749.3146892-7-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nAdAF7DCVRL.A.QVC.ws5iiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2098
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YouXLg33YEIuV2aO@localhost.localdomain
Resent-Date: Mon, 23 May 2022 14:33:20 +0000 (UTC)

On Sat, May 21, 2022 at 03:37:49PM +0800, Yu Kuai wrote:
> Instead of using the long printk(KERN_ERR "nbd: ...") to
> output error message, defining pr_fmt and using
> the short pr_err("") to do that. The replacemen is done
> by using the following command:
> 
>   sed -i 's/printk(KERN_ERR "nbd: /pr_err("/g' \
> 		  drivers/block/nbd.c
> 
> This patch also rewrap to 80 columns where possible.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

