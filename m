Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C19439DB4
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 19:38:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B738A20504; Mon, 25 Oct 2021 17:38:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 17:38:46 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 4C7B2204C9
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 17:21:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.33 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hNwFygT3_fIt for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 17:21:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id C4349204B5
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635182476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=951N6fckZ5XpWCmhYbFd+TMi4ClcrotPVi9JGI1/vNA=;
	b=DhzGmvKMVREjuIBUG4tD4XkaziDrflu3L/sVRqdiVgVcBiVNvXC0d+9MtiZXbwR13LBygO
	lS3kEycpemD1AOsQJXi7K9cGG7Xeef/tsnry7oBxx5iZmkMocI/GXuObk/n4FqFDsryDSx
	Zvw34Ok/zRG4JQy3sp9CAfTq/uoFKhU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-zx8SKxfkMWmet4bt43PgLw-1; Mon, 25 Oct 2021 13:21:15 -0400
X-MC-Unique: zx8SKxfkMWmet4bt43PgLw-1
Received: by mail-wm1-f72.google.com with SMTP id z137-20020a1c7e8f000000b0030cd1800d86so3957836wmc.2
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 10:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=951N6fckZ5XpWCmhYbFd+TMi4ClcrotPVi9JGI1/vNA=;
        b=aBKDz8TNpYWWhwRxByndCZm8eJMRGtuu4TaiMkM75R6kP1xpDFIHI0mc2Z8cSBjRsa
         hEj22vHAB3ngj7mIgNhMcW7Q3guCtQoh6ZJhT4c6ysh6ucagYz77jS1nM4gUsDfzyapw
         DQSCSD6xx677TRN6j6NBk8c6B6qjjGnTnT9pScNfU5M4bIgGSgJFVM/BSgHpvHJ/4mGz
         BABhLCPVDg30ip3ykgQj+YJWQ0Er2AjvkmdM07SvYqD7kzxCaHmZE7cEG0xyONJnf6dZ
         GF27ik2PmgeMAx2i6vnNTqfNHX36R3cplLxGk9a3sQIsPe4sPhK/vt1mPzVTypgeABN7
         gqyw==
X-Gm-Message-State: AOAM530VyBpb+lmAD+NBKU+ntGlXXnqDjSMNuEM1C0xqNYZwky3LkH7a
	LwUBl9jGBp6Ddaz9PExZD/DQXZiuTLFCKkr3f/uRcEPSaKdeKUWfeMV5Dw7jsdIxxWfaNwqiaPP
	iciklninZzEa8pQ==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr445648wrd.33.1635182474385;
        Mon, 25 Oct 2021 10:21:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj1fTiGxIx6iukFpJuix4SvN3qiXy7bRCzCzSU/tCsoyaecfFSByMrrXTKu1tKjLZVO4MIag==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr445610wrd.33.1635182474064;
        Mon, 25 Oct 2021 10:21:14 -0700 (PDT)
Received: from redhat.com ([2.55.12.86])
        by smtp.gmail.com with ESMTPSA id f1sm12819845wrc.74.2021.10.25.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 10:21:13 -0700 (PDT)
Date: Mon, 25 Oct 2021 13:21:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Josef Bacik <josef@toxicpanda.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH 4/4] virtio-blk: Use blk_validate_block_size() to
 validate block size
Message-ID: <20211025131446-mutt-send-email-mst@kernel.org>
References: <20211025094306.97-1-xieyongji@bytedance.com>
 <20211025094306.97-5-xieyongji@bytedance.com>
 <20211025091911-mutt-send-email-mst@kernel.org>
 <CACycT3smA7sSdp-8BKUtN4OW7nkUX+NaW_x9JzfvVgUvM9Yh7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACycT3smA7sSdp-8BKUtN4OW7nkUX+NaW_x9JzfvVgUvM9Yh7A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AJVf-fwOtBE.A.tq.muudhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1574
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025131446-mutt-send-email-mst@kernel.org
Resent-Date: Mon, 25 Oct 2021 17:38:46 +0000 (UTC)

On Mon, Oct 25, 2021 at 09:47:34PM +0800, Yongji Xie wrote:
> On Mon, Oct 25, 2021 at 9:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Oct 25, 2021 at 05:43:06PM +0800, Xie Yongji wrote:
> > > The block layer can't support the block size larger than
> > > page size yet. If an untrusted device presents an invalid
> > > block size in configuration space, it will result in the
> > > kernel crash something like below:
> > >
> > > [  506.154324] BUG: kernel NULL pointer dereference, address: 0000000000000008
> > > [  506.160416] RIP: 0010:create_empty_buffers+0x24/0x100
> > > [  506.174302] Call Trace:
> > > [  506.174651]  create_page_buffers+0x4d/0x60
> > > [  506.175207]  block_read_full_page+0x50/0x380
> > > [  506.175798]  ? __mod_lruvec_page_state+0x60/0xa0
> > > [  506.176412]  ? __add_to_page_cache_locked+0x1b2/0x390
> > > [  506.177085]  ? blkdev_direct_IO+0x4a0/0x4a0
> > > [  506.177644]  ? scan_shadow_nodes+0x30/0x30
> > > [  506.178206]  ? lru_cache_add+0x42/0x60
> > > [  506.178716]  do_read_cache_page+0x695/0x740
> > > [  506.179278]  ? read_part_sector+0xe0/0xe0
> > > [  506.179821]  read_part_sector+0x36/0xe0
> > > [  506.180337]  adfspart_check_ICS+0x32/0x320
> > > [  506.180890]  ? snprintf+0x45/0x70
> > > [  506.181350]  ? read_part_sector+0xe0/0xe0
> > > [  506.181906]  bdev_disk_changed+0x229/0x5c0
> > > [  506.182483]  blkdev_get_whole+0x6d/0x90
> > > [  506.183013]  blkdev_get_by_dev+0x122/0x2d0
> > > [  506.183562]  device_add_disk+0x39e/0x3c0
> > > [  506.184472]  virtblk_probe+0x3f8/0x79b [virtio_blk]
> > > [  506.185461]  virtio_dev_probe+0x15e/0x1d0 [virtio]
> > >
> > > So this patch tries to use the block layer helper to
> > > validate the block size.
> > >
> > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > ---
> > >  drivers/block/virtio_blk.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > index 303caf2d17d0..5bcacefe969e 100644
> > > --- a/drivers/block/virtio_blk.c
> > > +++ b/drivers/block/virtio_blk.c
> > > @@ -815,9 +815,12 @@ static int virtblk_probe(struct virtio_device *vdev)
> > >       err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
> > >                                  struct virtio_blk_config, blk_size,
> > >                                  &blk_size);
> > > -     if (!err)
> > > +     if (!err) {
> > > +             if (blk_validate_block_size(blk_size))
> > > +                     goto out_cleanup_disk;
> > > +
> >
> >
> > Did you test this with an invalid blk size? It seems unlikely that it
> > fails properly the way you'd expect.
> >
> 
> Oops... Sorry, I just checked whether the block device is created with
> invalid block size.
> 
> Will send v2 soon!
> 
> Thanks,
> Yongji

Please avoid doing that in the future. Posting untested patches is only
acceptable if you make it abundantly clear that they are untested.

-- 
MST

