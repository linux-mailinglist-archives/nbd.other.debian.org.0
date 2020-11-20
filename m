Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 138BA2BA36B
	for <lists+nbd@lfdr.de>; Fri, 20 Nov 2020 08:36:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E124E20CEF; Fri, 20 Nov 2020 07:36:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 20 07:36:31 2020
Old-Return-Path: <hare@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	FOURLA,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 70AEA20CD6
	for <lists-other-nbd@bendel.debian.org>; Fri, 20 Nov 2020 07:20:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DZ0H5Dx__isM for <lists-other-nbd@bendel.debian.org>;
	Fri, 20 Nov 2020 07:20:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp2.suse.de", Issuer "Let's Encrypt Authority X3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BABE720CD1
	for <nbd@other.debian.org>; Fri, 20 Nov 2020 07:20:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7376AAC23;
	Fri, 20 Nov 2020 07:20:23 +0000 (UTC)
Subject: Re: [PATCH 31/78] loop: use set_disk_ro
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201116145809.410558-1-hch@lst.de>
 <20201116145809.410558-32-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <62c828df-02be-1848-0a95-9b937f9998da@suse.de>
Date: Fri, 20 Nov 2020 08:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-32-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hK0ie2E9_uG.A.YPE._H3tfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1073
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/62c828df-02be-1848-0a95-9b937f9998da@suse.de
Resent-Date: Fri, 20 Nov 2020 07:36:31 +0000 (UTC)

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> Use set_disk_ro instead of set_device_ro to match all other block
> drivers and to ensure all partitions mirror the read-only flag.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/block/loop.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 84a36c242e5550..41caf799df721f 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1134,7 +1134,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
>   	if (error)
>   		goto out_unlock;
>   
> -	set_device_ro(bdev, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
> +	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
>   
>   	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
>   	lo->lo_device = bdev;
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

