Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B92DF32
	for <lists+nbd@lfdr.de>; Wed, 29 May 2019 16:06:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6AB3020858; Wed, 29 May 2019 14:06:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 14:06:38 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8E7D02080D
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2019 13:50:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m7jMM7BF-l5i for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2019 13:50:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EB9892080C
	for <nbd@other.debian.org>; Wed, 29 May 2019 13:50:24 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so2634179qtk.4
        for <nbd@other.debian.org>; Wed, 29 May 2019 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YZ+pg8aR5qtYQVgChplcfMUX8pIrRvMgQQ9ehzYO2NY=;
        b=Gv0ccnGUxwVA4CTo/MYZhnLEFa+NMtfNA1dXp7D65wkDSPkL7/+ggsF0C/UDeGkJGC
         gVMx9cP8UCjFB82NPeXC1HyYatRf7zEYiMfEd90UB8H6ubBRiYwnOVjyjfxrmFB64EJS
         459UY3oBceABLZ7+b1T19Ucuh58Xu2owPXLhWWP6WrdovjznYkXFl/EKJKNXoPu/OYeV
         6PjCnVolGMPeGhOdaTq/q1Yyfy+stN9uS68Ti3umLmlPH/SeYdHT+3J09kv+fqDOcipY
         REDPY83if8k2P3r22QjZc0VBnbYLOIdhe5OWvzlpzcqPMuBR/WYmypooktiqqy3WDP9o
         7wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YZ+pg8aR5qtYQVgChplcfMUX8pIrRvMgQQ9ehzYO2NY=;
        b=t3xmMbtcQ1cf3NcBnJNW3A7jH0LM+Bc1Xt4sT1/BdeEcPvaj+Lxto1s4mEQNOc+70/
         X4GaNXFFSNUZhuWZ6V49/JVZtA0XKZyPgQhWMl0WptPbBJCUfgF0n0gbqocHymNlITHM
         MbpS2xCIJ0CH6gsSIY+j6hOKrGDyOGQ6DZuLDtwDgXR1pXeZfmK9055e5e7V6xrWdJ04
         v83P8sJ+hqXHsDmaM08PvFAUp2txREQmPAS7aredXJBvjaI8QPPst1QTbggwh6R69Mt+
         jlS9JmMDjPpSElN0diDeKJEjoJs8Z1BuV/WL8nVZCxMrZTza6FAYSinULUuiwUtUml/P
         nEgQ==
X-Gm-Message-State: APjAAAXKbKSY/hARgi9QFHBWw0b5ouD9rU4Z65A4qrVFB5jFW0DD5Nfy
	jBMhbiydETUdXvSs23u8dD9sgw==
X-Google-Smtp-Source: APXvYqwEtNwAR1RkkEX4AEuf9rsrRVXIcPejqHjeKH7c+7L9tPPaz3vt4LvVFSsUtK81/8sbDa/Pfw==
X-Received: by 2002:a0c:d13a:: with SMTP id a55mr58174644qvh.111.1559137821888;
        Wed, 29 May 2019 06:50:21 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::d8f])
        by smtp.gmail.com with ESMTPSA id n26sm739941qtn.36.2019.05.29.06.50.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 06:50:20 -0700 (PDT)
Date: Wed, 29 May 2019 09:50:19 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: xiubli@redhat.com
Cc: josef@toxicpanda.com, axboe@kernel.dk, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	atumball@redhat.com
Subject: Re: [PATCH] nbd: fix crash when the blksize is zero
Message-ID: <20190529135018.6vbhxkuyppctqtco@MacBook-Pro-91.local>
References: <20190527054438.13548-1-xiubli@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527054438.13548-1-xiubli@redhat.com>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PNig_mxrBTH.A.O4C.uHp7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/551
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190529135018.6vbhxkuyppctqtco@MacBook-Pro-91.local
Resent-Date: Wed, 29 May 2019 14:06:38 +0000 (UTC)

On Mon, May 27, 2019 at 01:44:38PM +0800, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> This will allow the blksize to be set zero and then use 1024 as
> default.
> 
> Signed-off-by: Xiubo Li <xiubli@redhat.com>

Hmm sorry I missed this somehow

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

