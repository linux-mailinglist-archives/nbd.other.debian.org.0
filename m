Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7843FEBD
	for <lists+nbd@lfdr.de>; Fri, 29 Oct 2021 16:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 58FD62029D; Fri, 29 Oct 2021 14:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 29 14:54:10 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9E1EA202A1
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 Oct 2021 14:38:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.64 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9ZvdH_G2Y0HD for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 Oct 2021 14:38:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x82b.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9F5E22029D
	for <nbd@other.debian.org>; Fri, 29 Oct 2021 14:38:28 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id v29so7916475qtc.10
        for <nbd@other.debian.org>; Fri, 29 Oct 2021 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FjdraEHcUKO50MDnAo25BSOWI5FEJ1ZaYZ590cMzyAs=;
        b=S7vuW4s1rbWE0JASTqugT0IKIeXWTgxtS3+n51gJOEg5dflocWvOsnen2qrhGW83Za
         HsbwerJHgrJG9ghjOHrn/VsG4LUEQC9Ox4tGl+6zMQQ9dQocj6oryG8FJGsMmFOEgmZ9
         4XIlXKova8G6ehBW5BwKo/CMF5uF7xaV997yCsTLr6+Eb83U+Ux9lyAiP1ghufVMNxr0
         uGO6Tng1D3ai+kfXqI973T0KnkQKN1MsxZWLxCu0VDn4sbeu2e+GNkEu3eM1QD1GJ9V2
         htUNIWLnJMak99sWondvGGQHc4VvVf2Y2lF8gPQtkZ8IhjIiCvZpdQQ3NHGg4uL0h9PQ
         kfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FjdraEHcUKO50MDnAo25BSOWI5FEJ1ZaYZ590cMzyAs=;
        b=OChqTJ/foI92CjhyM/cxP8CYOdgUuQUT6SChVluUOf4LN1dGy5DW2URrTuVMSdb5ul
         eW/2RvTbNhiXVyGRxb2g/8TbXwzsbYiM+Ewj0nQ7pbK1c0cWl9axAIq+QcRypUkwOn2S
         MTLqBbMR484LTjQFFRhT0yqrwVP55p9i0LLlU8BZmKzZ6a5Yxtch8Be2jVEc4VIAwEUQ
         nOXDc9ol8G76nPTufRj5a9wk7itNzdGZnlNWbm6QPiEYOx7k3pFvtB19KKW27Dnnmlj5
         ivQrhUaX3ZRbGTm4Ss6tH1yF/ezFHP51h7R1AT8aKnOGnqkAYEl1+g6RUSgs32CybA/p
         DPxA==
X-Gm-Message-State: AOAM530L7aK4pyU09OuoA/Pkorq80qOP1BQfFGWfy2JvFClOJ+UUT9TR
	z46P+kFzFnJbZuKUqiiNE9Ggbg==
X-Google-Smtp-Source: ABdhPJwZavYklqnkY5A7Id+6Y6Pq7XG12cjSbT3K7irZUBFT9CvtQK6YLL5ZtR5UxJHyvQhlp6HeNA==
X-Received: by 2002:ac8:5cc5:: with SMTP id s5mr12212229qta.256.1635518305006;
        Fri, 29 Oct 2021 07:38:25 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id u16sm1434073qkp.116.2021.10.29.07.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 07:38:24 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:38:23 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Ye Bin <yebin10@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v3 2/2] nbd: Fix hungtask when nbd_config_put
Message-ID: <YXwHXxl135ZR5W9p@localhost.localdomain>
References: <20211029094228.1853434-1-yebin10@huawei.com>
 <20211029094228.1853434-3-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029094228.1853434-3-yebin10@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TwliMglOj6N.A.WYH.SsAfhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1591
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YXwHXxl135ZR5W9p@localhost.localdomain
Resent-Date: Fri, 29 Oct 2021 14:54:10 +0000 (UTC)

On Fri, Oct 29, 2021 at 05:42:28PM +0800, Ye Bin wrote:
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

"reproduce"

> 1. Inject memory fault in nbd_start_device
> -1244,10 +1248,18 @@ static int nbd_start_device(struct nbd_device *nbd)
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
> -757,6 +760,8 @@ static void recv_work(struct work_struct *work)
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

"release"

> of 'nbd->config_refs'. nbd_config_put will call flush_workqueue to make
> all work finish. Obviously, it will lead to deadloop.
> To solve this issue, according to Josef's suggestion move 'recv_work'
> init from start device to nbd_dev_add, then destory 'recv_work'when

"destroy"

> nbd device teardown.
> 
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>  drivers/block/nbd.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 096883ab9b76..c9a65a260668 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1314,10 +1314,6 @@ static void nbd_config_put(struct nbd_device *nbd)
>  		kfree(nbd->config);
>  		nbd->config = NULL;
>  
> -		if (nbd->recv_workq)
> -			destroy_workqueue(nbd->recv_workq);
> -		nbd->recv_workq = NULL;
> -
>  		nbd->tag_set.timeout = 0;
>  		nbd->disk->queue->limits.discard_granularity = 0;
>  		nbd->disk->queue->limits.discard_alignment = 0;
> @@ -1346,14 +1342,6 @@ static int nbd_start_device(struct nbd_device *nbd)
>  		return -EINVAL;
>  	}
>  
> -	nbd->recv_workq = alloc_workqueue("knbd%d-recv",
> -					  WQ_MEM_RECLAIM | WQ_HIGHPRI |
> -					  WQ_UNBOUND, 0, nbd->index);
> -	if (!nbd->recv_workq) {
> -		dev_err(disk_to_dev(nbd->disk), "Could not allocate knbd recv work queue.\n");
> -		return -ENOMEM;
> -	}
> -
>  	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
>  	nbd->pid = task_pid_nr(current);
>  
> @@ -1779,6 +1767,15 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  	}
>  	nbd->disk = disk;
>  
> +	nbd->recv_workq = alloc_workqueue("nbd%d-recv",
> +					  WQ_MEM_RECLAIM | WQ_HIGHPRI |
> +					  WQ_UNBOUND, 0, nbd->index);
> +	if (!nbd->recv_workq) {
> +		dev_err(disk_to_dev(nbd->disk), "Could not allocate knbd recv work queue.\n");
> +		err = -ENOMEM;
> +		goto out_err_disk;
> +	}
> +

You never free this up, you need to add a destroy_workqueue(nbd->rsv_workq) to
nbd_dev_remove().

>  	/*
>  	 * Tell the block layer that we are not a rotational device
>  	 */
> @@ -1809,7 +1806,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  	disk->first_minor = index << part_shift;
>  	if (disk->first_minor > 0xff) {
>  		err = -EINVAL;
> -		goto out_err_disk;
> +		goto out_free_work;
>  	}
>  
>  	disk->minors = 1 << part_shift;
> @@ -1818,7 +1815,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  	sprintf(disk->disk_name, "nbd%d", index);
>  	err = add_disk(disk);
>  	if (err)
> -		goto out_err_disk;
> +		goto out_free_work;
>  
>  	/*
>  	 * Now publish the device.
> @@ -1827,6 +1824,8 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  	nbd_total_devices++;
>  	return nbd;
>  
> +out_free_work:
> +	destroy_workqueue(nbd->recv_workq);
>  out_err_disk:
>  	blk_cleanup_disk(disk);
>  out_free_idr:
> @@ -2087,8 +2086,7 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
>  	 * queue. And this also ensure that we can safely call nbd_clear_que()
>  	 * to cancel the inflight I/Os.
>  	 */
> -	if (nbd->recv_workq)
> -		flush_workqueue(nbd->recv_workq);
> +	flush_workqueue(nbd->recv_workq);

The comment above this part needs to be updated, as we no longer have this
problem.  Thanks,

Josef

