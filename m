Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A797E438A
	for <lists+nbd@lfdr.de>; Tue,  7 Nov 2023 16:33:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1CFD72057E; Tue,  7 Nov 2023 15:33:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  7 15:33:17 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4781A2051A
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Nov 2023 15:15:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.91 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UpTvNNDmpI9y for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Nov 2023 15:15:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-qk1-x72f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8102C20507
	for <nbd@other.debian.org>; Tue,  7 Nov 2023 15:15:37 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-77773d3246aso25357485a.1
        for <nbd@other.debian.org>; Tue, 07 Nov 2023 07:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699370134; x=1699974934; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSo2uHzA475zg1anJM/RFwUnIs9F8vQ48D/x02K64wM=;
        b=H5fIj8Tl95XiuGZX8y6Aai6TXGNx5GK1Ts/fEBwYP7sb7iXD26MNCa2qHqxrzj7x9u
         rjP8MA5TeAI1sgPTYPvUu15tvWG1Ermxx8+t6CQoQVZi0xKCADT0+foCDDp88YeNOEGD
         fFKK/uedCzpcrOoh1f3xcwIpAtPynFbLQR0uT9Ww+BgEDHT2Inoe9hYY67yT4HB48aFO
         1ROjtVM1Aq/9bRqYPRN613ydkgX+aqphfG/ctlVSyjrhx353+H8avbIqNWAFTOu2XG2s
         KkvrUapWjj8XLcvYheYitfM8o+uFmW2kboP0Shf5+WsnJQwa7tGP9KOZLH1a3rJEawKm
         kyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370134; x=1699974934;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSo2uHzA475zg1anJM/RFwUnIs9F8vQ48D/x02K64wM=;
        b=mPdyfFKel8ODD2rgJuTEXt7CnJ9npZmE9SoI4wDLRnzyeHECQUeDt0vDMvlQUxBtUf
         1LtBIgI66hAd8fe4VGofua3KAoMubPuPNT7JY5dqy5u3B0tEYCrewAVePfDs/aV2C42K
         M0Gw3gA5IwjbZpuz0jbFGa/+iIkmxr8c1c1BFJNi5V2FgovirxxZRr6BDDXO76D7+ZwB
         iHNq4bs7ffiAmpJ5KfijVF7rN1IY9TMameQ57rdSymnqQxQB67FQtNmudJR1QU6ATFih
         MaIc/z8cGIEqHF99qCcWI8FtOCcqRVUlQkeSObxGF3zyVB6O3RikpxMQf2ZDeOmvZqWZ
         bdbw==
X-Gm-Message-State: AOJu0YwOW5HKq04MyqllIJI78zN761resSHh4/4cx+NqPwOMIDxaXVuT
	u9wrw8AE188YT70RksUIqp0rxA==
X-Google-Smtp-Source: AGHT+IGJa06jbPvLPTKkjguuvMggjPIeEu5QTDeqHbmw67+dg1/UxbCzkpBE+F8xjlTqdqK//qjGhQ==
X-Received: by 2002:a05:620a:19a1:b0:778:8ae9:2247 with SMTP id bm33-20020a05620a19a100b007788ae92247mr39219338qkb.5.1699370134013;
        Tue, 07 Nov 2023 07:15:34 -0800 (PST)
Received: from [127.0.0.1] ([2620:10d:c091:400::5:f968])
        by smtp.gmail.com with ESMTPSA id v19-20020ae9e313000000b007759a81d88esm4215667qkf.50.2023.11.07.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:15:33 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Li Lingfeng <lilingfeng@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org, hch@lst.de, linux-block@vger.kernel.org, 
 nbd@other.debian.org, chaitanya.kulkarni@wdc.com, yukuai1@huaweicloud.com, 
 houtao1@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com, 
 lilingfeng3@huawei.com
In-Reply-To: <20231107103435.2074904-1-lilingfeng@huaweicloud.com>
References: <20231107103435.2074904-1-lilingfeng@huaweicloud.com>
Subject: Re: [PATCH v2] nbd: fix uaf in nbd_open
Message-Id: <169937013187.545643.6485076095455389311.b4-ty@kernel.dk>
Date: Tue, 07 Nov 2023 08:15:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-26615
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dw3ve1jvRVC.A.8MF.9ilSlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2669
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/169937013187.545643.6485076095455389311.b4-ty@kernel.dk
Resent-Date: Tue,  7 Nov 2023 15:33:17 +0000 (UTC)


On Tue, 07 Nov 2023 18:34:35 +0800, Li Lingfeng wrote:
> Commit 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and
> blk_cleanup_disk") cleans up disk by blk_cleanup_disk() and it won't set
> disk->private_data as NULL as before. UAF may be triggered in nbd_open()
> if someone tries to open nbd device right after nbd_put() since nbd has
> been free in nbd_dev_remove().
> 
> Fix this by implementing ->free_disk and free private data in it.
> 
> [...]

Applied, thanks!

[1/1] nbd: fix uaf in nbd_open
      commit: 327462725b0f759f093788dfbcb2f1fd132f956b

Best regards,
-- 
Jens Axboe



