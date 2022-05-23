Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA43531156
	for <lists+nbd@lfdr.de>; Mon, 23 May 2022 16:30:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A1B612017D; Mon, 23 May 2022 14:30:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 23 14:30:43 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 65EBD2017B
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 May 2022 14:15:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.87 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RK5Fp2KIcMos for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 May 2022 14:15:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x830.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B1A0920178
	for <nbd@other.debian.org>; Mon, 23 May 2022 14:15:26 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id v14so12622867qtc.3
        for <nbd@other.debian.org>; Mon, 23 May 2022 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UOygwtue8FxveF0e91u7QAGHCJ4HdKKjaPKJK3YP7CE=;
        b=6KPFl+xnqEiXHDjC54rirh79X63AoLYJuJLg6zejRvudAQ5/Z2YxF1fK5Mmu+EzsZ/
         CMWilmVAaHFRfgJZaVXKZ8FyQUza1Z86w0lggRZgNcEgu48Qk+1sh96z71ajhhxqGJ/e
         EQSlG7No6QYA0pm0vnbHdZ8SAo18xdo2B2xeZLRcIRrL/dd2k4izFFx6EwLBEguB8dpQ
         7HSSNuEm315v+4mPnPsor7NE5xZ1x0gHJVFOXoJTEGs47TiLJYyel6CBDoN2OpqiCK6x
         Ba5D0/oE8NyPSb2Wo8Ms+/O1nJYhAd5E0wd6Oz0iFXyM0tT2vT4qxVbWzDr+Xvuw7RL6
         FjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UOygwtue8FxveF0e91u7QAGHCJ4HdKKjaPKJK3YP7CE=;
        b=qUGh8RvMzXeQtRjbI8xE+51kvBUFTFt9G+A5yhbz88mJNOh98uU6y0BH1Nd/aU4mDn
         kwcbud1wYN2czIkP6zoQGAcHewKRCF4b6UAqZ4zgkxiIcu3iGaU0aZ+Mu3KIVFH83M5T
         uin51/JssC4RuxpJ8wJa/X2I3fIVkxxW4psS4RmqoKHIvgJwCCqme0YjEumXB9vX8POB
         fOxPS49cLHojULjILtDdOZNpOHcH+1xzE57tET69zFpc+WX3h0/HO/45lk4K0kHI3dMB
         lW2UQknvsTpXom69Z44Vf9MUIhWjwXU84M5+McTTtdaUabdvCc/pTyX+vyOlHh5oweal
         H6RA==
X-Gm-Message-State: AOAM531rXRcFD1FtaHUBia4qAFyAU+waSwY0aigUZVK8YGeOsMEVAiBY
	JglmOgo7NC0UyTHVTIbTlWAFYQ==
X-Google-Smtp-Source: ABdhPJxjIPOYUwenosYkvPhI4FjM8uVXSr7y3QSr6b2XPYYdq6EirKyDr+yRQOC6zOsGbkMSwuVtJg==
X-Received: by 2002:a05:622a:1108:b0:2f3:d7d1:cf28 with SMTP id e8-20020a05622a110800b002f3d7d1cf28mr16123743qty.481.1653315323198;
        Mon, 23 May 2022 07:15:23 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id v24-20020ae9e318000000b0069fc13ce1d4sm4413119qkf.5.2022.05.23.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:15:22 -0700 (PDT)
Date: Mon, 23 May 2022 10:15:21 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, ming.lei@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH -next v3 4/6] nbd: fix io hung while disconnecting device
Message-ID: <YouW+aI2jiqJtitw@localhost.localdomain>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
 <20220521073749.3146892-5-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521073749.3146892-5-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sh-Q8JYFUgJ.A.kCC.Tq5iiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2096
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YouW+aI2jiqJtitw@localhost.localdomain
Resent-Date: Mon, 23 May 2022 14:30:43 +0000 (UTC)

On Sat, May 21, 2022 at 03:37:47PM +0800, Yu Kuai wrote:
> In our tests, "qemu-nbd" triggers a io hung:
> 
> INFO: task qemu-nbd:11445 blocked for more than 368 seconds.
>       Not tainted 5.18.0-rc3-next-20220422-00003-g2176915513ca #884
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:qemu-nbd        state:D stack:    0 pid:11445 ppid:     1 flags:0x00000000
> Call Trace:
>  <TASK>
>  __schedule+0x480/0x1050
>  ? _raw_spin_lock_irqsave+0x3e/0xb0
>  schedule+0x9c/0x1b0
>  blk_mq_freeze_queue_wait+0x9d/0xf0
>  ? ipi_rseq+0x70/0x70
>  blk_mq_freeze_queue+0x2b/0x40
>  nbd_add_socket+0x6b/0x270 [nbd]
>  nbd_ioctl+0x383/0x510 [nbd]
>  blkdev_ioctl+0x18e/0x3e0
>  __x64_sys_ioctl+0xac/0x120
>  do_syscall_64+0x35/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7fd8ff706577
> RSP: 002b:00007fd8fcdfebf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000040000000 RCX: 00007fd8ff706577
> RDX: 000000000000000d RSI: 000000000000ab00 RDI: 000000000000000f
> RBP: 000000000000000f R08: 000000000000fbe8 R09: 000055fe497c62b0
> R10: 00000002aff20000 R11: 0000000000000246 R12: 000000000000006d
> R13: 0000000000000000 R14: 00007ffe82dc5e70 R15: 00007fd8fcdff9c0
> 
> "qemu-ndb -d" will call ioctl 'NBD_DISCONNECT' first, however, following
> message was found:
> 
> block nbd0: Send disconnect failed -32
> 
> Which indicate that something is wrong with the server. Then,
> "qemu-nbd -d" will call ioctl 'NBD_CLEAR_SOCK', however ioctl can't clear
> requests after commit 2516ab1543fd("nbd: only clear the queue on device
> teardown"). And in the meantime, request can't complete through timeout
> because nbd_xmit_timeout() will always return 'BLK_EH_RESET_TIMER', which
> means such request will never be completed in this situation.
> 
> Now that the flag 'NBD_CMD_INFLIGHT' can make sure requests won't
> complete multiple times, switch back to call nbd_clear_sock() in
> nbd_clear_sock_ioctl(), so that inflight requests can be cleared.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

