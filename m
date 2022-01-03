Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F7B4834BF
	for <lists+nbd@lfdr.de>; Mon,  3 Jan 2022 17:27:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 89429202C2; Mon,  3 Jan 2022 16:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  3 16:27:09 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 493EC202C8
	for <lists-other-nbd@bendel.debian.org>; Mon,  3 Jan 2022 16:11:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LSga1csnuEdD for <lists-other-nbd@bendel.debian.org>;
	Mon,  3 Jan 2022 16:10:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7F0C6201EC
	for <nbd@other.debian.org>; Mon,  3 Jan 2022 16:10:54 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id f138so31678224qke.10
        for <nbd@other.debian.org>; Mon, 03 Jan 2022 08:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D1Q3J6juiePL27oWBkNOxTw2Gj9XV99OOInUYuxJbFA=;
        b=K83wNLSqiOi8vkX/rso4uTib9WyUzG+hZKEYcqDcieuwvx8rSQoSi+KaIrxQ1OzQog
         TDzNbj//gaIPz6hc/czb1VUjZFifljsuefa5lRfEZSS2joeL3jairu9nvrFTo7aLcA8+
         chTKfTi35f+mA3a4VvuMf9g6B9+OXAwwU5B4BKT2GDtkgDlWySSFk97KAhhz5ZaV52YD
         OthaIbhPUP2OpIqopyIvOlDeaGPXNXl73+sYrfKfLQ/TGkBxSKmKr/waFZQAdAX956Hr
         Rxi/QHTYWUp1YAzfrxuuEFUez1Ljxin7TlA6P99aKoLlRTig2ys9lKYRIsgrj3BdCmun
         NmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D1Q3J6juiePL27oWBkNOxTw2Gj9XV99OOInUYuxJbFA=;
        b=RPDzm/ZhVOV1+kXg5bVYgESE0MsnTuYGzglVBXjxY90l5jGpoRyk2SdtMne8IvNQlx
         OnA5ZsVtmmf2k3oZ3+n5MD8pSKbVXqCBXiaBgNaidHiSwB4ncYoxbxmAs1fTINrEbp5o
         QILxUDRQYpEkDCXuRoYQkFAIzL09doZT3sjij3nqFAIzQ5YuJrz8PHvrbHOEKD9tn/4M
         Fek9IKF/i7uYuiRfzBcQEKws+h6p9Hjg4465RerRoRZE1gzEKryDHWfF8xYsM9geYni0
         LTg8Pu4u+0Ajv0EapdN5sMWgZ63FT2ZleF5N7TugqEhQombPJF20YGF4AEBEDT+//iCh
         cXeg==
X-Gm-Message-State: AOAM530P/59p9Zj8qFCzQTOocs3KyVRfmdfm/VaDO14ZcqVKGLVfHalI
	Nez0eL/VeqNG/VeDaE8R/JWZvQ==
X-Google-Smtp-Source: ABdhPJyNV5rHobiq6J8ocNRs9MB2USBw2xmYNfVt1+XhSMp1T2zlbT9BAc0HnGfPjpPYBlHq18KNyg==
X-Received: by 2002:a05:620a:85e:: with SMTP id u30mr32185499qku.765.1641226250755;
        Mon, 03 Jan 2022 08:10:50 -0800 (PST)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id o10sm30540976qtx.33.2022.01.03.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:10:50 -0800 (PST)
Date: Mon, 3 Jan 2022 11:10:49 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] nbd: Don't use workqueue to handle recv work
Message-ID: <YdMgCS1RMcb5V2RJ@localhost.localdomain>
References: <20211227091241.103-1-xieyongji@bytedance.com>
 <Ycycda8w/zHWGw9c@infradead.org>
 <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACycT3usfTdzmK=gOsBf3=-0e8HZ3_0ZiBJqkWb_r7nki7xzYA@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <t6ytLl6toyL.A.pAB.dPy0hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1667
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YdMgCS1RMcb5V2RJ@localhost.localdomain
Resent-Date: Mon,  3 Jan 2022 16:27:09 +0000 (UTC)

On Thu, Dec 30, 2021 at 12:01:23PM +0800, Yongji Xie wrote:
> On Thu, Dec 30, 2021 at 1:35 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Mon, Dec 27, 2021 at 05:12:41PM +0800, Xie Yongji wrote:
> > > The rescuer thread might take over the works queued on
> > > the workqueue when the worker thread creation timed out.
> > > If this happens, we have no chance to create multiple
> > > recv threads which causes I/O hung on this nbd device.
> >
> > If a workqueue is used there aren't really 'receive threads'.
> > What is the deadlock here?
> 
> We might have multiple recv works, and those recv works won't quit
> unless the socket is closed. If the rescuer thread takes over those
> works, only the first recv work can run. The I/O needed to be handled
> in other recv works would be hung since no thread can handle them.
> 

I'm not following this explanation.  What is the rescuer thread you're talking
about?  If there's an error we close the socket which will error out the recvmsg
which will make the recv workqueue close down.

> In that case, we can see below stacks in rescuer thread:
> 
> __schedule
>   schedule
>     scheule_timeout
>       unix_stream_read_generic
>         unix_stream_recvmsg
>           sock_xmit
>             nbd_read_stat
>               recv_work
>                 process_one_work
>                   rescuer_thread
>                     kthread
>                       ret_from_fork

This is just the thing hanging waiting for an incoming request, so this doesn't
tell me anything.  Thanks,

Josef

