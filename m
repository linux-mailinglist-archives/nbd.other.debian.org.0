Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B27A47E4355
	for <lists+nbd@lfdr.de>; Tue,  7 Nov 2023 16:21:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 95DF42053B; Tue,  7 Nov 2023 15:21:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  7 15:21:14 2023
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,FOURLA,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5AF4920482
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Nov 2023 15:05:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.09 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	FOURLA=0.1, RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id R8AcxbTXQ4av for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Nov 2023 15:05:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf2f.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 93FE420458
	for <nbd@other.debian.org>; Tue,  7 Nov 2023 15:05:26 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-66d09b6d007so40109006d6.1
        for <nbd@other.debian.org>; Tue, 07 Nov 2023 07:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1699369523; x=1699974323; darn=other.debian.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zQkRUxp/qdG+mcqyz+AwKHOCtNKbDsz1x2+FtX/ZT2k=;
        b=mXcQRpl0gVwv7qzit4MKC4scxFXPUA4Ibtsi0ReAGalX8Q9E/5GNVMMjZQ8FDXHk46
         Vhbro58Hm2l2TWTw/DqFzQ0HE1Hkhd3Rw3UFT8XEXKnmZGnlBBdJqNFKH4AneC+o097L
         +Cq5tEInClqRNq/MEcr6LZQ0bmBRMrMDMs/NxFn3hO8PmD7elkU1qi2DeKe3Lk4JXcJg
         DoFDkaG8ETIa9Rvlz2HBUBMaUmF8VBSIKrnQZiltaGP5ReCoYBCs42obSxZxNnxWPoXH
         vVFpshQC5FasxsneABqnHnKJwUzN7Dt1Aqoc3y5i1e6z9B4VEBywedqTRJ/VVptRnAUX
         y5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699369523; x=1699974323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQkRUxp/qdG+mcqyz+AwKHOCtNKbDsz1x2+FtX/ZT2k=;
        b=SiK9lEl2ZHqwc4eJk0kP0TfaxXK4bGRLkLE+54/LxGNyq6wLCzbThWS4tZGNKK0isI
         bpc2lafABiFpKqlY/jFRrK3C9LUXE9HZKLONM1PSAc4VIVybujKdCLKNO+2D8hx2qeGJ
         MlYzlEsjSdjAzwfYFdKQ/F1F7w5OJ0oId13QONQUY1b9ZYbsC7ZejbuhE/KWfMTje/X4
         P8k1hoc0cry6jfhToycmVhfyzNSYj8YRdMmTVCZVQPrvmdDom0B+x3B0TEhpf1MWza71
         LsD8VfyylLEu7W6N1xm53j62Yaer/Jmshev7i1Dgw1lgoCu6M1vPvQXj29rJE2ObcVDr
         FwhA==
X-Gm-Message-State: AOJu0Yz68TqMx+48bO1En0gkEkBXiOAWW3devBeRyd6bk2GH3zmXyxA+
	/VaN1RdzhbSuzHYtAvH+5chAFQ==
X-Google-Smtp-Source: AGHT+IEabMSzZhzNJnvV8OfKHuh5oG/MF4IuVEHRT7Fo18Mvt+izrWP08VqFjmSyWeotreAUOrkDnA==
X-Received: by 2002:a05:6214:2465:b0:66d:145b:4591 with SMTP id im5-20020a056214246500b0066d145b4591mr44234443qvb.27.1699369523061;
        Tue, 07 Nov 2023 07:05:23 -0800 (PST)
Received: from localhost (cpe-76-182-20-124.nc.res.rr.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id ev20-20020a0562140a9400b0066cfbe4e0f4sm4414806qvb.26.2023.11.07.07.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:05:22 -0800 (PST)
Date: Tue, 7 Nov 2023 10:05:20 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Li Lingfeng <lilingfeng@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org, hch@lst.de, linux-block@vger.kernel.org,
	nbd@other.debian.org, axboe@kernel.dk, chaitanya.kulkarni@wdc.com,
	yukuai1@huaweicloud.com, houtao1@huawei.com, yi.zhang@huawei.com,
	yangerkun@huawei.com, lilingfeng3@huawei.com
Subject: Re: [PATCH v2] nbd: fix uaf in nbd_open
Message-ID: <20231107150520.GA3913709@perftesting>
References: <20231107103435.2074904-1-lilingfeng@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107103435.2074904-1-lilingfeng@huaweicloud.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7sPnz_wizYD.A.UyC.qXlSlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2668
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231107150520.GA3913709@perftesting
Resent-Date: Tue,  7 Nov 2023 15:21:14 +0000 (UTC)

On Tue, Nov 07, 2023 at 06:34:35PM +0800, Li Lingfeng wrote:
> From: Li Lingfeng <lilingfeng3@huawei.com>
> 
> Commit 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and
> blk_cleanup_disk") cleans up disk by blk_cleanup_disk() and it won't set
> disk->private_data as NULL as before. UAF may be triggered in nbd_open()
> if someone tries to open nbd device right after nbd_put() since nbd has
> been free in nbd_dev_remove().
> 
> Fix this by implementing ->free_disk and free private data in it.
> 
> Fixes: 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and blk_cleanup_disk")
> Signed-off-by: Li Lingfeng <lilingfeng3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

