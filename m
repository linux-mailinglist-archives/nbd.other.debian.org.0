Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4225A580
	for <lists+nbd@lfdr.de>; Wed,  2 Sep 2020 08:24:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BECB3205BA; Wed,  2 Sep 2020 06:24:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  2 06:24:08 2020
Old-Return-Path: <song@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EBC8D205B6
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Sep 2020 06:07:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WdV2uc40nkQA for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Sep 2020 06:07:10 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
X-Greylist: delayed 421 seconds by postgrey-1.36 at bendel; Wed, 02 Sep 2020 06:07:10 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 41CBE205A0
	for <nbd@other.debian.org>; Wed,  2 Sep 2020 06:07:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6AB49207DE
	for <nbd@other.debian.org>; Wed,  2 Sep 2020 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599026826;
	bh=5+KmkwCh74/cntArpz/UMLM/pddG8ulQKVSpeB3X+RY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cTkF1377EKFMiKH243aPvnk5sDiPB+mAJ8UbjY3H3CxHW3ub6AhJm8zB6sjCeyjos
	 0Zb34r3LG95586+asqAax7/k2wV4jNsfLjOB7nVyJnDD7czJn3t7iganE4hOlIZPud
	 bwrsx4majAT2w7kFdtUeFxc30f6s6TlOONSSdwLw=
Received: by mail-lj1-f176.google.com with SMTP id w3so4413124ljo.5
        for <nbd@other.debian.org>; Tue, 01 Sep 2020 23:07:06 -0700 (PDT)
X-Gm-Message-State: AOAM533MT+ksYM/jS8ZR3fAlJ4ZGTqS8a+boqYHJuc0Sz8DLv1Vhkj7p
	JHYER5qcEJmAugqzuFkZCK7SXqFDUshaCYyqUp0=
X-Google-Smtp-Source: ABdhPJyE5jGOrYyZE6ORaRQIp51/fhLfZD64Ax0jpOVcS4L2G+U2YIU+6jbqUjHlXVyGhP2izG2P3ekqYZd5wXuophY=
X-Received: by 2002:a2e:81c2:: with SMTP id s2mr2472465ljg.10.1599026824658;
 Tue, 01 Sep 2020 23:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200901155748.2884-1-hch@lst.de> <20200901155748.2884-5-hch@lst.de>
In-Reply-To: <20200901155748.2884-5-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 1 Sep 2020 23:06:52 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5-nfKQK_178R-Y+ps6KLNMrwvWe0Rh5=M1-xvcKHYTgg@mail.gmail.com>
Message-ID: <CAPhsuW5-nfKQK_178R-Y+ps6KLNMrwvWe0Rh5=M1-xvcKHYTgg@mail.gmail.com>
Subject: Re: [PATCH 4/9] block: add a new revalidate_disk_size helper
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Dan Williams <dan.j.williams@intel.com>, dm-devel@redhat.com, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-nvdimm@lists.01.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YxqRTDdR0FF.A.ARF.IqzTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/973
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPhsuW5-nfKQK_178R-Y+ps6KLNMrwvWe0Rh5=M1-xvcKHYTgg@mail.gmail.com
Resent-Date: Wed,  2 Sep 2020 06:24:08 +0000 (UTC)

On Tue, Sep 1, 2020 at 9:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
[...]

>  drivers/md/md-cluster.c       |  6 ++---
>  drivers/md/md-linear.c        |  2 +-
>  drivers/md/md.c               | 10 ++++-----

For md bits:
Acked-by: Song Liu <song@kernel.org>

[...]
>
> +/**
> + * revalidate_disk_size - checks for disk size change and adjusts bdev size.
> + * @disk: struct gendisk to check
> + * @verbose: if %true log a message about a size change if there is any
> + *
> + * This routine checks to see if the bdev size does not match the disk size
> + * and adjusts it if it differs. When shrinking the bdev size, its all caches
> + * are freed.
> + */
> +void revalidate_disk_size(struct gendisk *disk, bool verbose)
> +{
> +       struct block_device *bdev;
> +
> +       /*
> +        * Hidden disks don't have associated bdev so there's no point in
> +        * revalidating them.
> +        */
> +       if (disk->flags & GENHD_FL_HIDDEN)
> +               return;
> +
> +       bdev = bdget_disk(disk, 0);
> +       if (bdev) {
> +               check_disk_size_change(disk, bdev, verbose);
> +               bdput(bdev);
> +       }
> +}
> +EXPORT_SYMBOL(revalidate_disk_size);

Shall we use EXPORT_SYMBOL_GPL() here?

[...]

