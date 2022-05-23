Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C74D2531154
	for <lists+nbd@lfdr.de>; Mon, 23 May 2022 16:30:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9E68420181; Mon, 23 May 2022 14:30:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 23 14:30:21 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0311920166
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 May 2022 14:14:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9bazuV8DJh_3 for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 May 2022 14:13:55 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x82b.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 88F3C20170
	for <nbd@other.debian.org>; Mon, 23 May 2022 14:13:55 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id g3so12595136qtb.7
        for <nbd@other.debian.org>; Mon, 23 May 2022 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yf9uUkztNFWKQdMQR+4lfqgGYIJguwpRJROMjgydeec=;
        b=ejzZTp14I0eM1Xcu7f55+JlhI+5GSacYBedYUGQQ3LUYcO7XT4j/NyJA5eQ+FODvPg
         iLrp2yq7P41YzKGBcPKkQ1yVtFLmR2JcZlImu5cKytZMyAsN4fVx1c/ZlcLGGne8Ucet
         hKqmJKMrmOYq0kJl4akBKYxeZ9L5YIZTa/I6hRxNwCqXLuB5QBrOkMVqr4apq8bSveqr
         eHK7+9Y6W7Kys7/dJb6WAobSnenSkLUU6bcjCqnPsz8QpQehRwv05SHSlqO6mbutH5+J
         XyXPqTiUADmQ+MAT7eWyig78b+pXHwe3sqYs8hK+VrZTjPDgTc9nbesjcpN7b2j2deYD
         fHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yf9uUkztNFWKQdMQR+4lfqgGYIJguwpRJROMjgydeec=;
        b=M5JlcRaz9P7qu+QoKorGK9OpjOFCIa4QHmX6DOrbVWYQir/2qhO+X86DO/iPBja9xc
         DlkajK4yipcKKdf8ESHdGduSEQwP7CdIxl+6nr8QGZR+EbsLTRoBan0m2CdIGXmvo41O
         6tC0hezDs715CLox9vDh1cR5O0CCbLPIFaUgCDZ8SBJdZFhmIZIlWtMmSgvSc/DuRgo5
         AbniCydJdxbPtzM6EeugTMG0KpP7+cGI5eQzorDcAioKwPU+ajBYfxAsUvJ2zx5O0JT7
         IXn8AclgQZj+Kl9zKS6ByYV5HBnbxomqHS4WDldmixk6hGpsp3EJC189MqkFIQudamzB
         VcNw==
X-Gm-Message-State: AOAM531Q/5Y9iwoDH6cmaFmnlqT14C09nP3ldk3KjnrhPpZKZugxZs2f
	Kgo4dfx/gTefjiQUGP8hiaTcsg==
X-Google-Smtp-Source: ABdhPJyiT1kMTbQR+T6y2KceS2oNAISZeyIeujBa8g4AUiYDvZeIcUWg78NR8+d9Gb9IEA18FV3eOQ==
X-Received: by 2002:a05:622a:38d:b0:2f3:c9f7:bfa0 with SMTP id j13-20020a05622a038d00b002f3c9f7bfa0mr16634672qtx.404.1653315231961;
        Mon, 23 May 2022 07:13:51 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id c10-20020ac86e8a000000b002f3ef928fbbsm1132615qtv.72.2022.05.23.07.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:13:51 -0700 (PDT)
Date: Mon, 23 May 2022 10:13:50 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, ming.lei@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH -next v3 1/6] nbd: call genl_unregister_family() first in
 nbd_cleanup()
Message-ID: <YouWnpZxnGBiXq6X@localhost.localdomain>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
 <20220521073749.3146892-2-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521073749.3146892-2-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AksQYJZ45II.A.q8B.9p5iiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2094
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YouWnpZxnGBiXq6X@localhost.localdomain
Resent-Date: Mon, 23 May 2022 14:30:21 +0000 (UTC)

On Sat, May 21, 2022 at 03:37:44PM +0800, Yu Kuai wrote:
> Otherwise there may be race between module removal and the handling of
> netlink command, which can lead to the oops as shown below:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000098
>   Oops: 0002 [#1] SMP PTI
>   CPU: 1 PID: 31299 Comm: nbd-client Tainted: G            E     5.14.0-rc4
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>   RIP: 0010:down_write+0x1a/0x50
>   Call Trace:
>    start_creating+0x89/0x130
>    debugfs_create_dir+0x1b/0x130
>    nbd_start_device+0x13d/0x390 [nbd]
>    nbd_genl_connect+0x42f/0x748 [nbd]
>    genl_family_rcv_msg_doit.isra.0+0xec/0x150
>    genl_rcv_msg+0xe5/0x1e0
>    netlink_rcv_skb+0x55/0x100
>    genl_rcv+0x29/0x40
>    netlink_unicast+0x1a8/0x250
>    netlink_sendmsg+0x21b/0x430
>    ____sys_sendmsg+0x2a4/0x2d0
>    ___sys_sendmsg+0x81/0xc0
>    __sys_sendmsg+0x62/0xb0
>    __x64_sys_sendmsg+0x1f/0x30
>    do_syscall_64+0x3b/0xc0
>    entry_SYSCALL_64_after_hwframe+0x44/0xae
>   Modules linked in: nbd(E-)
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

