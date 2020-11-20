Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E672BA40A
	for <lists+nbd@lfdr.de>; Fri, 20 Nov 2020 08:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A512220D16; Fri, 20 Nov 2020 07:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 20 07:57:09 2020
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
	by bendel.debian.org (Postfix) with ESMTP id DF2C720C89
	for <lists-other-nbd@bendel.debian.org>; Fri, 20 Nov 2020 07:41:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mcH4mBZh0oX9 for <lists-other-nbd@bendel.debian.org>;
	Fri, 20 Nov 2020 07:41:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp2.suse.de", Issuer "Let's Encrypt Authority X3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 544BF20CB9
	for <nbd@other.debian.org>; Fri, 20 Nov 2020 07:41:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0C348AC23;
	Fri, 20 Nov 2020 07:41:19 +0000 (UTC)
Subject: Re: [PATCH 64/78] dm: simplify flush_bio initialization in
 __send_empty_flush
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
 <20201116145809.410558-65-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <38ac9782-a563-b7ea-595a-124159fb755d@suse.de>
Date: Fri, 20 Nov 2020 08:41:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-65-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OPhjfHN_h8E.A.GdG.Vb3tfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1087
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/38ac9782-a563-b7ea-595a-124159fb755d@suse.de
Resent-Date: Fri, 20 Nov 2020 07:57:09 +0000 (UTC)

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> We don't really need the struct block_device to initialize a bio.  So
> switch from using bio_set_dev to manually setting up bi_disk (bi_partno
> will always be zero and has been cleared by bio_init already).
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/md/dm.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 54739f1b579bc8..6d7eb72d41f9ea 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1422,18 +1422,12 @@ static int __send_empty_flush(struct clone_info *ci)
>   	 */
>   	bio_init(&flush_bio, NULL, 0);
>   	flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC;
> +	flush_bio.bi_disk = ci->io->md->disk;
> +	bio_associate_blkg(&flush_bio);
> +
>   	ci->bio = &flush_bio;
>   	ci->sector_count = 0;
>   
> -	/*
> -	 * Empty flush uses a statically initialized bio, as the base for
> -	 * cloning.  However, blkg association requires that a bdev is
> -	 * associated with a gendisk, which doesn't happen until the bdev is
> -	 * opened.  So, blkg association is done at issue time of the flush
> -	 * rather than when the device is created in alloc_dev().
> -	 */
> -	bio_set_dev(ci->bio, ci->io->md->bdev);
> -
>   	BUG_ON(bio_has_data(ci->bio));
>   	while ((ti = dm_table_get_target(ci->map, target_nr++)))
>   		__send_duplicate_bios(ci, ti, ti->num_flush_bios, NULL);
> 
Ah, thought as much. I've stumbled across this while debugging 
blk-interposer.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

