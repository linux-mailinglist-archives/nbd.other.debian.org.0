Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B0434D30
	for <lists+nbd@lfdr.de>; Wed, 20 Oct 2021 16:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 857352037E; Wed, 20 Oct 2021 14:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 20 14:12:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,REMOVEDOT autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 715BE2037D
	for <lists-other-nbd@bendel.debian.org>; Wed, 20 Oct 2021 13:56:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	REMOVEDOT=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qjWT7Z-bWUyV for <lists-other-nbd@bendel.debian.org>;
	Wed, 20 Oct 2021 13:56:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf2a.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B96CD2037B
	for <nbd@other.debian.org>; Wed, 20 Oct 2021 13:56:39 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id k19so2082148qvm.13
        for <nbd@other.debian.org>; Wed, 20 Oct 2021 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SOhTeqssi38uRwcp6bVWgkiT3zeBEjmbv5sIUX3YlqU=;
        b=hoUyPC59lX3NJhAvLcW+xrOuF/F3LgSCM2KPXyjTOAbnllVZLjCw+iYBU2Np+xrhtP
         LrM9cOJ7WfDmqHWcOOhTEGmqtJ2TtNxMQL5oiuyNhkNaefBRPJha8jntBeiQeTEGMuFH
         4gtRwUy7ER5zFEWcz1qbLuM12NcErMCteETSTR8YPfrv0Zc7rfQQbkyViiuP81s+bZm0
         Hy0fI2IekAaZo2aCZC/SKQH6vwUwmyl0LHXNgz6CxODahnEcSvAqlr+uf4rMfxyTnx39
         CZAo9OmetYEiLnWRyWPCDqbh54dg39dj9mNZ8kOcmXBwIzEHoVDmsWTQvFDkr43/nj7D
         x1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SOhTeqssi38uRwcp6bVWgkiT3zeBEjmbv5sIUX3YlqU=;
        b=oswsFjqgjnpwUDKvlxSE/Q9t1Cdj0tA9qpFvLI/CjNx31RYpvu9awH1d4aHd+tRRpU
         t9QjoS/MTPaswEqUgPXtSTvrkp6IP9NgVqofo190kY+F3icfWaJus8UbTxa14PWvdkB/
         TDjZ3CuKYnIQSSgX0i9qZ0aVW6P3glLDfzBOlZWvXPDpbX8vN7E8z7VN+loKFJY7bTP1
         k6xXeZup6zYPq8xRrZ696+cq3/s7WMvP7gzmP+Vtu6FVPjUFOPT+R5iiQtawaMb36GlO
         5tbBQw4n5NsJswk8WrSt92ey2vSTunPDkDjqJvandwddOlLrKS/JJkQDPlE4eVnF2PC8
         MsNA==
X-Gm-Message-State: AOAM532p5g7HkGRKjc6o2iDuXzXcAnzV8tSQ8kgWPmPc0G0OR1VqDcgW
	5cbEN8CXocasdmcym9HgBRi4Hw==
X-Google-Smtp-Source: ABdhPJxYhvejPIL1k6+jDvOj701OJVq1RlboIHsw8i0VCcEri6yz2aLYS3hFQP14xY7XetaBBzM2ZQ==
X-Received: by 2002:a05:6214:e41:: with SMTP id o1mr6391933qvc.0.1634738196355;
        Wed, 20 Oct 2021 06:56:36 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id i67sm1007555qkd.90.2021.10.20.06.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 06:56:36 -0700 (PDT)
Date: Wed, 20 Oct 2021 09:56:35 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Ye Bin <yebin10@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] nbd: Fix use-after-free in pid_show
Message-ID: <YXAgEyCjtQYkZA4A@localhost.localdomain>
References: <20211020073959.2679255-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020073959.2679255-1-yebin10@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <w16JAKsIlfM.A.8nB.5OCchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1545
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YXAgEyCjtQYkZA4A@localhost.localdomain
Resent-Date: Wed, 20 Oct 2021 14:12:09 +0000 (UTC)

On Wed, Oct 20, 2021 at 03:39:59PM +0800, Ye Bin wrote:
> I got issue as follows:
> [  263.886511] BUG: KASAN: use-after-free in pid_show+0x11f/0x13f
> [  263.888359] Read of size 4 at addr ffff8880bf0648c0 by task cat/746
> [  263.890479] CPU: 0 PID: 746 Comm: cat Not tainted 4.19.90-dirty #140
> [  263.893162] Call Trace:
> [  263.893509]  dump_stack+0x108/0x15f
> [  263.893999]  print_address_description+0xa5/0x372
> [  263.894641]  kasan_report.cold+0x236/0x2a8
> [  263.895696]  __asan_report_load4_noabort+0x25/0x30
> [  263.896365]  pid_show+0x11f/0x13f
> [  263.897422]  dev_attr_show+0x48/0x90
> [  263.898361]  sysfs_kf_seq_show+0x24d/0x4b0
> [  263.899479]  kernfs_seq_show+0x14e/0x1b0
> [  263.900029]  seq_read+0x43f/0x1150
> [  263.900499]  kernfs_fop_read+0xc7/0x5a0
> [  263.903764]  vfs_read+0x113/0x350
> [  263.904231]  ksys_read+0x103/0x270
> [  263.905230]  __x64_sys_read+0x77/0xc0
> [  263.906284]  do_syscall_64+0x106/0x360
> [  263.906797]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Reproduce this issue as follows:
> 1. nbd-server 8000 /tmp/disk
> 2. nbd-client localhost 8000 /dev/nbd1
> 3. cat /sys/block/nbd1/pid
> Then trigger use-after-free in pid_show.
> 
> Reason is after do step '2', nbd-client progress is already exit. So
> it's task_struct already freed.
> To solve this issue, revert part of 6521d39a64b3's modify and remove
> useless 'recv_task' member of nbd_device.
> 
> Fixes: 6521d39a64b3 ("nbd: Remove variable 'pid'")
> Signed-off-by: Ye Bin <yebin10@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

