Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE8821623
	for <lists+nbd@lfdr.de>; Tue,  2 Jan 2024 02:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C820320671; Tue,  2 Jan 2024 01:33:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  2 01:33:12 2024
Old-Return-Path: <senozhatsky@chromium.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3BCEB209DF
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Jan 2024 01:16:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.923 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.066,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FSL_HELO_FAKE=1.199, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hY0w8ssjxyV5 for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Jan 2024 01:15:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .chromium. - helo: .mail-ot1-x333.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F2840209D1
	for <nbd@other.debian.org>; Tue,  2 Jan 2024 01:15:53 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6dc1fdc19b6so2708448a34.0
        for <nbd@other.debian.org>; Mon, 01 Jan 2024 17:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704158150; x=1704762950; darn=other.debian.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AiGwSYUXI9fxcYVwvEl26RBkMK69KBi7r4UwJQYgdE4=;
        b=a+FyM28DRAPEa3SxD2fekCw2oGlBGRohJ3bXA/6vg7RS15+l68qgum6LWyH3RgckOt
         wD7QUsRyXht6jhd9EjjOSNG8/1ZsAAAlm+ue/2G5/BtVgEg0Ul6LAS8ETmlVTnERKGTL
         LTia7FJybH2oxIuSO3dpPWNamJkEcI9tpay24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704158150; x=1704762950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiGwSYUXI9fxcYVwvEl26RBkMK69KBi7r4UwJQYgdE4=;
        b=nBLQLh/cHlYYExut6IvVGXJTyKG4IAPw0tZRJuZe2J1oHvsyjVJlXygpbgsqHyFDWH
         AwWDAAzg6y/Rhx2QLNjWQx6SMAvOlcsAgXeNaP2DEk6IugzX7Hgj3CMzKBFj6seUZlb4
         JdgYL8yDR4u7eTov2NHlcPBGCvZ2G3RbdTkH66JqgoddY0QeJkTgn2pljVBDUt/qjDoU
         ZFXSngU+SBoouJT9HTA84tDp0G/qZ8hbGdSu+om61A0HLjrBbEvakuGtJ+Z05sbBVTEV
         7mrAyKZsaYvoa8R80UGzi4KOLfB/7v+ThSNRuof8fTzQITWG/Ymq6at9VEZEYDrpFgTa
         c7Cg==
X-Gm-Message-State: AOJu0Yx9OhclD7YW5/kmgVV6HIeACHu+BjInvgPPfjo0EaTlQ8pA/0J8
	TxwcQXtk4mDpdrhhUmtVoPFFOgppy57k
X-Google-Smtp-Source: AGHT+IH9S0eoxCJzaBceLRCqYyMLMz41Ex8ouKxN6Dp7H2vys3Lzl953E5tC2NyCU5dsGbkan5tlDA==
X-Received: by 2002:a05:6871:8983:b0:204:5246:eda6 with SMTP id tj3-20020a056871898300b002045246eda6mr19443277oab.69.1704158150228;
        Mon, 01 Jan 2024 17:15:50 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id si6-20020a17090b528600b0028b5812c477sm25447407pjb.35.2024.01.01.17.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 17:15:49 -0800 (PST)
Date: Tue, 2 Jan 2024 10:15:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 7/9] zram: use the default discard granularity
Message-ID: <20240102011543.GA21409@google.com>
References: <20231228075545.362768-1-hch@lst.de>
 <20231228075545.362768-8-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228075545.362768-8-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uKPmWlqyldP.A.4LG.Yf2klB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2700
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240102011543.GA21409@google.com
Resent-Date: Tue,  2 Jan 2024 01:33:12 +0000 (UTC)

On (23/12/28 07:55), Christoph Hellwig wrote:
> 
> The discard granularity now defaults to a single sector, so don't set
> that value explicitly

Hmm, but sector size != PAGE_SIZE

[..]

> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>  					ZRAM_LOGICAL_BLOCK_SIZE);
>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;

