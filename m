Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922444238A
	for <lists+nbd@lfdr.de>; Mon,  1 Nov 2021 23:45:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 013FA203F1; Mon,  1 Nov 2021 22:45:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  1 22:45:10 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 26F40203E9
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Nov 2021 22:27:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id V3DWyWBVAVdH for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Nov 2021 22:27:37 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x730.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AF313203CF
	for <nbd@other.debian.org>; Mon,  1 Nov 2021 22:27:37 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id i28so10162qkh.0
        for <nbd@other.debian.org>; Mon, 01 Nov 2021 15:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mliPFQw/VXY6h6LfJw+z8TDpoLPTsaNzP4QdSOLirug=;
        b=gX2iWwDZMxAwg66h05cvntq2We2412TUSARCH3vd0l9MrhRe59sUYEWUahMEYEwsmm
         1Is6pGVL11an9gIOAOSa87IkQB1zY0kUX5AR8d4u4jpbLKfG7eeByqb36lPu9uN7yAy5
         Edw6fli3oK6tRHJIc0Dg0X3zwuasPSQTuqBb4hjNk6mE3yU7euWaYxwp9zBiiljIvx0l
         bDzb/eea/LTkwB6E9cyv2CS5/64XMIfOi3NDurZMNwQqddS9bvyeuyOorWR+zOMxk61V
         2bYDdPI66TDJlVB+1jdep/krNHmsDSk4YjejyOxuNAbwdrl+ssl0343wRy6Yk9mnbdeG
         17Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mliPFQw/VXY6h6LfJw+z8TDpoLPTsaNzP4QdSOLirug=;
        b=Y3CZy/XH9vz9Ub6VycrFq4E6GsBWaudLFziN8T91z99dzjhdE8v3DYXDdXomh8Bd/P
         kl/7Af7HeE11o2I0MyZ7Aag0PxwQr3NGvDVz5RMzk0xUhQA3j6h6aSckvxsDEojKWjz8
         /fsMVRm6eDyJ5GvG2Mw2OaDQ0sCITTkdfXzkZukk+m8IJ9+1evhOnwvu7EMhUkhlF699
         6HYLGxUpWJ7E+nHvo+nrW4MSPNTPjcan+uYjpCsgjgWc4CFFyZCoQpV1Zht1VEdGnSMa
         yJBNvJO/ci5VzjLulTyFqoWaHub8H403c0mxwvGTXiUvOrwHeyt7ZXDnuyK+guc18j50
         ivRw==
X-Gm-Message-State: AOAM530emr7TydOYTj1j7X+3cpB5sA0fBR4NUJ/nZ85U2g4MofI2nFhe
	d9PLDEHHYVAexxx2fYenxdaxmg==
X-Google-Smtp-Source: ABdhPJzKaslVle6xaIWUiwO8S+vEDWP3Uhb242PjJ4oPKfpLLEk+Y1oAfGLg0KjBouG+cDsp+lj6ew==
X-Received: by 2002:a05:620a:1381:: with SMTP id k1mr25078573qki.492.1635805654062;
        Mon, 01 Nov 2021 15:27:34 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id q13sm11520686qtx.80.2021.11.01.15.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 15:27:33 -0700 (PDT)
Date: Mon, 1 Nov 2021 18:27:32 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Ye Bin <yebin10@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yukuai3@huawei.com
Subject: Re: [PATCH -next v3 0/2] Fix hungtask when nbd_config_put
Message-ID: <YYBp1LO83KWlov7V@localhost.localdomain>
References: <20211101062956.791573-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101062956.791573-1-yebin10@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cLR68zdbKQN.A.eGC.23GghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1599
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YYBp1LO83KWlov7V@localhost.localdomain
Resent-Date: Mon,  1 Nov 2021 22:45:11 +0000 (UTC)

On Mon, Nov 01, 2021 at 02:29:54PM +0800, Ye Bin wrote:
> Ye Bin (2):
>   nbd: Fix incorrect error handle when first_minor big than '0xff' in
>     nbd_dev_add
>   nbd: Fix hungtask when nbd_config_put
> 
>  drivers/block/nbd.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 

Hmm this seems to overlap with the series

https://lore.kernel.org/linux-block/20211021122936.758221-1-yukuai3@huawei.com/

and they are different checks, can y'all work out what this is supposed to look
like and send one series to integrate both sets of fixes?  Thanks,

Josef

