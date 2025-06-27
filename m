Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE1AEB6DB
	for <lists+nbd@lfdr.de>; Fri, 27 Jun 2025 13:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2AF96205CA; Fri, 27 Jun 2025 11:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 27 11:51:10 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0C6B62055F
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Jun 2025 11:35:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.083 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-2.907,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qmh5jTX4XFzl for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Jun 2025 11:35:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 285F420566
	for <nbd@other.debian.org>; Fri, 27 Jun 2025 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751024101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gpNlNCAbYqrGZEBTx3NoAjbHoc60DnHuxuxn14zXNOc=;
	b=Ls8Zk/fCzTrON/bZzATZjQ+ObJHK7Wm0zcB0wCMXeUQ05bTUjShzaYZVfoD5HvMuxCjOgX
	hDME/0xT1LGPpkqu65jnOSU2SnbQfWOQFN1Mo9G05gVAopiJEVnyg7edXXc6+1BCmlrhSP
	BHKuOa92AP5sHRx36MkuWp6nppBpDJk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-NRJ_f5qoOhOeG1mpRRY4XA-1; Fri,
 27 Jun 2025 07:04:24 -0400
X-MC-Unique: NRJ_f5qoOhOeG1mpRRY4XA-1
X-Mimecast-MFC-AGG-ID: NRJ_f5qoOhOeG1mpRRY4XA_1751022263
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0DD618DA5C0;
	Fri, 27 Jun 2025 11:04:21 +0000 (UTC)
Received: from fedora (unknown [10.72.116.105])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 683E830001BC;
	Fri, 27 Jun 2025 11:04:10 +0000 (UTC)
Date: Fri, 27 Jun 2025 19:04:01 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
	nilay@linux.ibm.com, hare@suse.de, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com,
	johnny.chenyi@huawei.com
Subject: Re: [PATCH] nbd: fix false lockdep deadlock warning
Message-ID: <aF56oVEzTygIOUTN@fedora>
References: <20250627092348.1527323-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627092348.1527323-1-yukuai1@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <svXtApA6bQI.A.NQ9D.uWoXoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3395
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aF56oVEzTygIOUTN@fedora
Resent-Date: Fri, 27 Jun 2025 11:51:10 +0000 (UTC)

On Fri, Jun 27, 2025 at 05:23:48PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> The deadlock is reported because there are circular dependency:
> 
> t1: disk->open_mutex -> nbd->config_lock
> 
>  blkdev_release
>   bdev_release
>    //lock disk->open_mutex)
>    blkdev_put_whole
>     nbd_release
>      nbd_config_put
>         refcount_dec_and_mutex_lock
>         //lock nbd->config_lock
> 
> t2: nbd->config_lock -> set->update_nr_hwq_lock
> 
>  nbd_genl_connect
>   //lock nbd->config_lock
>   nbd_start_device
>    blk_mq_update_nr_hw_queues
>    //lock set->update_nr_hwq_lock
> 
> t3: set->update_nr_hwq_lock -> disk->open_mutex
> 
>  nbd_dev_remove_work
>   nbd_dev_remove
>    del_gendisk
>     down_read(&set->update_nr_hwq_lock);
>     __del_gendisk
>     mutex_lock(&disk->open_mutex);
> 
> This is false warning because t1 and t2 should be synchronized by
> nbd->refs, and t1 is still holding the reference while t2 is triggered
> when the reference is decreased to 0. However the lock order is broken.
> 
> Fix the problem by breaking the dependency from t2, by calling
> blk_mq_update_nr_hw_queues() outside of nbd internal config_lock, since
> now other context can concurrent with nbd_start_device(), also make sure
> they will still return -EBUSY, the difference is that they will not wait
> for nbd_start_device() to be done.
> 
> Fixes: 98e68f67020c ("block: prevent adding/deleting disk during updating nr_hw_queues")
> Reported-by: syzbot+2bcecf3c38cb3e8fdc8d@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6855034f.a00a0220.137b3.0031.GAE@google.com/
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/block/nbd.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 7bdc7eb808ea..d43e8e73aeb3 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1457,10 +1457,13 @@ static void nbd_config_put(struct nbd_device *nbd)
>  	}
>  }
>  
> -static int nbd_start_device(struct nbd_device *nbd)
> +static int nbd_start_device(struct nbd_device *nbd, bool netlink)
> +	__releases(&nbd->config_lock)
> +	__acquires(&nbd->config_lock)
>  {
>  	struct nbd_config *config = nbd->config;
>  	int num_connections = config->num_connections;
> +	struct task_struct *old;
>  	int error = 0, i;
>  
>  	if (nbd->pid)
> @@ -1473,8 +1476,21 @@ static int nbd_start_device(struct nbd_device *nbd)
>  		return -EINVAL;
>  	}
>  
> -	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
> +	/*
> +	 * synchronize with concurrent nbd_start_device() and
> +	 * nbd_add_socket()
> +	 */
>  	nbd->pid = task_pid_nr(current);
> +	if (!netlink) {
> +		old = nbd->task_setup;
> +		nbd->task_setup = current;
> +	}
> +
> +	mutex_unlock(&nbd->config_lock);
> +	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
> +	mutex_lock(&nbd->config_lock);
> +	if (!netlink)
> +		nbd->task_setup = old;

I guess the patch in the following link may be simper, both two take
similar approach:

https://lore.kernel.org/linux-block/aFjbavzLAFO0Q7n1@fedora/


thanks,
Ming

