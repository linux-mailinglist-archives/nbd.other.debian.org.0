Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F60439D88
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 19:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 15B50204C9; Mon, 25 Oct 2021 17:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 17:24:09 2021
Old-Return-Path: <mst@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FUZZY_OFFERS,
	MURPHY_DRUGS_REL8,PHONENUMBER,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1F4CC20634
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 17:08:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.327 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rpGl0vuRn4ZQ for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 17:08:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 13723 seconds by postgrey-1.36 at bendel; Mon, 25 Oct 2021 17:08:48 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 9F5B120627
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635181723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIsnWAzuBFe9gHiSmJ+BSqRSt/Kzk0fPACQvjnOMXwM=;
	b=T/wCtG815mGAnElJB8EQvdQAZOHeEmCVzZk/bLDTNbKR4Udhmcy4E88c/U46KQwfkfnaNN
	oaJ7MwveLtg+DDF/ufYozOwTgvLw7mtSluDB5+aj0uPOyjHTtRO7le8hcw0US/ykB8iuAM
	Qmy6I4v1SKCvF6DcygvwHDkLF+c/Jys=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-3nyt3h4SN6KetcEKQ91h1A-1; Mon, 25 Oct 2021 13:08:41 -0400
X-MC-Unique: 3nyt3h4SN6KetcEKQ91h1A-1
Received: by mail-wm1-f71.google.com with SMTP id f63-20020a1c3842000000b0032a621260deso3740292wma.8
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 10:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pIsnWAzuBFe9gHiSmJ+BSqRSt/Kzk0fPACQvjnOMXwM=;
        b=ctr0gc0tBE+3tVyFONBTrkFydCuC/V44FjtyBV5bQAbWhtNyw4DwejoYtlCJYuzimf
         Tj3L9rcVPeTMQQfo0V8z1ep50QMDDK/ohcL5o34pV6uuSTHNQInU1TK7IjZaUItyTi6t
         nSqtUDIQcs6OgAhWKW8DJnhGz3b8wjKZtD6cf5rYrz6IbTkIjFWNs/i4zB3DNihPoJN3
         iePvp6YK6W+EJT0g1JvmzqS63XarIS13SptqaPm8BHnl7mn5TdfbECAo+lP7Gzyi5aVQ
         JGVz301EQFGSZAkHurKKid/mns1Aj69+xaHmIMKOw46bIoCxteoCd4xIpn/54GpZE0sK
         UrPg==
X-Gm-Message-State: AOAM531zZiMnkw6iyyz+bz18g4268S2FdEAX9hdSIqnvWvnILD7lRuhF
	E91oOlqiPtLwJUY/BX2H/A5LAVcey0IyrykSAu7npnzBRp04bhlNbNWp0aSpujOY6wzZlviH36H
	G8Hvejwh5nGDhmg==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr21291684wmj.23.1635181719801;
        Mon, 25 Oct 2021 10:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyZto2WrweAcCxAfmQR9rdm2tzfsLZ7d2NbPqmOXvvnrZdmXf2381albDqxjOgnO+tqj1h8A==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr21291660wmj.23.1635181719596;
        Mon, 25 Oct 2021 10:08:39 -0700 (PDT)
Received: from redhat.com ([2.55.12.86])
        by smtp.gmail.com with ESMTPSA id w10sm9506341wrp.25.2021.10.25.10.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 10:08:39 -0700 (PDT)
Date: Mon, 25 Oct 2021 13:08:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, hch@lst.de, josef@toxicpanda.com, jasowang@redhat.com,
	stefanha@redhat.com, kwolf@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 4/4] virtio-blk: Use blk_validate_block_size() to
 validate block size
Message-ID: <20211025130321-mutt-send-email-mst@kernel.org>
References: <20211025142506.167-1-xieyongji@bytedance.com>
 <20211025142506.167-5-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20211025142506.167-5-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cU4Znq5QzSE.A.ZlF.5gudhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1573
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025130321-mutt-send-email-mst@kernel.org
Resent-Date: Mon, 25 Oct 2021 17:24:09 +0000 (UTC)

On Mon, Oct 25, 2021 at 10:25:06PM +0800, Xie Yongji wrote:
> The block layer can't support the block size larger than

the block size -> block sizes, or a block size

> page size yet.

And to add to that, a block size that's too small or
not a power of two won't work either, right?
Mention that too.


> If an untrusted device

nothing to do with trust. A misconfigured device.

> presents an invalid
> block size in configuration space, it will result in the
> kernel crash something like below:
> 
> [  506.154324] BUG: kernel NULL pointer dereference, address: 0000000000000008
> [  506.160416] RIP: 0010:create_empty_buffers+0x24/0x100
> [  506.174302] Call Trace:
> [  506.174651]  create_page_buffers+0x4d/0x60
> [  506.175207]  block_read_full_page+0x50/0x380
> [  506.175798]  ? __mod_lruvec_page_state+0x60/0xa0
> [  506.176412]  ? __add_to_page_cache_locked+0x1b2/0x390
> [  506.177085]  ? blkdev_direct_IO+0x4a0/0x4a0
> [  506.177644]  ? scan_shadow_nodes+0x30/0x30
> [  506.178206]  ? lru_cache_add+0x42/0x60
> [  506.178716]  do_read_cache_page+0x695/0x740
> [  506.179278]  ? read_part_sector+0xe0/0xe0
> [  506.179821]  read_part_sector+0x36/0xe0
> [  506.180337]  adfspart_check_ICS+0x32/0x320
> [  506.180890]  ? snprintf+0x45/0x70
> [  506.181350]  ? read_part_sector+0xe0/0xe0
> [  506.181906]  bdev_disk_changed+0x229/0x5c0
> [  506.182483]  blkdev_get_whole+0x6d/0x90
> [  506.183013]  blkdev_get_by_dev+0x122/0x2d0
> [  506.183562]  device_add_disk+0x39e/0x3c0
> [  506.184472]  virtblk_probe+0x3f8/0x79b [virtio_blk]
> [  506.185461]  virtio_dev_probe+0x15e/0x1d0 [virtio]
> 
> So this patch tries to use the block layer helper to
> validate the block size.

I know you are trying to be polite but it's misplaced here.
Just say what it is:

Use a block layer helper to validate the block size.

> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  drivers/block/virtio_blk.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 303caf2d17d0..8b5833997f8e 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -815,9 +815,16 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
>  				   struct virtio_blk_config, blk_size,
>  				   &blk_size);
> -	if (!err)
> +	if (!err) {
> +		err = blk_validate_block_size(blk_size);
> +		if (err) {
> +			dev_err(&vdev->dev,
> +				"get invalid block size: %u\n", blk_size);

Probably hex. Add virtio_blk: and drop "get" here - it's ungrammatical.
	"virtio_blk: invalid block size: 0x%x\n", blk_size.

> +			goto out_cleanup_disk;
> +		}
> +
>  		blk_queue_logical_block_size(q, blk_size);
> -	else
> +	} else
>  		blk_size = queue_logical_block_size(q);
>  
>  	/* Use topology information if available */
> -- 
> 2.11.0

