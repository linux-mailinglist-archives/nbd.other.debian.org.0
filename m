Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 678DD43B4C9
	for <lists+nbd@lfdr.de>; Tue, 26 Oct 2021 16:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3820720478; Tue, 26 Oct 2021 14:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 26 14:51:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FUZZY_OFFERS,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5D3A320126
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Oct 2021 14:35:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.62 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ObYuOhdAQh90 for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Oct 2021 14:35:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BA83E20496
	for <nbd@other.debian.org>; Tue, 26 Oct 2021 14:35:05 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s1so14598998edd.3
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yuKKrs3Ow3IzVDLkYw3gFWO+/+kch1/KKYE/ao6tW2s=;
        b=Zl/HCXuVH7d6Jzj17Og8z9qCUApZRl7V9dWdkie82j4G2U/fyzlyIoI5vwhJzeHUcX
         uDlvgg3TaDvFeqnfPwRJA5jhAfTsVxPCJszL3qyp6CMPkPcihfKAY2gMP+5y+/VmlxW2
         RAs37w/Ng4GR3Ti4dc+zxXivtDOWXfMGBRiimm76v2Va6vfWkAa3XrTEp/yU9XWZ5Ctc
         R5phtqwTy9nVLETqS0t0Ui5LW176CHkVY+o2jIzL8ZfonbZT98j8ov2IrySZHPY19vtO
         Fkb+OPJIVvhEcSW4u8tCZy3qxHMsHX8betQwfJEyz5HMB7EMAxnhA4UC7JTwU88jE1dp
         BSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yuKKrs3Ow3IzVDLkYw3gFWO+/+kch1/KKYE/ao6tW2s=;
        b=6TbOMfXw7vRUTio1fPLBjrbsnR+U8F9N52Abqt4uy7s1mzgIothTrxFEafVV08TVTx
         cITIpzkFKqMkyQL+M6LT5jOR5Y/8UEN6QnheFt5AmYKEjxq/clTXxWb/QQPqQ6Nd41O8
         +anYRqsh6ZfSDTko64V9D05uIUETBPqosDwbLYDuNmuQId9k4NS2xmZVqwFJOFmDzKy/
         iHF2bhBrUU602yBWg/nDz1o+btgNkxcwZH3KHGsFkpt+dDgRipEPll+yjBLCk198mvDP
         CA27w0dg205JGsqzDC7KPDW+zwYB0zswCDbQ3tTOjENb/+wSXFA3QGLm/MLQVTZ+8ng2
         ZVuw==
X-Gm-Message-State: AOAM530+4NXiX5XaxsuCtVgy3eNJDJE9eIVNkF1XU2tihYN69z+QTCgH
	iorPQ89z8g+L0Nc5rP59jqbE2xwqi2pkPA8gEbnA
X-Google-Smtp-Source: ABdhPJyxwCqIZqFlRbbAb7FssVXpXGzZlP1I23ozElL7KvX0vbsOIlAPJAlhbN8sudLr99TaTyFSGb3AloToGe/oLFk=
X-Received: by 2002:a05:6402:1693:: with SMTP id a19mr22301422edv.231.1635258787541;
 Tue, 26 Oct 2021 07:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211025142506.167-1-xieyongji@bytedance.com> <20211025142506.167-5-xieyongji@bytedance.com>
 <20211025130321-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211025130321-mutt-send-email-mst@kernel.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 26 Oct 2021 22:32:56 +0800
Message-ID: <CACycT3ustr9ddcXJQ6Y6kbVLtkZkvRdJXoPe5zOkSfi_KzaD2w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] virtio-blk: Use blk_validate_block_size() to
 validate block size
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>, 
	Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oPWBoYjp1ON.A.qaD.eXBehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1575
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3ustr9ddcXJQ6Y6kbVLtkZkvRdJXoPe5zOkSfi_KzaD2w@mail.gmail.com
Resent-Date: Tue, 26 Oct 2021 14:51:10 +0000 (UTC)

On Tue, Oct 26, 2021 at 1:08 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 25, 2021 at 10:25:06PM +0800, Xie Yongji wrote:
> > The block layer can't support the block size larger than
>
> the block size -> block sizes, or a block size
>
> > page size yet.
>
> And to add to that, a block size that's too small or
> not a power of two won't work either, right?
> Mention that too.
>

OK.

>
> > If an untrusted device
>
> nothing to do with trust. A misconfigured device.
>

I see.

> > presents an invalid
> > block size in configuration space, it will result in the
> > kernel crash something like below:
> >
> > [  506.154324] BUG: kernel NULL pointer dereference, address: 0000000000000008
> > [  506.160416] RIP: 0010:create_empty_buffers+0x24/0x100
> > [  506.174302] Call Trace:
> > [  506.174651]  create_page_buffers+0x4d/0x60
> > [  506.175207]  block_read_full_page+0x50/0x380
> > [  506.175798]  ? __mod_lruvec_page_state+0x60/0xa0
> > [  506.176412]  ? __add_to_page_cache_locked+0x1b2/0x390
> > [  506.177085]  ? blkdev_direct_IO+0x4a0/0x4a0
> > [  506.177644]  ? scan_shadow_nodes+0x30/0x30
> > [  506.178206]  ? lru_cache_add+0x42/0x60
> > [  506.178716]  do_read_cache_page+0x695/0x740
> > [  506.179278]  ? read_part_sector+0xe0/0xe0
> > [  506.179821]  read_part_sector+0x36/0xe0
> > [  506.180337]  adfspart_check_ICS+0x32/0x320
> > [  506.180890]  ? snprintf+0x45/0x70
> > [  506.181350]  ? read_part_sector+0xe0/0xe0
> > [  506.181906]  bdev_disk_changed+0x229/0x5c0
> > [  506.182483]  blkdev_get_whole+0x6d/0x90
> > [  506.183013]  blkdev_get_by_dev+0x122/0x2d0
> > [  506.183562]  device_add_disk+0x39e/0x3c0
> > [  506.184472]  virtblk_probe+0x3f8/0x79b [virtio_blk]
> > [  506.185461]  virtio_dev_probe+0x15e/0x1d0 [virtio]
> >
> > So this patch tries to use the block layer helper to
> > validate the block size.
>
> I know you are trying to be polite but it's misplaced here.
> Just say what it is:
>
> Use a block layer helper to validate the block size.
>

OK.

> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  drivers/block/virtio_blk.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > index 303caf2d17d0..8b5833997f8e 100644
> > --- a/drivers/block/virtio_blk.c
> > +++ b/drivers/block/virtio_blk.c
> > @@ -815,9 +815,16 @@ static int virtblk_probe(struct virtio_device *vdev)
> >       err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
> >                                  struct virtio_blk_config, blk_size,
> >                                  &blk_size);
> > -     if (!err)
> > +     if (!err) {
> > +             err = blk_validate_block_size(blk_size);
> > +             if (err) {
> > +                     dev_err(&vdev->dev,
> > +                             "get invalid block size: %u\n", blk_size);
>
> Probably hex. Add virtio_blk: and drop "get" here - it's ungrammatical.
>         "virtio_blk: invalid block size: 0x%x\n", blk_size.
>

Will do it.

Thanks,
Yongji

