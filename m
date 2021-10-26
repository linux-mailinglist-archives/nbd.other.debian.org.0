Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945343B4F2
	for <lists+nbd@lfdr.de>; Tue, 26 Oct 2021 16:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3A8C3204A9; Tue, 26 Oct 2021 14:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 26 14:57:09 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FUZZY_OFFERS,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6A004203B5
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Oct 2021 14:40:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.62 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gFTwVM5bCdCZ for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Oct 2021 14:40:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x531.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3954420257
	for <nbd@other.debian.org>; Tue, 26 Oct 2021 14:40:34 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r4so14316251edi.5
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mSWtXB/10GYg5/lRngbyvlgP7+kkTOIJMv08dtSqWY=;
        b=eJEMdhGlzbxrvPkG51t2L6/lbCk8t9PSZmMk+f9ViSwcgzlCVVAz5mbCaRclMhNggL
         a8xYdbIF8ou8U32fm+vMNLs6HOvTnS6WksdDLsQjq3IMlEXqlM8N2n0+gmHafC+8vxv+
         s3M4LE6av2otywq8PNGrLPcCtgm+TKAuJQg5cNf2r1FLDgjSy8LEV7WV7LZ6s6IKlmIa
         f1oQbs/aKfBHOreUGDrIeD3AXKwmpLGkmJvH8fXD35W35sH8H+Z5is/g1Qe0GlLfMQXw
         siII96vMuH5up5xagav0Md5B6jjeC65c3iENti1FEIAMmg0UPEVX0ZStWxUsQ8ATzhvM
         ALvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mSWtXB/10GYg5/lRngbyvlgP7+kkTOIJMv08dtSqWY=;
        b=tCwd/t5b170PvxPTFRFeUK6H6DM3/qz4UphNXT8cCdIsVcFF9YZJMYQDdrvSYZQUhq
         0E15KZ0dyDqO7W8fB+szexyW13zbD0CJFmwbrbVcWSWZ2RSWX/SoTUVfgZyMC8OyulEr
         L5510UcPdlWuSwBX7DySL8704Zmmhxd+inhtcpBJuG0S7+vYdZNtR4Lmx6zyqiR6MUhL
         Ww0/lXeiJWEnMzKQRhCa+BwpDKvNqvaWwYPrIpEgoZ2L1eC8YBf4yf2Z/D60gPs3shW5
         yF+6RVI/CLroSuSfbzYGfF6b95nLPFVl1FEi1ahfot7zGICwKzfwMwGojInaGh+Cz547
         0pWg==
X-Gm-Message-State: AOAM532CIAzoHPUhYrTMm58P8l4eXl41NY06fumRN6S8tH2Xu+dI0gK/
	m8oXU4Hj5IKM4cRAZRK0KUh8PlKLoN53npyNilKi
X-Google-Smtp-Source: ABdhPJwC2mO/DHhzRxd0j68YA7cEFFZK7MWq+wg8I7WRAMG7QURblQaS53IPnniBipj2UOYi3DcXnmNJbrUReXKL7l8=
X-Received: by 2002:a17:907:9803:: with SMTP id ji3mr15415555ejc.286.1635259049989;
 Tue, 26 Oct 2021 07:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094306.97-1-xieyongji@bytedance.com> <20211025094306.97-5-xieyongji@bytedance.com>
 <20211025091911-mutt-send-email-mst@kernel.org> <CACycT3smA7sSdp-8BKUtN4OW7nkUX+NaW_x9JzfvVgUvM9Yh7A@mail.gmail.com>
 <20211025131446-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211025131446-mutt-send-email-mst@kernel.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 26 Oct 2021 22:37:19 +0800
Message-ID: <CACycT3uay=DAdwD-TbH4B6Z5SmuC2P1zvjW5wTzKroCw=NqVKA@mail.gmail.com>
Subject: Re: [PATCH 4/4] virtio-blk: Use blk_validate_block_size() to validate
 block size
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>, 
	Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bf8MP2IJIwE.A.w4D.FdBehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1576
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3uay=DAdwD-TbH4B6Z5SmuC2P1zvjW5wTzKroCw=NqVKA@mail.gmail.com
Resent-Date: Tue, 26 Oct 2021 14:57:09 +0000 (UTC)

On Tue, Oct 26, 2021 at 1:21 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 25, 2021 at 09:47:34PM +0800, Yongji Xie wrote:
> > On Mon, Oct 25, 2021 at 9:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Oct 25, 2021 at 05:43:06PM +0800, Xie Yongji wrote:
> > > > The block layer can't support the block size larger than
> > > > page size yet. If an untrusted device presents an invalid
> > > > block size in configuration space, it will result in the
> > > > kernel crash something like below:
> > > >
> > > > [  506.154324] BUG: kernel NULL pointer dereference, address: 0000000000000008
> > > > [  506.160416] RIP: 0010:create_empty_buffers+0x24/0x100
> > > > [  506.174302] Call Trace:
> > > > [  506.174651]  create_page_buffers+0x4d/0x60
> > > > [  506.175207]  block_read_full_page+0x50/0x380
> > > > [  506.175798]  ? __mod_lruvec_page_state+0x60/0xa0
> > > > [  506.176412]  ? __add_to_page_cache_locked+0x1b2/0x390
> > > > [  506.177085]  ? blkdev_direct_IO+0x4a0/0x4a0
> > > > [  506.177644]  ? scan_shadow_nodes+0x30/0x30
> > > > [  506.178206]  ? lru_cache_add+0x42/0x60
> > > > [  506.178716]  do_read_cache_page+0x695/0x740
> > > > [  506.179278]  ? read_part_sector+0xe0/0xe0
> > > > [  506.179821]  read_part_sector+0x36/0xe0
> > > > [  506.180337]  adfspart_check_ICS+0x32/0x320
> > > > [  506.180890]  ? snprintf+0x45/0x70
> > > > [  506.181350]  ? read_part_sector+0xe0/0xe0
> > > > [  506.181906]  bdev_disk_changed+0x229/0x5c0
> > > > [  506.182483]  blkdev_get_whole+0x6d/0x90
> > > > [  506.183013]  blkdev_get_by_dev+0x122/0x2d0
> > > > [  506.183562]  device_add_disk+0x39e/0x3c0
> > > > [  506.184472]  virtblk_probe+0x3f8/0x79b [virtio_blk]
> > > > [  506.185461]  virtio_dev_probe+0x15e/0x1d0 [virtio]
> > > >
> > > > So this patch tries to use the block layer helper to
> > > > validate the block size.
> > > >
> > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > ---
> > > >  drivers/block/virtio_blk.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > > index 303caf2d17d0..5bcacefe969e 100644
> > > > --- a/drivers/block/virtio_blk.c
> > > > +++ b/drivers/block/virtio_blk.c
> > > > @@ -815,9 +815,12 @@ static int virtblk_probe(struct virtio_device *vdev)
> > > >       err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
> > > >                                  struct virtio_blk_config, blk_size,
> > > >                                  &blk_size);
> > > > -     if (!err)
> > > > +     if (!err) {
> > > > +             if (blk_validate_block_size(blk_size))
> > > > +                     goto out_cleanup_disk;
> > > > +
> > >
> > >
> > > Did you test this with an invalid blk size? It seems unlikely that it
> > > fails properly the way you'd expect.
> > >
> >
> > Oops... Sorry, I just checked whether the block device is created with
> > invalid block size.
> >
> > Will send v2 soon!
> >
> > Thanks,
> > Yongji
>
> Please avoid doing that in the future. Posting untested patches is only
> acceptable if you make it abundantly clear that they are untested.
>

Certainly

Thanks,
Yongji

