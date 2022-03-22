Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C09EE4E3A8E
	for <lists+nbd@lfdr.de>; Tue, 22 Mar 2022 09:28:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A4D46203D5; Tue, 22 Mar 2022 08:28:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 22 08:28:02 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 541C920355
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Mar 2022 08:10:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FDkgxLQA5KTf for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Mar 2022 08:10:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x633.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AABF020326
	for <nbd@other.debian.org>; Tue, 22 Mar 2022 08:10:03 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r13so34502543ejd.5
        for <nbd@other.debian.org>; Tue, 22 Mar 2022 01:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXb3smoMBvhttrnsQRq5L6nwxrUqkBCEz6UXeK2LsH8=;
        b=4tHROM5eCxSqEH+0gGrEnQdJzb3byz4cfatE08GCqso2U3NWO33XyHCsHGRAAGtbKb
         t0efUnAewq8+OrK/I02DP8+aliGeDn/7Km2OaIUVZMy2f9DpgJysKEIUAyYjddfPipvN
         puMJrcdYUcuPoFZPWnzDHsxq63L5tYZ+3mHGLKQz83yUofsP+oD1R2hWtJ5uwSGef/rc
         9l4vj24A8/wEqvnAGDttH5GhAmknGrb9cjKm2Zi74KqBSmQUEwDm2b2aNXCPaTirTsAu
         +P+7mZafsecyY22vSVQml7i+bhCjkwkzmDhwnqObhFslS4D1a80RgoZXET2PWNqozcnL
         Of0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXb3smoMBvhttrnsQRq5L6nwxrUqkBCEz6UXeK2LsH8=;
        b=IbGLTRuisPEshpj9ufmdPZC6zYNqyeNq/fA6FCaYALBx6ohr7JnBPW18NgE1JhCyLx
         RvggoKnHB+QB6EmAZPXae0SmtPImV1cm44pn6/KVd1gzy8pTASXTjR3D1UafXzbsoGHm
         lvVDuQ2rJZ07NRBulwPo0Fxu9w7uDXFiTq4xDmEnrGyX78RFurhmGxokzqUCiOs0q/m8
         Z2WUJEscCqvU5F0eJEWPkWelx4Gpask0xa7/B2uHo/hWLc/jumP71IQEIHuTm83VwBz3
         //Je8lbHH0Msdw2pf1LEz6aND+zv6yFwskcVCUF4NhmWZJXi7RKarCSrYAnBGF4ebvhS
         vmTA==
X-Gm-Message-State: AOAM531XzUlNo1zm+xJq4lTgiOnieavbHH/7mM1DdA0mdd7xiuOPcIld
	YQN2m5z+OhKJgFC5sd8++EBytVWl7ANx/vNJHmjY
X-Google-Smtp-Source: ABdhPJxMV3tMgyliq/Nq7i+1MdGsQiG9PVmkXa91IJJOjIjnkC5OCFpSR+1s6Ks+jhBd8B3xg8jK6elJTPVqMNbZ+O4=
X-Received: by 2002:a17:907:a422:b0:6e0:238c:4f44 with SMTP id
 sg34-20020a170907a42200b006e0238c4f44mr5927362ejc.257.1647936600722; Tue, 22
 Mar 2022 01:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211227091241.103-1-xieyongji@bytedance.com> <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
 <YdMgCS1RMcb5V2RJ@localhost.localdomain> <CACycT3vYt0XNV2GdjKjDS1iyWieY_OV4h=W1qqk_AAAahRZowA@mail.gmail.com>
 <YdSMqKXv0PUkAwfl@localhost.localdomain> <CACycT3tPZOSkCXPz-oYCXRJ_EOBs3dC0+Juv=FYsa6qRS0GVCw@mail.gmail.com>
 <CACycT3tTKBpS_B5vVJ8MZ1iuaF2bf-01=9+tAdxUddziF2DQ-g@mail.gmail.com>
 <CACycT3thVwb466u2JR-oDRHLY5j_uxAx5uXXGmaoCZL5vs__mQ@mail.gmail.com>
 <Yg+5Wytvc2eG8uLD@localhost.localdomain> <CACycT3umMYfwVZRXinEBM=Kh+kQPYH5GBN6eKrt9unZSM8W0qw@mail.gmail.com>
In-Reply-To: <CACycT3umMYfwVZRXinEBM=Kh+kQPYH5GBN6eKrt9unZSM8W0qw@mail.gmail.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 22 Mar 2022 16:10:01 +0800
Message-ID: <CACycT3t7=uXfu62WhahwaZpA15WbL42qB_dicB9kb2DS5-R9Qw@mail.gmail.com>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
To: Josef Bacik <josef@toxicpanda.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <insvJ-R0eVH.A.-fH.SiYOiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1742
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3t7=uXfu62WhahwaZpA15WbL42qB_dicB9kb2DS5-R9Qw@mail.gmail.com
Resent-Date: Tue, 22 Mar 2022 08:28:02 +0000 (UTC)

Ping.

Hi Josef, any other comments for this approach.

On Sat, Feb 19, 2022 at 9:04 PM Yongji Xie <xieyongji@bytedance.com> wrote:
>
> On Fri, Feb 18, 2022 at 11:21 PM Josef Bacik <josef@toxicpanda.com> wrote:
> >
> > On Tue, Feb 15, 2022 at 09:17:37PM +0800, Yongji Xie wrote:
> > > Ping again.
> > >
> > > Hi Josef, could you take a look?
> >
> > Sorry Yongji this got lost.  Again in the reconnect case we're still setting up
> > a long running thread, so it's not like it'll happen during a normal reclaim
> > path thing, it'll be acted upon by userspace.  Thanks,
> >
>
> During creating this long running thread, we might trigger memory
> reclaim since workqueue will use GFP_KERNEL allocation for it. Then a
> deadlock can occur if the memory reclaim happens to hit the page cache
> on this reconnecting nbd device.
>
> Thanks,
> Yongji

