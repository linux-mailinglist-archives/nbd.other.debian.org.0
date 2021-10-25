Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE95439814
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 16:06:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B37DC205E8; Mon, 25 Oct 2021 14:06:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 14:06:20 2021
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
	by bendel.debian.org (Postfix) with ESMTP id A8EE4205EE
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 13:50:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.33 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GGtQNYHCUF1Q for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 13:50:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id C34A9205E8
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635169837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pQ1OI9HAD5wjVNNOGgAN/kQupBGnrAHU5IxWWPewKWg=;
	b=au8RMAAU1rvnjqnPgxB+rIvankaO8JEB3Gg5K3AXAVKDnIMDEK17ILMz4SNwc2Si2gpYCR
	kOJ/P0zsDuYzgpqmDILBT0fZ2+cfTmbQdi5udKXEOz8y/YrIt2k5uUvR0BcRJ9ObbpSUtE
	9ZpVVMFGXX+ZEOxVoPv5nc+ikktcpPE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-FnPIzZmpOSuxu5MvCAXU8w-1; Mon, 25 Oct 2021 09:19:58 -0400
X-MC-Unique: FnPIzZmpOSuxu5MvCAXU8w-1
Received: by mail-wm1-f69.google.com with SMTP id r205-20020a1c44d6000000b0032cb058fe13so1533270wma.7
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 06:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pQ1OI9HAD5wjVNNOGgAN/kQupBGnrAHU5IxWWPewKWg=;
        b=duA3cBE1BtVoterq549yqKpVIAjWxqiwVVy76yiZt6KaPPcv4WJ2gZMo1HpKbdv6Le
         D6cPZd+yUaLtN+/foE/Smv39nL595/UPoxV5vixXWjgGjAc+97UoOQTcPXW21DkhzZvG
         jg4OWIwyge1UnjPunBfCPOoCtB/0Kydqyagxk1ZvCEi3Lpa/5eii+mJeXoR4zEQAtBu4
         T/6H8Nss/BLlSsWBBGrejT7FdhA9skqNPmIp6HZJ2K3Aa/K5podLeltMt5TJl2mzivm6
         eX8vuONdyCvnFKQl4XlE7KuKONuAvXhq/0hI2o8ImMCc8ovQr+zihBoubm31efyBvN08
         9P3Q==
X-Gm-Message-State: AOAM5317YL8ntGPEn7SJFj+WVAqHr8drlZD9bzpWncYf+Ttu/sLIwAcX
	5WkIAOqsvIuXT2LuHXmO8cODLxwWduSBiXjeB3mp7OpNSEoO6AZvpKehPgCfZWpVaIBemDKJ7oS
	dpBjNtQ4gdm+KVA==
X-Received: by 2002:adf:d20d:: with SMTP id j13mr21610397wrh.432.1635167997168;
        Mon, 25 Oct 2021 06:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/aD7gRnCuI5j47+0ONiKyu52bZ58nYsV/ZMfaGwWvIPrql4qDGm85P73R9e6uVPOdWjBWhQ==
X-Received: by 2002:adf:d20d:: with SMTP id j13mr21610369wrh.432.1635167997009;
        Mon, 25 Oct 2021 06:19:57 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:bfd4:918:2bfe:a2a5:6abe])
        by smtp.gmail.com with ESMTPSA id s11sm8355747wrt.60.2021.10.25.06.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 06:19:56 -0700 (PDT)
Date: Mon, 25 Oct 2021 09:19:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, hch@lst.de, josef@toxicpanda.com, jasowang@redhat.com,
	stefanha@redhat.com, kwolf@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 4/4] virtio-blk: Use blk_validate_block_size() to
 validate block size
Message-ID: <20211025091911-mutt-send-email-mst@kernel.org>
References: <20211025094306.97-1-xieyongji@bytedance.com>
 <20211025094306.97-5-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20211025094306.97-5-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Z7bC51vOxK.A.f6C.cnrdhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1567
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025091911-mutt-send-email-mst@kernel.org
Resent-Date: Mon, 25 Oct 2021 14:06:20 +0000 (UTC)

On Mon, Oct 25, 2021 at 05:43:06PM +0800, Xie Yongji wrote:
> The block layer can't support the block size larger than
> page size yet. If an untrusted device presents an invalid
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
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  drivers/block/virtio_blk.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 303caf2d17d0..5bcacefe969e 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -815,9 +815,12 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
>  				   struct virtio_blk_config, blk_size,
>  				   &blk_size);
> -	if (!err)
> +	if (!err) {
> +		if (blk_validate_block_size(blk_size))
> +			goto out_cleanup_disk;
> +


Did you test this with an invalid blk size? It seems unlikely that it
fails properly the way you'd expect.

>  		blk_queue_logical_block_size(q, blk_size);
> -	else
> +	} else
>  		blk_size = queue_logical_block_size(q);
>  
>  	/* Use topology information if available */
> -- 
> 2.11.0

