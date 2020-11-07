Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC852AA1EB
	for <lists+nbd@lfdr.de>; Sat,  7 Nov 2020 01:57:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2527B20125; Sat,  7 Nov 2020 00:57:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Nov  7 00:57:22 2020
Old-Return-Path: <song@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 21A582031B
	for <lists-other-nbd@bendel.debian.org>; Sat,  7 Nov 2020 00:41:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KQ4JvUdGT1Gh for <lists-other-nbd@bendel.debian.org>;
	Sat,  7 Nov 2020 00:41:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9E12020318
	for <nbd@other.debian.org>; Sat,  7 Nov 2020 00:41:22 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6DE20221FE
	for <nbd@other.debian.org>; Sat,  7 Nov 2020 00:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604709140;
	bh=KcpIPe+A58yFNxxgdAdaS3ugXYdHOBtuseeQrVYguHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O7dyOXal7YL7+3TQPR507WAWXuCRa9VXvh3tl/XZ3Wmey5p91Ew7PyDj8k/tZUsUX
	 XY5D3+3MbK8y+gvrbaa+8QamA+h71zwFvUqQhxnEoaqEjETZ+k6/bM4uDXaudNmc1c
	 Llst5cl3Ll69uQ67EfsvLxy48UchXaU9XWGm+pGE=
Received: by mail-lf1-f46.google.com with SMTP id e27so4360424lfn.7
        for <nbd@other.debian.org>; Fri, 06 Nov 2020 16:32:20 -0800 (PST)
X-Gm-Message-State: AOAM530LOsyB+aPY/UE6LT4sc3SNwDVNq3SRKtaqKTnoYwYd9CwHNsRI
	w8KxdXwsNj8PWVRiFMRMi78QD7bNB7D2kLZEex8=
X-Google-Smtp-Source: ABdhPJzPKJgvb0YpcBOATticPbEhSqNhkf0gjO34lXWldMg14DmOELWQsnbdEhjrrSsS6KPE2QcSxjJkDLUT8kUmj4w=
X-Received: by 2002:a19:ae13:: with SMTP id f19mr1682538lfc.193.1604709138508;
 Fri, 06 Nov 2020 16:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-22-hch@lst.de>
In-Reply-To: <20201106190337.1973127-22-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Fri, 6 Nov 2020 16:32:07 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6GuXe_2YKnP5wRHg7ytOxjUzTQZ=fG2RKxs6woNVPFaQ@mail.gmail.com>
Message-ID: <CAPhsuW6GuXe_2YKnP5wRHg7ytOxjUzTQZ=fG2RKxs6woNVPFaQ@mail.gmail.com>
Subject: Re: [PATCH 21/24] md: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com, 
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_1PsI2UjgQM.A.BiC.yDfpfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1039
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPhsuW6GuXe_2YKnP5wRHg7ytOxjUzTQZ=fG2RKxs6woNVPFaQ@mail.gmail.com
Resent-Date: Sat,  7 Nov 2020 00:57:22 +0000 (UTC)

On Fri, Nov 6, 2020 at 11:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

