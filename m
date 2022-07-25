Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5715B5805DC
	for <lists+nbd@lfdr.de>; Mon, 25 Jul 2022 22:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F07A42058C; Mon, 25 Jul 2022 20:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 25 20:42:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3777220583
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Jul 2022 20:25:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cjrMQ_tlcAp8 for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Jul 2022 20:25:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F35EA20570
	for <nbd@other.debian.org>; Mon, 25 Jul 2022 20:25:43 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id o21so9570631qkm.10
        for <nbd@other.debian.org>; Mon, 25 Jul 2022 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jQ7HI45z5wixFb+/1Im4pHzErViUmi/CF5+gTInj3AE=;
        b=oqOA072L/kD87nOMc3gKe/vkv/qvVP0z8KtLLpIDVI1nhUlt9u9vM/8Kza+NEHD8WV
         CId7cKZYxhcQywmKBqKVftF223zsI+KZQEcZ0FieRSM3rEih+WvReAub29AapTxNn5sF
         kzv+rzDScT0ARSmviIiEonye1f7pEosRNcEgKVr6yQPOB+YkNTL5DUIYNtM7hXtiz3TC
         UHpwY5pyj1pGB9YV7fD7AHA2Y16v8uIKmYp/NCSiC4VYZuOKbJLQWLz8Wywm66uCZhvw
         J+bXiJTHp5UaYiqs4ZCE1LtVegqkjCmmO/ROmd6WF3qotpciJby5fOS5elY0ik5pesBy
         ozlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jQ7HI45z5wixFb+/1Im4pHzErViUmi/CF5+gTInj3AE=;
        b=mrG4ztptpRyTKBcDtlNY9SGq2lqkYVPqOb33T1dD0uheNfyXXF98usthQU/xunNr/G
         e08Y9QM5LLA6INSKjqrdjDGrTkk4K2NnkxaLYAlFY78RRtypj089E0XN3xrRpZtFIuTa
         TdIFbHpKR2UzqrLyUdEKnh8Dl5Y66QBPhSnjF++S2TXRrFUhkrUryJCNCSAA77OJlyqg
         bGuYrqAVuCM0FvWhxRPXzdFcjiYeU+G56v341T5p/9xwBsetEUVVOp+d+fgOVa17oR17
         BtTc6p75CMzu1qqqGwyBXMf67ykmAOFvc5R8nodUsHv7l/EnDfp7/Pb9QFgmeOOvVvMY
         TBoQ==
X-Gm-Message-State: AJIora/SIPC174GzbwiOEiZASOhQFLgC7FI6qwyWuKTZd8xn24U/1Ipt
	YU0oS2bG3z7A1zZf2Iypg+P2Sg==
X-Google-Smtp-Source: AGRyM1uTG4HZVwBBzArzy/8u/TGwyAfj5s8K5Dg5PUsYAJUdOT12doKcBg3ssTXnOYySh4d4KA3L5w==
X-Received: by 2002:a05:620a:13b9:b0:6b5:f7a0:ff7a with SMTP id m25-20020a05620a13b900b006b5f7a0ff7amr10539094qki.298.1658780740285;
        Mon, 25 Jul 2022 13:25:40 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id i10-20020a05622a08ca00b0031e9fa40c2esm7822025qte.27.2022.07.25.13.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 13:25:39 -0700 (PDT)
Date: Mon, 25 Jul 2022 16:25:38 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: joe@perches.com, axboe@kernel.dk, yukuai3@huawei.com,
	houtao1@huawei.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH v2] nbd: add missing definition of pr_fmt
Message-ID: <Yt78QrEvSap5YadH@localhost.localdomain>
References: <20220723082427.3890655-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723082427.3890655-1-yukuai1@huaweicloud.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <T2PtITacLLP.A.JGH.hAw3iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2205
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yt78QrEvSap5YadH@localhost.localdomain
Resent-Date: Mon, 25 Jul 2022 20:42:09 +0000 (UTC)

On Sat, Jul 23, 2022 at 04:24:27PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> commit 1243172d5894 ("nbd: use pr_err to output error message") tries
> to define pr_fmt and use short pr_err() to output error message,
> however, the definition is missed.
> 
> This patch also remove existing "nbd:" inside pr_err().
> 
> Fixes: 1243172d5894 ("nbd: use pr_err to output error message")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

