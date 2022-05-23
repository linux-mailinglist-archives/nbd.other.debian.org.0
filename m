Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900E531155
	for <lists+nbd@lfdr.de>; Mon, 23 May 2022 16:30:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E2B6120181; Mon, 23 May 2022 14:30:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 23 14:30:32 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C308920178
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 May 2022 14:15:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id U7c55vynA5IL for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 May 2022 14:15:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf34.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 58E5120170
	for <nbd@other.debian.org>; Mon, 23 May 2022 14:15:04 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id c9so11497246qvx.8
        for <nbd@other.debian.org>; Mon, 23 May 2022 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gQqSOYtXKCovkcmnzORDeqKEFCpsqidTzONhfpIe2p8=;
        b=vKzkSS4bG/EMe1SPtyOi4LEBAkEGV2enoBPonfxF5+4AHmjNpTtXnkLCtnsq1Xvv4E
         GRj2+N6KpPbAADnV+7fmpgdvsnDrtiFG0VHZHXYc2wmTv1OuSsorJB5WEHpKzoWjwPDK
         k/2mK+W3ZAz/FFJH8JVyAWRpGymYz/1QpgK3gN37JahC01zUcT9mw6ih78Q7mJIjgk2b
         e0tuPxiCmo1HZalzLh1IKi7nXy/VvodzIaVloi9hV6P6z3MRtbx1R22n2ErtrQX02rrJ
         ynewHtDppmBXIgCvptEaLRNoiTYOfmguW5gh1HSDcIVTXzQV9sckJFu8Ss0fIISRK2nE
         iwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gQqSOYtXKCovkcmnzORDeqKEFCpsqidTzONhfpIe2p8=;
        b=RgHxhCPi9TH7N3MadshCbLN5ZkEY6fzd84VEerdgPcXpJi44B926xkD7IPfRQg77PH
         WtOsBBxGfvy8gvOjrGx/IX1/SZLJ8KVl3kHU7/F3kGSFclQPD4Yokc4XiVf2zQZGMJRU
         DRrDgKISBqyJUiFIUCEyvW7ZdsJ9C9zy+OXLqyQqgvh7J77kRiKwhB477sLd9nA6GQs9
         kVfJ/KWEMt3DSQdJsDMsFSGy6TG7If5sUsE1ZCLiDpYRGN9H3RjCMny+7LyhYqACQ5YQ
         DDXS9VmfMEfBzsERnIhaEdgDCHnAAtxaCZlxSlXpiSUuS5uBEon2vzw51iDSc+DpKOrD
         wY8g==
X-Gm-Message-State: AOAM530gJwQzxsDk4kd5vBgx51VFp0rQ+2BGjCygAqYaZuOl75cu+WD0
	CFo3HSEYBuZgbxzPF0iRAzGsIQ==
X-Google-Smtp-Source: ABdhPJwQ9+RAgP4Mkgg0O5FGiPJWPkwcW/SbB9MFOMsl2KVNW+Wyah4aI6YwsGVPAxrC4/jG/5Kaig==
X-Received: by 2002:a0c:e7c7:0:b0:461:e559:18d0 with SMTP id c7-20020a0ce7c7000000b00461e55918d0mr17285270qvo.2.1653315300574;
        Mon, 23 May 2022 07:15:00 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id k17-20020a05620a139100b006a367e8d954sm4096141qki.118.2022.05.23.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:15:00 -0700 (PDT)
Date: Mon, 23 May 2022 10:14:59 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, ming.lei@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH -next v3 2/6] nbd: fix race between nbd_alloc_config()
 and module removal
Message-ID: <YouW4zDFENSvO5Kv@localhost.localdomain>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
 <20220521073749.3146892-3-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521073749.3146892-3-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VWQ4yTq_j9B.A.XAC.Iq5iiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2095
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YouW4zDFENSvO5Kv@localhost.localdomain
Resent-Date: Mon, 23 May 2022 14:30:32 +0000 (UTC)

On Sat, May 21, 2022 at 03:37:45PM +0800, Yu Kuai wrote:
> When nbd module is being removing, nbd_alloc_config() may be
> called concurrently by nbd_genl_connect(), although try_module_get()
> will return false, but nbd_alloc_config() doesn't handle it.
> 
> The race may lead to the leak of nbd_config and its related
> resources (e.g, recv_workq) and oops in nbd_read_stat() due
> to the unload of nbd module as shown below:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000040
>   Oops: 0000 [#1] SMP PTI
>   CPU: 5 PID: 13840 Comm: kworker/u17:33 Not tainted 5.14.0+ #1
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>   Workqueue: knbd16-recv recv_work [nbd]
>   RIP: 0010:nbd_read_stat.cold+0x130/0x1a4 [nbd]
>   Call Trace:
>    recv_work+0x3b/0xb0 [nbd]
>    process_one_work+0x1ed/0x390
>    worker_thread+0x4a/0x3d0
>    kthread+0x12a/0x150
>    ret_from_fork+0x22/0x30
> 
> Fixing it by checking the return value of try_module_get()
> in nbd_alloc_config(). As nbd_alloc_config() may return ERR_PTR(-ENODEV),
> assign nbd->config only when nbd_alloc_config() succeeds to ensure
> the value of nbd->config is binary (valid or NULL).
> 
> Also adding a debug message to check the reference counter
> of nbd_config during module removal.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

