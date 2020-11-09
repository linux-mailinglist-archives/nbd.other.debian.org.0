Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E752ABE41
	for <lists+nbd@lfdr.de>; Mon,  9 Nov 2020 15:09:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DFA7320155; Mon,  9 Nov 2020 14:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  9 14:09:08 2020
Old-Return-Path: <idryomov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 056EB200F1
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Nov 2020 13:52:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.821 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uZAZm_cV0c2t for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Nov 2020 13:52:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CFB8E200DF
	for <nbd@other.debian.org>; Mon,  9 Nov 2020 13:52:10 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t13so8330146ilp.2
        for <nbd@other.debian.org>; Mon, 09 Nov 2020 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kU2Lz6FCVrZiuEoHabGbCYI8mZi4aQygf2Kr0fLfGG4=;
        b=Lb/BkUcVIcd6xhv8oVONfECjW/ZB+eIGRHnh0dm3V/Dcve1CHMxGnjqr8op+1v76K7
         BboZLuIC9lFoWJc8zRN7ckG8JYkUCEMrBXYH3LeqwWaeQw6FiksBZKkC4/rY+nMcbUOP
         mcyx+jHFLBCXxcHO2RHq4/pyA2nmEefVK9oOy9OsQ2fr8vLqz43v1yvxxZclHh7D+k2N
         Qw7b/fXaJ5trjyicYsioOneOxQN4Qzfe8MAWER1MvLiN60BX2gzHW6baJIDiu8cGcvYG
         BbC7br0UMOuvYPQzgHxuAO2xrcgSSEORe8jj2L4/gatFyG+wbhw19VFJICOjyYa/QKXf
         TWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kU2Lz6FCVrZiuEoHabGbCYI8mZi4aQygf2Kr0fLfGG4=;
        b=oYBmURWKo2INl9A6FIONmtZ4CZTfls6IkIf0MkzhVtfz6cKUwGtXZTBESzzqUVfLVk
         9kkps8FAdAttaW3D6m8uY6WrCC5yUjh5/+tLgDJmr/J5xLqGq1AJTIEYgAoWCsgHhGLj
         msAZnS97cJmnUypV6X0WAbZRe9H+bBb+f/RiKhnJxYpDUlRNr4X6f4Quvc2bKeudfRIn
         bn55VCCh2FH+N0EIWNASD34+RdVLHe5rME5fNuOhrteRheAav7MFuPKrIP7SiXkcsgEd
         V3o4RQ1z+yRGChUpniiU4TIn8r7XkCxLLtJFMMBdIcVsn4GFvDnEIfTjkOji9ZKCpJYd
         2k/w==
X-Gm-Message-State: AOAM532eVV7fq/S1XSwx5/ebKBS4HEFF9K8tyKq+QkyPJGEJqVh38dhw
	WCJSjjQa5Jc66O0WnogyWOs0SGPqgx0KPd7IbIM=
X-Google-Smtp-Source: ABdhPJyXm5ijaiShQDd7Xj0k0fsOvCm3U5j3JctcQpIY73kNN30YAUsNc9VfJ5DemzskInCCw4oOffcooZ/r5dSiKD8=
X-Received: by 2002:a05:6e02:c:: with SMTP id h12mr10623495ilr.177.1604929927708;
 Mon, 09 Nov 2020 05:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-18-hch@lst.de>
In-Reply-To: <20201106190337.1973127-18-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 9 Nov 2020 14:52:08 +0100
Message-ID: <CAOi1vP83cOt_FOFLXQmgBpDgmaq8o8OQcUYWOb97jzkgOw6r4A@mail.gmail.com>
Subject: Re: [PATCH 17/24] rbd: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com, 
	linux-block <linux-block@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>, 
	nbd@other.debian.org, Ceph Development <ceph-devel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <syrNhbcHdRJ.A.uAE.E2UqfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1047
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOi1vP83cOt_FOFLXQmgBpDgmaq8o8OQcUYWOb97jzkgOw6r4A@mail.gmail.com
Resent-Date: Mon,  9 Nov 2020 14:09:08 +0000 (UTC)

On Fri, Nov 6, 2020 at 8:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rbd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index f84128abade319..b7a194ffda55b4 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4920,8 +4920,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
>             !test_bit(RBD_DEV_FLAG_REMOVING, &rbd_dev->flags)) {
>                 size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
>                 dout("setting size to %llu sectors", (unsigned long long)size);
> -               set_capacity(rbd_dev->disk, size);
> -               revalidate_disk_size(rbd_dev->disk, true);
> +               set_capacity_and_notify(rbd_dev->disk, size);
>         }
>  }
>
> --
> 2.28.0
>

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

