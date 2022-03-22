Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AC4E477B
	for <lists+nbd@lfdr.de>; Tue, 22 Mar 2022 21:27:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CD9B203C7; Tue, 22 Mar 2022 20:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 22 20:27:12 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3278C203B7
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Mar 2022 20:11:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VGWQZ2mpHeEJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Mar 2022 20:11:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x733.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C4B2D2039C
	for <nbd@other.debian.org>; Tue, 22 Mar 2022 20:11:48 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id v13so14880469qkv.3
        for <nbd@other.debian.org>; Tue, 22 Mar 2022 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v00bZ5/GrtJkHwEVsUd7zi7yA5VU4pS81+ixMGyiNzw=;
        b=t+zVhg/8DWIoJ9+TtqA9MfYhQixNsuvDLGpv2FtmuHR13aC4IiMRykbt24V7fLjGf0
         KIp2nF82eLjNJn28YsTWtPDfhcIaeQ4w21KrccvrBOa9CmL6MRroZq2Me3AE1FTNQVoA
         UjWD1Wt+diwfRBF/jNshIDtN0nzoIK3pD2E1+x64Qn1Ct1NyY2TOlZNC0nDppzi2+MLT
         +9j0GwAgchYoFywDRL4PUiopvWmZSd0jAPkFiglav9xAvzA6+mId1xcPZnVm8vfGicTp
         cuUpL4VSxX0aN/KYHdyZjA4pBjttMlcN6fP50/DO/FAPZyZDsf8PwH+7JF3AGii+1ZL9
         s5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v00bZ5/GrtJkHwEVsUd7zi7yA5VU4pS81+ixMGyiNzw=;
        b=A6cA/BiB0b2ceiD5lwBUatQ2m8+/SQ+qdTg3C2UEqipiXdv2Wjirm9FTUiBhY/eMQ6
         BzfuizXRFhX4LFHfoXxOA/cd6iG62n4M/jJHR42MWlm3Cid+tKWKCHu4q5fDH+CDsrOA
         xHD3p2ZIo/uNNzQ0JQewMuUExjPO9mhd3SKzCOmrF0jyBs011t5iZgpFsEnvyy/lye9z
         r0MjS7U05Y2eg4pg905fbASsIvXiptLK2vKujv8IxZI9CfS307mBwQyV6Zb/gzCYBtE1
         mJfpGNMK+VnEjvle7CCE2AFaArzEx5jCY864OYVpuTEOVGH6hvtsl3+Z4TQrjAGGE8Vb
         JDRQ==
X-Gm-Message-State: AOAM530e0aCIT9g95Kl/103lwDOZ4z7WwLHihZzHrXxIuyZOR8wL2XWH
	EJbXCnMx/uF0hsUEip5uMk1oiA==
X-Google-Smtp-Source: ABdhPJw2EzkiZtzBMvlZNpbdB92S79Fvr6YfPQrZJ+/2xT2gVC35TkQhMhJqaM4L+dUFXDBlTAKjmg==
X-Received: by 2002:a05:620a:200f:b0:67b:3fb7:8784 with SMTP id c15-20020a05620a200f00b0067b3fb78784mr16519494qka.336.1647979905206;
        Tue, 22 Mar 2022 13:11:45 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id a16-20020a05622a02d000b002e20e4bf4aesm7517324qtx.23.2022.03.22.13.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 13:11:44 -0700 (PDT)
Date: Tue, 22 Mar 2022 16:11:38 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, bvanassche@acm.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
Message-ID: <YjotekJZcSvwoZhp@localhost.localdomain>
References: <20211227091241.103-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227091241.103-1-xieyongji@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <20L1f6Xy8NF.A.ThE.gEjOiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1745
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YjotekJZcSvwoZhp@localhost.localdomain
Resent-Date: Tue, 22 Mar 2022 20:27:12 +0000 (UTC)

On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> The rescuer thread might take over the works queued on
> the workqueue when the worker thread creation timed out.
> If this happens, we have no chance to create multiple
> recv threads which causes I/O hung on this nbd device.
> 
> To fix it, we can not simply remove the WQ_MEM_RECLAIM
> flag since the recv work is in the memory reclaim path.
> So this patch tries to create kthreads directly to
> handle the recv work instead of using workqueue.
> 

I still don't understand why we can't drop WQ_MEM_RECLAIM.  IIRC your argument
is that we need it because a reconnect could happen under memory pressure and we
need to be able to queue work for that.  However your code makes it so we're
just doing a kthread_create(), which isn't coming out of some emergency pool, so
it's just as likely to fail as a !WQ_MEM_RECLAIM workqueue.  Thanks,

Josef

