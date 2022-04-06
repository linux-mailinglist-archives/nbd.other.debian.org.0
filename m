Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF574F67CB
	for <lists+nbd@lfdr.de>; Wed,  6 Apr 2022 19:45:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6BACC206FA; Wed,  6 Apr 2022 17:45:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr  6 17:45:13 2022
Old-Return-Path: <konishi.ryusuke@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FREEMAIL_FROM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0599020619
	for <lists-other-nbd@bendel.debian.org>; Wed,  6 Apr 2022 17:28:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.911 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id r4pWDBmujW_T for <lists-other-nbd@bendel.debian.org>;
	Wed,  6 Apr 2022 17:28:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5870E205C7
	for <nbd@other.debian.org>; Wed,  6 Apr 2022 17:28:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f16so473397lfe.11
        for <nbd@other.debian.org>; Wed, 06 Apr 2022 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
        b=nHoFYmIVcbUdYBuRBczLdRhO5AcYZ6GHHFtKpS9G1n5vNIpBGLipmKmQ40hQnwfBEK
         9YcCx5HGe8T4NG1UPywpqZKblDsiU8Uam6EvTYaei53mUEV7gX/X6QEIMPDVNdTe1RsC
         lSqUADllCjDlRJ3aqfDHj4gGsZ5WvTndElsOvm3ukXbURNWbOjm9tS3FKy9TW5JIte+s
         iqchodtdlLO+0839AsHapTHL+am4rmkQFqKuweIuQiuTq0iA/dxkHoEkiJl793SmXbAL
         d6FIVbXVTWtg6j4nPkHK8I7vb1+rBuBMN5T4ZVmgoa+qulAgS9/S0AV92hnwAdWJS/in
         gNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
        b=Y6arogwKG5F5xJxyM/ATvnn632Ln98rTKapNGA+W2VD+HlFjFIzC2mEKS8U7Xto85E
         gkY0R1tuF++zXm9LytUkPegK+OZLwDSw7HpvuKyiVfisVyIGLOjp5CTChUsFtzClN4Tw
         AtgXzVGPcMCVj4N++d+2IaqXEYHONDM+KRlrI37jS8cm2zgd/jApWpLK7TAaKLEWCGM5
         KJmHwAQITO74MfXNA7X+E0tqzUpygb/4cTVN5QmO8rEmZQqqvucDqbkh3xR06hkuP8YB
         4YJ1pvEYSCv7F2HO27EtNrHAIl7RQ8Qwt8TzkEiWmV84ofJzPETYV9wefjOMgRDkKzE+
         TXkA==
X-Gm-Message-State: AOAM533+M8UMfjKQqiKCPIRp5t5pXXEHMHJKkxw9QS339ibImjmofxLm
	egoH2FM2qvSwEM/aDmNzRUPwPdyGsnBRWTU8GeY=
X-Google-Smtp-Source: ABdhPJxvT7YhfWN8QbCVz4oydCsKwT/zbXQ5089WXaSZlqzdjbFflulVc086iBmKtewP4KtbC66vp+jW8qrWjcRFTmg=
X-Received: by 2002:ac2:5f4d:0:b0:43e:da3e:4529 with SMTP id
 13-20020ac25f4d000000b0043eda3e4529mr6768924lfz.627.1649266108188; Wed, 06
 Apr 2022 10:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220406060516.409838-1-hch@lst.de> <20220406060516.409838-24-hch@lst.de>
In-Reply-To: <20220406060516.409838-24-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 7 Apr 2022 02:28:15 +0900
Message-ID: <CAKFNMokGOma3pvHdEsnsjuKgW+jpYX9zx8fWwJWyeKuCpKz-YQ@mail.gmail.com>
Subject: Re: [PATCH 23/27] block: add a bdev_max_discard_sectors helper
To: Christoph Hellwig <hch@lst.de>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	device-mapper development <dm-devel@redhat.com>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, ntfs3@lists.linux.dev, 
	ocfs2-devel@oss.oracle.com, Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_NjHLulQQBM.A.EIF.pGdTiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1886
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKFNMokGOma3pvHdEsnsjuKgW+jpYX9zx8fWwJWyeKuCpKz-YQ@mail.gmail.com
Resent-Date: Wed,  6 Apr 2022 17:45:13 +0000 (UTC)

On Wed, Apr 6, 2022 at 11:05 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper to query the number of sectors support per each discard bio
> based on the block device and use this helper to stop various places from
> poking into the request_queue to see if discard is supported and if so how
> much.  This mirrors what is done e.g. for write zeroes as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
...
> diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
> index 16e775bcf4a7c..7d510e4231713 100644
> --- a/drivers/target/target_core_device.c
> +++ b/drivers/target/target_core_device.c
> @@ -829,9 +829,7 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
>  }
>
>  /*
> - * Check if the underlying struct block_device request_queue supports
> - * the QUEUE_FLAG_DISCARD bit for UNMAP/WRITE_SAME in SCSI + TRIM
> - * in ATA and we need to set TPE=1

> + * Check if the underlying struct block_device request_queue supports disard.
>   */

Here was a typo:

 s/disard/discard/

On Thu, Apr 7, 2022 at 12:19 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> If I'm misreading things, could you please document that
> bdev_max_discard_sectors() != 0 implies that discard is supported?

I got the same impression.   Checking the discard support with
bdev_max_discard_sectors() != 0 seems a bit unclear than before.

Thanks,
Ryusuke Konishi

