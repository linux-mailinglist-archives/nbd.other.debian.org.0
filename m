Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391F85D40C
	for <lists+nbd@lfdr.de>; Wed, 21 Feb 2024 10:44:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D683A20E8F; Wed, 21 Feb 2024 09:44:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 21 09:44:13 2024
Old-Return-Path: <geert.uytterhoeven@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=CC_TOO_MANY,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EC1AF20E8B
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 Feb 2024 09:44:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.759 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FREEMAIL_FORGED_FROMDOMAIN=0.001,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vLXV00aZ4K9H for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 Feb 2024 09:43:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-oa1-f44.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4661220E8A
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 09:43:54 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-204235d0913so4058432fac.1
        for <nbd@other.debian.org>; Wed, 21 Feb 2024 01:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508630; x=1709113430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTOc5ufmZ/JRdQx/6tbCljAs5aqBkOn4kOQdynUVTFs=;
        b=ELAgb47Dd6P3bNVmR8VMRLJnBnsRc1B0I8uzed5fgqq8ADyVmb15SVYXMMZvH7DnM5
         YjBk5HCY/9l+qQJfMU0VAPGWioFuYID4afBKjd2Qw5eJN75fUSGG3Kk7Fk7zRjbh4wq6
         91r0pRR8uXm0TsBFwxcXdPrHIrbY00gthHvnaX2pw7+0JGezyNT5Yw71L1aI5II2Oggx
         7PLL5yJla9wSY1A+YJuN6LPts35KIQsNvzzrByCrqyTBc7xeI8OqmoaCfnJdMgEGQ1kj
         Kcm3su8eZ2lW6wtWShf2e8zH3smpM2LNElGpJ2hw2lAt2liTQCIK6mDU35ih1D/X35pf
         62lA==
X-Forwarded-Encrypted: i=1; AJvYcCWAkKWSMWj5crLzlniGKQmJS3tBCyC0pb7oXPj21D3iXCwc+jqmbs5KcDagl47+eZIpcYOmLsPtawwGPc8chvAXakJamw==
X-Gm-Message-State: AOJu0Yxr7nzq5WVgslvU1GZhe0ppaZ4/TMJeFrsm4fQVS0KbDKpPJ5U8
	OEC0CHdoTx2WQq91OW7zbcWsCdkbT6jpoD4eyiheqO6MatufAAmvVEsi0KYpdxU=
X-Google-Smtp-Source: AGHT+IEENWsMoNKVtc5l9Jnb8odh+lrlZWHERjdy2rd+QCgur2sycSIxoPOXRFTFhUqDB+6H25ZAjw==
X-Received: by 2002:a05:6870:40c9:b0:21e:a76f:2d66 with SMTP id l9-20020a05687040c900b0021ea76f2d66mr11700962oal.13.1708508630355;
        Wed, 21 Feb 2024 01:43:50 -0800 (PST)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id lv26-20020a056871439a00b0021a8332e6bdsm2285032oab.51.2024.02.21.01.43.50
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:43:50 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-58e256505f7so4386056eaf.3
        for <nbd@other.debian.org>; Wed, 21 Feb 2024 01:43:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzXHNnVjoVI2o86VPp31dm4siMiIEBTyIZS4QXcQAOFyesqsiBTMM9kYbgLzH3rlwUbzeFeJtxAVH2ozFAPYtcV6tqKw==
X-Received: by 2002:a25:accb:0:b0:dc7:3165:2db1 with SMTP id
 x11-20020a25accb000000b00dc731652db1mr15173023ybd.49.1708508272053; Wed, 21
 Feb 2024 01:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com> <20240221054424.GA12033@lst.de>
In-Reply-To: <20240221054424.GA12033@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Feb 2024 10:37:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVHvgVkZsmbsxkScDq+XzMLTONk3Cwmg2N_Rz_-qqWxw@mail.gmail.com>
Message-ID: <CAMuHMdUVHvgVkZsmbsxkScDq+XzMLTONk3Cwmg2N_Rz_-qqWxw@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9rVEzhx2wfB.A.7DD.tXc1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2758
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMuHMdUVHvgVkZsmbsxkScDq+XzMLTONk3Cwmg2N_Rz_-qqWxw@mail.gmail.com
Resent-Date: Wed, 21 Feb 2024 09:44:13 +0000 (UTC)

Hi Christoph,

On Wed, Feb 21, 2024 at 6:44=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> On Tue, Feb 20, 2024 at 11:01:05PM +0100, Geert Uytterhoeven wrote:
> > On Thu, Feb 15, 2024 at 9:16=E2=80=AFAM Christoph Hellwig <hch@lst.de> =
wrote:
> > > Pass the queue limit set at initialization time directly to
> > > blk_mq_alloc_disk instead of updating it right after the allocation.
> > >
> > > This requires refactoring the code a bit so that what was mmc_setup_q=
ueue
> > > before also allocates the gendisk now and actually sets all limits.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
> > queue_limits to blk_mq_alloc_disk") in block/for-next.
> >
> > I have bisected the following failure on White-Hawk (also seen on
> > other R-Car Gen3/4 systems) to this commit:
> >
> >     renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
> > 0x00000000ee140000, max clock rate 200 MHz
> >     mmc0: new HS400 MMC card at address 0001
> >     ------------[ cut here ]------------
> >     WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
> > blk_validate_limits+0x12c/0x1e0
>
> This is:
>
>         if (lim->virt_boundary_mask) {
>                 if (WARN_ON_ONCE(lim->max_segment_size &&
>                                  lim->max_segment_size !=3D UINT_MAX))
>                         return -EINVAL;
>
> so we end up here with both a virt_boundary_mask and a
> max_segment_size set, which is rather bogus.  I think the
> problem is the order of check in the core blk_validate_limits
> that artificially causes this.  Can you try this patch?

Thanks, good thinking, as that fixed the issue for me!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

