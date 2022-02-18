Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D104BBC4C
	for <lists+nbd@lfdr.de>; Fri, 18 Feb 2022 16:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 91B2E203C0; Fri, 18 Feb 2022 15:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 18 15:39:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 70A53201CC
	for <lists-other-nbd@bendel.debian.org>; Fri, 18 Feb 2022 15:21:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XKFL7V76UMuF for <lists-other-nbd@bendel.debian.org>;
	Fri, 18 Feb 2022 15:21:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x734.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CAEA02016A
	for <nbd@other.debian.org>; Fri, 18 Feb 2022 15:21:04 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id q4so6923060qki.11
        for <nbd@other.debian.org>; Fri, 18 Feb 2022 07:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dFva2jphudu5nNQOtFetMtWWxY8U+kSkf6ymT6sVouY=;
        b=6cqBgFFBOvizHU93Po+Zmf3Phx4g1oVC0Ve/zIfQpn7TkYyMnMeR1iI8Mrx1PpICf5
         Z5UAmE86htGVfvf1UDCIY/gPeDwGJ0+h9FXY1kU/AAR2Ampat4gzDgpi4r3f4XZd4ZoJ
         LMgccAH3CuN9komOtrImQ3Yg/wGl/H+D1cr3lgu089ljtPtZnIntdsk7MuAyu19rn9E+
         AVz3ae3PKLAZi1oWAXIqAO/2pVAymh7igvT2Ai0dWGeuibDwrJIRa1IlOrGy73y1b8iC
         /IOIDsgS7LoRfkVysGHJZgK2O5fBJCqRe0w3cmOqXc5d8Z1CEXkD7DgDm1wGZ1cdAes0
         oVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dFva2jphudu5nNQOtFetMtWWxY8U+kSkf6ymT6sVouY=;
        b=LukSQO0ZLTETs73WXmBqy0wsPeVrUzBcp/N9+zH76bZrsieYFRibUSyAdTztcyZFQT
         +mcJd3UZSD6xPx/goS7jJS1AV1C4Jiv1nZvUQuRcxx7ck35vEGC+O1GU/mq5RO46O/bj
         WDLsPrfS4NPgEmqNIkSBXbc2+AnxPP1K4U6iOUy68fogDUBx9cxt0+68MayRy4vm1YDp
         EqtauiZos2dv8gmGzfl+2qA0OvPWTVYvoSJDQ7X8Lto+UOShBoI1Z6Zh7yE2bSc7l7WB
         qwxEXo/kgnsU1H1DKbpRAiG9HUJ+bvtkimADUR3rvCEo/I9KvD+7Aekf9WDvy1Kdoj2X
         oOcA==
X-Gm-Message-State: AOAM530AEVP/E5jVMS1Zjv4nj/AfWo/Cnska9IEp95XhGbza0pSOdFNY
	PpYs1ifnA8nSORs9ZeWLmqBsmw==
X-Google-Smtp-Source: ABdhPJyGNUkWSTWwJo7nhA780UyQwUX+LwX0Q7tqbWJWKYGoikX/fIia26lFPmjFrxCM1vj2GlgaqA==
X-Received: by 2002:a37:c442:0:b0:60d:da8a:1c6 with SMTP id h2-20020a37c442000000b0060dda8a01c6mr4606180qkm.162.1645197661178;
        Fri, 18 Feb 2022 07:21:01 -0800 (PST)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id o5sm6282400qtp.48.2022.02.18.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 07:21:00 -0800 (PST)
Date: Fri, 18 Feb 2022 10:20:59 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
Message-ID: <Yg+5Wytvc2eG8uLD@localhost.localdomain>
References: <20211227091241.103-1-xieyongji@bytedance.com>
 <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
 <YdMgCS1RMcb5V2RJ@localhost.localdomain>
 <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
 <YdSMqKXv0PUkAwfl@localhost.localdomain>
 <CACycT3tPZOSkCXPz-oYCXRJ_EOBs3dC0+Juv=FYsa6qRS0GVCw@mail.gmail.com>
 <CACycT3tTKBpS_B5vVJ8MZ1iuaF2bf-01=9+tAdxUddziF2DQ-g@mail.gmail.com>
 <CACycT3thVwb466u2JR-oDRHLY5j_uxAx5uXXGmaoCZL5vs__mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACycT3thVwb466u2JR-oDRHLY5j_uxAx5uXXGmaoCZL5vs__mQ@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6eJNAbjuOoE.A.zmD.d27DiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1715
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yg+5Wytvc2eG8uLD@localhost.localdomain
Resent-Date: Fri, 18 Feb 2022 15:39:09 +0000 (UTC)

On Tue, Feb 15, 2022 at 09:17:37PM +0800, Yongji Xie wrote:
> Ping again.
> 
> Hi Josef, could you take a look?

Sorry Yongji this got lost.  Again in the reconnect case we're still setting up
a long running thread, so it's not like it'll happen during a normal reclaim
path thing, it'll be acted upon by userspace.  Thanks,

Josef

