Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07243D2A9
	for <lists+nbd@lfdr.de>; Wed, 27 Oct 2021 22:15:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F3C072014D; Wed, 27 Oct 2021 20:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 27 20:15:10 2021
Old-Return-Path: <mst@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FUZZY_OFFERS,
	MURPHY_DRUGS_REL8,PHONENUMBER,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 526A5203B8
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 Oct 2021 19:58:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.33 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EtrxgelFXR-R for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 Oct 2021 19:58:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 8F153203B0
	for <nbd@other.debian.org>; Wed, 27 Oct 2021 19:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635364718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnYp+Ff4hb5nCYByl2z0UK3tRsHSwGb6NEyDFeJqpaU=;
	b=d/+BZeurglBkFZMPUXyVjCqS9bcCOGIYAYqzKR6wLnbNITzDDJd4h18neyhHowGTKHV1iN
	ulDdTobVSNWO5ycuB4F1lj+piPPNJH4MA6H95PRE3F8QRWUqggSVfzgSoJl2gG/v/ZkY1f
	cGSidhsnjuu5VwZXNxhYyjtZuOBfUIA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-y5Tj02WmPn-UX-FyQliHDQ-1; Wed, 27 Oct 2021 15:58:36 -0400
X-MC-Unique: y5Tj02WmPn-UX-FyQliHDQ-1
Received: by mail-ed1-f70.google.com with SMTP id f4-20020a50e084000000b003db585bc274so3340516edl.17
        for <nbd@other.debian.org>; Wed, 27 Oct 2021 12:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gnYp+Ff4hb5nCYByl2z0UK3tRsHSwGb6NEyDFeJqpaU=;
        b=GVpslU06HwhzNProz694gWoCJrOSN8EnhSEO/Z2sMJaLxqdiTCFoF+/dNzMP7wEqMc
         XBcCZaEQc8NuGwCq6mFZvwCuuzQqsq10KiI5qXobujSdjb4K03YHQAYaTx2VqAKMsDjX
         nYqPA0tYz9ybYfdn4GSJG87QqSL1ooyFHaThqNP5pbVVLEffjWBKj67yZR0FAo160OCp
         C4HCU+HDOnC5U4jZiPnDzGizL3Jo5ZL6x7LAGIVmuJTPDnA+yxA+qwVOWcXlhm4isX48
         RhUIfYHPVSJVqiP4se0kaWCQYlJ5B5eNoHxf/02TwZ1XmWmGiFDWlNHKGYLg9HHhX5Kw
         S6sg==
X-Gm-Message-State: AOAM532KIO9CMbN6SzJvpQH9K+f7o0I8+6VnsBPUqY7HvzRevXaRYhVl
	kU6sK0B6ygq7ykSaGl8AxKxT0sZ60amFgH2qGy2bOCodJhR7SdNdRSqNE2Uj/0K0WdLk6pFA2Hn
	4uOfqu3uiP5+Snw==
X-Received: by 2002:aa7:db93:: with SMTP id u19mr11525976edt.179.1635364715607;
        Wed, 27 Oct 2021 12:58:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycH4irDBiKduRr0odmcV94oTFExCh07bjLyoBA8odK5EFPAdjJ0vRsc5zlYNzBq9zpNBJlVA==
X-Received: by 2002:aa7:db93:: with SMTP id u19mr11525950edt.179.1635364715442;
        Wed, 27 Oct 2021 12:58:35 -0700 (PDT)
Received: from redhat.com ([2.55.137.59])
        by smtp.gmail.com with ESMTPSA id x6sm507400eds.83.2021.10.27.12.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 12:58:34 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:58:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, hch@lst.de, josef@toxicpanda.com, jasowang@redhat.com,
	stefanha@redhat.com, kwolf@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 4/4] virtio-blk: Use blk_validate_block_size() to
 validate block size
Message-ID: <20211027155738-mutt-send-email-mst@kernel.org>
References: <20211026144015.188-1-xieyongji@bytedance.com>
 <20211026144015.188-5-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20211026144015.188-5-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FmAEQ-6N0o.A.8rE.ONbehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1585
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211027155738-mutt-send-email-mst@kernel.org
Resent-Date: Wed, 27 Oct 2021 20:15:10 +0000 (UTC)

On Tue, Oct 26, 2021 at 10:40:15PM +0800, Xie Yongji wrote:
> The block layer can't support a block size larger than
> page size yet. And a block size that's too small or
> not a power of two won't work either. If a misconfigured
> device presents an invalid block size in configuration space,
> it will result in the kernel crash something like below:
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
> So let's use a block layer helper to validate the block size.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


Please merge through the block tree because of the
dependency.

Jens can you pick this up?

> ---
>  drivers/block/virtio_blk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 303caf2d17d0..fd086179f980 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -815,9 +815,17 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
>  				   struct virtio_blk_config, blk_size,
>  				   &blk_size);
> -	if (!err)
> +	if (!err) {
> +		err = blk_validate_block_size(blk_size);
> +		if (err) {
> +			dev_err(&vdev->dev,
> +				"virtio_blk: invalid block size: 0x%x\n",
> +				blk_size);
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

