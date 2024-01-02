Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A782251B
	for <lists+nbd@lfdr.de>; Wed,  3 Jan 2024 00:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2D4AF204EC; Tue,  2 Jan 2024 23:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  2 23:00:13 2024
Old-Return-Path: <jpittman@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 38BC020C67
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Jan 2024 22:43:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.726 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.066,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o7B2TzuM2nwH for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Jan 2024 22:43:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id A391A20A44
	for <nbd@other.debian.org>; Tue,  2 Jan 2024 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704235389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBOv2jm2vjkJK88t9NbUPVCUIzSLH16o/dGCZ37tOWs=;
	b=VSoP2M6YQrwpBVDEQTMZ6thIz9Yc/uFPnr9hJUaP9gnbXnrJLLXpSQHSRvl5Yn0e8nGxmd
	zjtVp4uUwoJOUlWe6nQBe+3ewjEF22psDpD3lkdP8eqxSHfF01uWC5/LiDIK4Nfc17H7RB
	WV38031hWd8ig8Dd+EX/I771Xj6+1SI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-P77eQT5iNkS1EvpDKTCsig-1; Tue, 02 Jan 2024 17:11:56 -0500
X-MC-Unique: P77eQT5iNkS1EvpDKTCsig-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5e9de9795dfso166195597b3.0
        for <nbd@other.debian.org>; Tue, 02 Jan 2024 14:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704233516; x=1704838316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBOv2jm2vjkJK88t9NbUPVCUIzSLH16o/dGCZ37tOWs=;
        b=b4Of6/931vAo4najgZeyd1in15oGsozmbM6BBsNDzXMU9f6l+N68khVC+sty2rztqI
         /BVJkWmhouZ0kjXvFrR5uftwSNt+7jUogYA/P4oQA2CzID54d/iM0klmiF13tpABTyba
         jsc6HArnMPwwcXvDBvZYifHdtu93lhG9LNb4qpkVrVxRtUffWGLXGjQ6802sF0Hg3obx
         /rujinvVfry18lg0WIOtlWj7hqapUdU6EkPTSFX0nX2UpkQXIBnyrqCN30yZ1wOGwACS
         D9M0GKn/zQYllwNp3AryImOTXhMAuPH3a68R407DTXF0l3Eo6olgBqKMN2VeZg8qv7i6
         ldEQ==
X-Gm-Message-State: AOJu0YwOwg31Q3ngEnO+aeUb3KUZVtrjNzaHlkz3FFwGUsQ6uYS4S667
	fGitRhtQ8Pkwi7O4GnecizQF9npSkGrZxrsHpCAD/Kd49HGcKp/EUW3MsvlINXdbqaIq83KpPsn
	x99dLY284ffS9PQ9vwu6+PYa5gmsgjLtghMjZQQ==
X-Received: by 2002:a0d:e615:0:b0:5e7:5246:8f7b with SMTP id p21-20020a0de615000000b005e752468f7bmr10650782ywe.79.1704233516171;
        Tue, 02 Jan 2024 14:11:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnz4shpbyeonHylop6FDEDEEVcbaCqR7iBp2aclsXjzz7g8rllaGLNWxCJxvlxS1qvAvVXIZDM72VDn9UiZCA=
X-Received: by 2002:a0d:e615:0:b0:5e7:5246:8f7b with SMTP id
 p21-20020a0de615000000b005e752468f7bmr10650769ywe.79.1704233515934; Tue, 02
 Jan 2024 14:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20231228075545.362768-1-hch@lst.de> <20231228075545.362768-4-hch@lst.de>
In-Reply-To: <20231228075545.362768-4-hch@lst.de>
From: John Pittman <jpittman@redhat.com>
Date: Tue, 2 Jan 2024 17:11:19 -0500
Message-ID: <CA+RJvhwg3YXAzSk81nMGw=_3OMo6P=XcXBUFUAXSBcyXH6gkDg@mail.gmail.com>
Subject: Re: [PATCH 3/9] block: default the discard granularity to sector size
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Josef Bacik <josef@toxicpanda.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Coly Li <colyli@suse.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bLM8RhCCPFE.A.yeH.9VJllB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2704
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CA+RJvhwg3YXAzSk81nMGw=_3OMo6P=XcXBUFUAXSBcyXH6gkDg@mail.gmail.com
Resent-Date: Tue,  2 Jan 2024 23:00:13 +0000 (UTC)

Hi Christoph, is there a reason you used 512 instead of SECTOR_SIZE
from include/linux/blk_types.h?  Thanks!

On Thu, Dec 28, 2023 at 2:56=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Current the discard granularity defaults to 0 and must be initialized by
> any driver that wants to support discard.  Default to the sector size
> instead, which is the smallest possible value, and a very useful default.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index ba6e0e97118c08..d993d20dab3c6d 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -48,7 +48,7 @@ void blk_set_default_limits(struct queue_limits *lim)
>         lim->max_discard_sectors =3D 0;
>         lim->max_hw_discard_sectors =3D 0;
>         lim->max_secure_erase_sectors =3D 0;
> -       lim->discard_granularity =3D 0;
> +       lim->discard_granularity =3D 512;
>         lim->discard_alignment =3D 0;
>         lim->discard_misaligned =3D 0;
>         lim->logical_block_size =3D lim->physical_block_size =3D lim->io_=
min =3D 512;
> @@ -309,6 +309,9 @@ void blk_queue_logical_block_size(struct request_queu=
e *q, unsigned int size)
>
>         limits->logical_block_size =3D size;
>
> +       if (limits->discard_granularity < limits->logical_block_size)
> +               limits->discard_granularity =3D limits->logical_block_siz=
e;
> +
>         if (limits->physical_block_size < size)
>                 limits->physical_block_size =3D size;
>
> --
> 2.39.2
>
>

