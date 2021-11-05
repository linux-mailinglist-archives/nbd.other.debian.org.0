Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E0193446217
	for <lists+nbd@lfdr.de>; Fri,  5 Nov 2021 11:18:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8DA332073A; Fri,  5 Nov 2021 10:18:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov  5 10:18:12 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1262220732
	for <lists-other-nbd@bendel.debian.org>; Fri,  5 Nov 2021 10:01:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HszTeb_mC1hk for <lists-other-nbd@bendel.debian.org>;
	Fri,  5 Nov 2021 10:01:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 379F1206D4
	for <nbd@other.debian.org>; Fri,  5 Nov 2021 10:01:22 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id bm28so8235789qkb.9
        for <nbd@other.debian.org>; Fri, 05 Nov 2021 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y0eDc1jsGrKn0VCcbF5H7UdX+4+t91wUmaywlQWMyXM=;
        b=x1pfM0wbbNiyvInFur0jftbrRutkUjUhdoopeMJQxyUwHRBM6bmAYk7mJgw0MtmSk8
         WkfHRu2bmBkXFxR+iqBzXTN6FSm9Lh5cH01zeYorVX9n4rQrNemN75ZItRntBgxHpZUD
         oENXsa8kTdXdjCAosLc1b//UHi+xSdHYW+cTP1d0NgVFgQI7TKirj2AFAeZH6Rsjwbvi
         u/sYrBn5Ge/s9e43QATW23JoRGqe0bZBZXkHWJrgLxrEsBdMLZWKaU/lQzI/a6vf+2pn
         Zie+UNvz5wEH5J476yv+YvAjsArCjp68Nf5bptEEPBDk+YyhivL6drdCu2GIJlulLZd2
         23wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y0eDc1jsGrKn0VCcbF5H7UdX+4+t91wUmaywlQWMyXM=;
        b=W0dTgqMFCQzdU+rsxGB8KhLhZLJq/95K4nU47JcfN4aJn/xn0j4UbXxHwLi9iFA1ZT
         tfIQP2wG1qYrb9l9k/tfj2+Xo7KprVFXF7hXzrnqQR6PkCTbc2Hj6ZCGwTAfWED46/YL
         eWoxKz4EqzI8PzdA2MjORi4beOK3S3BaK07hYLp6WpwlcmqnZDUmroKFEFNxkCUEKykA
         qEHuQhoaXlNFlSqMeXKue8vFbTpoxnB/6bM7+y1oXdUSVOkz1DoKUYUop5mQujLuIvYx
         8kKEpL85JzhXQrXMZDTqHK9hnbiG3pCr78iYaWCLQiCJTCFVDucY8xxv0JNWTn1jCe2H
         tXRw==
X-Gm-Message-State: AOAM533/8NimkWJ9taI4LobtXVtTDPBe3dQEDRkeIUUTrPRq/34KWUfO
	D3dAEyA8u6X/Jk6fL9vm18axVg==
X-Google-Smtp-Source: ABdhPJyyimvuYtaakCbOwKmFLmiZ5qQtUn+EWJseG+kohZBRl+epslqTJXYEcqwq+0e5UW6mCItUCQ==
X-Received: by 2002:a05:620a:28ce:: with SMTP id l14mr30074240qkp.456.1636106478693;
        Fri, 05 Nov 2021 03:01:18 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id q20sm5276109qkl.53.2021.11.05.03.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 03:01:16 -0700 (PDT)
Date: Fri, 5 Nov 2021 06:01:15 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Wu Bo <wubo40@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, linfeilong@huawei.com
Subject: Re: [PATCH RESEND] nbd: code clean for nbd_genl_status()
Message-ID: <YYUA67rq5VHea2HV@localhost.localdomain>
References: <1636000703-13217-1-git-send-email-wubo40@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636000703-13217-1-git-send-email-wubo40@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <N9fN5tn24oN.A.gaG.kTQhhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1612
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YYUA67rq5VHea2HV@localhost.localdomain
Resent-Date: Fri,  5 Nov 2021 10:18:12 +0000 (UTC)

On Thu, Nov 04, 2021 at 12:38:23PM +0800, Wu Bo wrote:
> A simple code clean for nbd_genl_status()
> 
> Signed-off-by: Wu Bo <wubo40@huawei.com>

This isn't ok, genlmsg_reply() free's the reply, this introduces a double free.
Thanks,

Josef

