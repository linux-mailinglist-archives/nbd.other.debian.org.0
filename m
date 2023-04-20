Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84B6E9CC0
	for <lists+nbd@lfdr.de>; Thu, 20 Apr 2023 21:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 225C920EFB; Thu, 20 Apr 2023 19:57:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 20 19:57:12 2023
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AA71420D8E
	for <lists-other-nbd@bendel.debian.org>; Thu, 20 Apr 2023 19:41:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PktZcM_v8SeP for <lists-other-nbd@bendel.debian.org>;
	Thu, 20 Apr 2023 19:41:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72d.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B595920DA4
	for <nbd@other.debian.org>; Thu, 20 Apr 2023 19:41:21 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-74df47ad36eso55169385a.0
        for <nbd@other.debian.org>; Thu, 20 Apr 2023 12:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20221208.gappssmtp.com; s=20221208; t=1682019678; x=1684611678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hp2WoMYe8f0cA1azbQnh2XYZtbHDV4zsKL0sy4t3HRk=;
        b=cokRKqTe/KXOWR8TgrgKE35GN/QC9l9kuQHbG/6uekngK4te5Ju9kOuReHGCH2JCB7
         ctFyVY/HKqw53zXlDHfduMSnZZPS6ZVJ+FPUmcB/J9IOV83qIRPuCM4gYbngj1kdW5vK
         Runi1pNLAMlkYVXyEeG7lHjgtt7WRvWtTVT6ZBBo05cA+Gnu2hFswC1rfKfnIvLLK/c6
         HhkBTuMrKll6CjPW0vrjT4qOY/1xXEtAIMlLBeuZsJ/agTTbdx1B4sIy5PDCwMctLQS+
         M7WitvFtu6bdQl8U+8ucEGoUD4Js5gRj77jSi7N1+q3jIsg/GVycnTQIx6z8QI/eFmW0
         95nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682019678; x=1684611678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp2WoMYe8f0cA1azbQnh2XYZtbHDV4zsKL0sy4t3HRk=;
        b=ktiPcZdqoWiaNyCMStjtRxtvEUwx23i4QtveGD4pgO+0mSJLHQRRcATA/G0/Aycc1C
         nvpDcVnAg5J37eZhjvp6fEVRK843MlgJMu2X4WVlEz3DGIfkyWj5hXEDuvoQnF5ckOxg
         TIeXIseBgemVySwZkLi5XmA0LWO8BNgG7RwRVYBshEY6Ne+Cj3ieSfTMuIs/ye0csBs9
         XgOoXav83Fbv09DDwxjgatlkmUDY0xJUxBDY2GVH2Gf6H2wq4M2nwtk+UibTZtrvlOjn
         cUi++p6GOxrm28hNSuLFzBx/6r6dfOwFVU+D6y3GlSLmZFdGaKWpdxG/mSG4/kBFfPS1
         OLeQ==
X-Gm-Message-State: AAQBX9feDznI+hvmRHJhfsKq9Yrfgzr4Pe7P1Rc9O66kTYG3Y5XgmEfF
	u/GNcOWdHTrMdepbAI5agjIBMw==
X-Google-Smtp-Source: AKy350YHZGfUCPsTXzxR0dSmjqT1qchvqDRAVjb1f3XBS1FGLghWbLDnz+KIU+WWC8QMjSXcknjIpQ==
X-Received: by 2002:a05:6214:e4e:b0:5ef:4ecb:cf9d with SMTP id o14-20020a0562140e4e00b005ef4ecbcf9dmr4390667qvc.6.1682019678370;
        Thu, 20 Apr 2023 12:41:18 -0700 (PDT)
Received: from localhost (hs-nc-a03feba254-450087-1.tingfiber.com. [64.98.124.17])
        by smtp.gmail.com with ESMTPSA id i10-20020a0cedca000000b005dd8b9345b4sm597931qvr.76.2023.04.20.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 12:41:17 -0700 (PDT)
Date: Thu, 20 Apr 2023 15:41:17 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Zhong Jinghua <zhongjinghua@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com,
	yukuai3@huawei.com, houtao1@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH-next] nbd: fix incomplete validation of ioctl arg
Message-ID: <20230420194117.GA2179876@localhost.localdomain>
References: <20230206145805.2645671-1-zhongjinghua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206145805.2645671-1-zhongjinghua@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <--bwonDhVLG.A.SdC.YkZQkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2441
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230420194117.GA2179876@localhost.localdomain
Resent-Date: Thu, 20 Apr 2023 19:57:13 +0000 (UTC)

On Mon, Feb 06, 2023 at 10:58:05PM +0800, Zhong Jinghua wrote:
> We tested and found an alarm caused by nbd_ioctl arg without verification.
> The UBSAN warning calltrace like below:
> 
> UBSAN: Undefined behaviour in fs/buffer.c:1709:35
> signed integer overflow:
> -9223372036854775808 - 1 cannot be represented in type 'long long int'
> CPU: 3 PID: 2523 Comm: syz-executor.0 Not tainted 4.19.90 #1
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  dump_backtrace+0x0/0x3f0 arch/arm64/kernel/time.c:78
>  show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x170/0x1dc lib/dump_stack.c:118
>  ubsan_epilogue+0x18/0xb4 lib/ubsan.c:161
>  handle_overflow+0x188/0x1dc lib/ubsan.c:192
>  __ubsan_handle_sub_overflow+0x34/0x44 lib/ubsan.c:206
>  __block_write_full_page+0x94c/0xa20 fs/buffer.c:1709
>  block_write_full_page+0x1f0/0x280 fs/buffer.c:2934
>  blkdev_writepage+0x34/0x40 fs/block_dev.c:607
>  __writepage+0x68/0xe8 mm/page-writeback.c:2305
>  write_cache_pages+0x44c/0xc70 mm/page-writeback.c:2240
>  generic_writepages+0xdc/0x148 mm/page-writeback.c:2329
>  blkdev_writepages+0x2c/0x38 fs/block_dev.c:2114
>  do_writepages+0xd4/0x250 mm/page-writeback.c:2344
> 
> The reason for triggering this warning is __block_write_full_page()
> -> i_size_read(inode) - 1 overflow.
> inode->i_size is assigned in __nbd_ioctl() -> nbd_set_size() -> bytesize.
> We think it is necessary to limit the size of arg to prevent errors.
> 
> Moreover, __nbd_ioctl() -> nbd_add_socket(), arg will be cast to int.
> Assuming the value of arg is 0x80000000000000001) (on a 64-bit machine),
> it will become 1 after the coercion, which will return unexpected results.
> 
> Fix it by adding checks to prevent passing in too large numbers.
> 
> Signed-off-by: Zhong Jinghua <zhongjinghua@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

