Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BE434D5A
	for <lists+nbd@lfdr.de>; Wed, 20 Oct 2021 16:21:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0BE9A20384; Wed, 20 Oct 2021 14:21:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 20 14:21:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D8A8A2037E
	for <lists-other-nbd@bendel.debian.org>; Wed, 20 Oct 2021 14:04:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.86 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JwiA3flMwZpS for <lists-other-nbd@bendel.debian.org>;
	Wed, 20 Oct 2021 14:04:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x835.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 33D9A2037A
	for <nbd@other.debian.org>; Wed, 20 Oct 2021 14:04:35 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id t16so3084403qto.5
        for <nbd@other.debian.org>; Wed, 20 Oct 2021 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SZMJhhiQz+NRZi0eMiHg38L7kd1NzgPBA278SGVX3+Y=;
        b=yxguSYDfLQQ3SS9aPBzrUZ1lDm2byWO0nzzc7os3i1rPHBdvzWJz7wsjfGRK330n2x
         Eb/LNUOpk6DiMm+SzyrJ0HhiiINR4Lfk71lj1vDeoqKM+dblTHY4dBbjdzt9zBfdMIAy
         bdUPC3ssXAZPW3yqg8KsOy/XMfMR+qdblUrOfcvRJY4sgO4muAoFDe4Xnw82CiA2wX0y
         +oyiwVw/lTL6i0MTr5vY5FJaryPjx/BXcFIJYJl9rdAR7FtA2X6nS1sdiikghULu3Izr
         7942mb1vGYgGa5+P8hLtQJmRD2PHUrw7tn8VKfhUBBxdyFR0ankIAw2P30RJrHAfc7jQ
         c2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SZMJhhiQz+NRZi0eMiHg38L7kd1NzgPBA278SGVX3+Y=;
        b=kkQiYCPV2E/SZq9YzB+xe/jaBzdnL/NJcC2Cybu1SG2ukdL1US737c0EWoYkIXyFim
         g4U9pSdhwJdfHRnNboUkRqc/nFRJvp+Cm1QyBBLQWQTzHFd9bp1fx8s90ZYI3uqeVWZi
         knqZDb7l06BHlLgtT9BWFf4jvsh4DHP7YGJFSx52GiM9pNPWTab1xyynxMuzZjxNOk00
         bvtLFoaqalGliXPs1Rb8LgtdnXshih7S+StJ/GBdMWJR+IjhqaiVCUoM8zabyZt3/ns0
         BUZzJPglOgQAsc6aaq9xAhhqxkmJczQ+e4isp2a3fG6y1Wh8PpmlbV4WSQFL2FYTo81X
         l4mg==
X-Gm-Message-State: AOAM532jJuU9Jt0Pt/Usw51jtH8bxePmaZXXb+EMz3sWEq+m2Kzt+RoS
	4LVF6ZNxGTPsaRL8Sata0sYQww==
X-Google-Smtp-Source: ABdhPJy8OAJs2POuzgUUGc0Wlz/bkXOf2bkiD8VYzIf6XOR2Bx7TzbYlJJOdOVJ1xujfEop1aLP+7A==
X-Received: by 2002:ac8:5990:: with SMTP id e16mr145206qte.38.1634738672032;
        Wed, 20 Oct 2021 07:04:32 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id c26sm993404qtm.21.2021.10.20.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 07:04:31 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:04:30 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Ye Bin <yebin10@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] nbd: Fix hungtask when nbd_config_put
Message-ID: <YXAh7tWFbpukMi6+@localhost.localdomain>
References: <20211020094830.3056325-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020094830.3056325-1-yebin10@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kn2iWKe0OzD.A.lVC.VXCchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1546
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YXAh7tWFbpukMi6+@localhost.localdomain
Resent-Date: Wed, 20 Oct 2021 14:21:10 +0000 (UTC)

On Wed, Oct 20, 2021 at 05:48:30PM +0800, Ye Bin wrote:
> I got follow issue:
> [  247.381177] INFO: task kworker/u10:0:47 blocked for more than 120 seconds.
> [  247.382644]       Not tainted 4.19.90-dirty #140
> [  247.383502] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  247.385027] Call Trace:
> [  247.388384]  schedule+0xb8/0x3c0
> [  247.388966]  schedule_timeout+0x2b4/0x380
> [  247.392815]  wait_for_completion+0x367/0x510
> [  247.397713]  flush_workqueue+0x32b/0x1340
> [  247.402700]  drain_workqueue+0xda/0x3c0
> [  247.403442]  destroy_workqueue+0x7b/0x690
> [  247.405014]  nbd_config_put.cold+0x2f9/0x5b6
> [  247.405823]  recv_work+0x1fd/0x2b0
> [  247.406485]  process_one_work+0x70b/0x1610
> [  247.407262]  worker_thread+0x5a9/0x1060
> [  247.408699]  kthread+0x35e/0x430
> [  247.410918]  ret_from_fork+0x1f/0x30
> 
> We can reprodeuce issue as follows:
> 1. Inject memory fault in nbd_start_device
> @@ -1244,10 +1248,18 @@ static int nbd_start_device(struct nbd_device *nbd)
>         nbd_dev_dbg_init(nbd);
>         for (i = 0; i < num_connections; i++) {
>                 struct recv_thread_args *args;
> -
> -               args = kzalloc(sizeof(*args), GFP_KERNEL);
> +
> +               if (i == 1) {
> +                       args = NULL;
> +                       printk("%s: inject malloc error\n", __func__);
> +               }
> +               else
> +                       args = kzalloc(sizeof(*args), GFP_KERNEL);
> 2. Inject delay in recv_work
> @@ -757,6 +760,8 @@ static void recv_work(struct work_struct *work)
> 
>                 blk_mq_complete_request(blk_mq_rq_from_pdu(cmd));
>         }
> +       printk("%s: comm=%s pid=%d\n", __func__, current->comm, current->pid);
> +       mdelay(5 * 1000);
>         nbd_config_put(nbd);
>         atomic_dec(&config->recv_threads);
>         wake_up(&config->recv_wq);
> 3. Create nbd server
> nbd-server 8000 /tmp/disk
> 4. Create nbd client
> nbd-client localhost 8000 /dev/nbd1
> Then will trigger above issue.
> 
> Reason is when add delay in recv_work, lead to relase the last reference
> of 'nbd->config_refs'. nbd_config_put will call flush_workqueue to make
> all work finish. Obviously, it will lead to deadloop.
> To solve this issue, we must ensure 'recv_work' all exit before release
> the last 'nbd->config_refs' reference count.
> 
> Signed-off-by: Ye Bin <yebin10@huawei.com>

This isn't the way to fix this.  The crux of the problem is the fact that we
destroy the recv_workq at config time anyway, since it is tied to the nbd
device.

Fix this instead by getting rid of that, and have the nbd device teardown the
recv_workq when we destory the nbd device.  Alloc it on device allocation and
stop alloc'ing it with the config.  That way we don't have this weird thing
where we need recv threads to drop their config before the last thing.

And while you're at it would you fix recv_work() so it doesn't modify config
after it drops it's reference?  Thanks,

Josef

