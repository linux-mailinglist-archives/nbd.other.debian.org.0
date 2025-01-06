Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8CA023C9
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:03:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C6F6E20668; Mon,  6 Jan 2025 11:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:03:09 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 480E8206EC
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 10:47:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.738 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mZh4ONBCzUNR for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 10:47:08 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 436 seconds by postgrey-1.36 at bendel; Mon, 06 Jan 2025 10:47:08 UTC
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C7E1D20669
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 10:47:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DEA38A41477;
	Mon,  6 Jan 2025 10:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D402C4CEDD;
	Mon,  6 Jan 2025 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736160425;
	bh=wej234ibZ1R8OLTpkTc9rxS5V8U0eLOGtXxAG8f0G9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QtMzyfuDr2WNgnvsHFz2I+5Ou4y6rqsWJjZ/PHVKqnL013v7PDKnnIUaTpUxxBneH
	 bb6oZLKYhNfPUaCgUIofZ+nJZAKLILSD41nmIXtic/DvtGzLHz5cIBWRcYtKermD8J
	 ZzjiokHMuU2Q7TTVFQmG9aOuuzCC5Vp8ePniWkR3PwEpBHGNPZi+r48oP0x7LOQAxK
	 2S4KCGRdrNmKdImmai72QHvLxq+PQah2S8cMd4tXmZWJ72b0Sgq3yR1wj4EB8Vf32P
	 Bo+ibYFAdtZVy7+36citiVsHaS1FduSGAwv+aZk06ZWiyGRuvIdEE9tExdorHxco5s
	 qEUq74Bc6OqpQ==
Message-ID: <a461bbbc-f251-4f44-89c7-f80f72e6e96d@kernel.org>
Date: Mon, 6 Jan 2025 19:46:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] block: add a store_limit operations for sysfs
 entries
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, virtualization@lists.linux.dev,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-4-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250106100645.850445-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IloJZkc_HjP.A.w-TG.th7enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3218
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a461bbbc-f251-4f44-89c7-f80f72e6e96d@kernel.org
Resent-Date: Mon,  6 Jan 2025 11:03:09 +0000 (UTC)

On 1/6/25 7:06 PM, Christoph Hellwig wrote:
> De-duplicate the code for updating queue limits by adding a store_limit
> method that allows having common code handle the actual queue limits
> update.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

[...]

> @@ -706,11 +687,24 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
>  	if (entry->load_module)
>  		entry->load_module(disk, page, length);
>  
> -	blk_mq_freeze_queue(q);
>  	mutex_lock(&q->sysfs_lock);
> -	res = entry->store(disk, page, length);
> -	mutex_unlock(&q->sysfs_lock);
> +	blk_mq_freeze_queue(q);

The freeze must NOT be done for the "if (entry->store_limit)" case. So this
needs to go int the "else". Otherwise, you still have freeze the take limit
lock order which can cause the ABBA deadlocks in SCSI sd.

> +	if (entry->store_limit) {
> +		struct queue_limits lim = queue_limits_start_update(q);
> +
> +		res = entry->store_limit(disk, page, length, &lim);
> +		if (res < 0) {
> +			queue_limits_cancel_update(q);
> +		} else {
> +			res = queue_limits_commit_update(q, &lim);

Here you must use queue_limits_commit_update_frozen().

> +			if (!res)
> +				res = length;
> +		}
> +	} else {
> +		res = entry->store(disk, page, length);
> +	}
>  	blk_mq_unfreeze_queue(q);

And this one needs to go in the else after the call to entry->store().

> +	mutex_unlock(&q->sysfs_lock);
>  	return res;
>  }
>  


-- 
Damien Le Moal
Western Digital Research

