Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939885CA8D
	for <lists+nbd@lfdr.de>; Tue, 20 Feb 2024 23:15:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DA7E3209F7; Tue, 20 Feb 2024 22:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 20 22:15:10 2024
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
	by bendel.debian.org (Postfix) with ESMTP id E4DC2209F3
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Feb 2024 22:14:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.759 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FREEMAIL_FORGED_FROMDOMAIN=0.001,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DY7mbL5BIhNM for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Feb 2024 22:14:51 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-yw1-f172.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 026DA209F6
	for <nbd@other.debian.org>; Tue, 20 Feb 2024 22:14:50 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-607d8506099so58234497b3.0
        for <nbd@other.debian.org>; Tue, 20 Feb 2024 14:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708467285; x=1709072085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0sB+Uiin6bmBbq+Qb6Q+WVmjY3s6JQXioTdgYqZKu0=;
        b=VPiEcPaLB9tW6ZQKBL5DaD9ey5nBI4QxeQJf9ajTlN7zcOvBr9lCz46stTPZmwENQr
         OieRGBqr6GNxO7LYecHZkpLasXDeoyHYxw6Oyh6dwIT5z49fTsep9gue64vvNEyE0Tx8
         dIeDDQbN8HIyHtdA4DR9pemMYuQx1l2xvO9AZNOuDXO1OOPzuSfbh/nA8g22c45x6OFE
         E9T4PPznM+tQpJmoypoqsIUQqORGnsFjC7qOI5+qcr6S8N7k33pykvsnrTRpCzdNgKnb
         n9Nt44PXf3Eoy8G49Un0VfNXBaDrkvDly8ujDpVs34kIUB1UvqJL+DZum3C3E7tfjzqQ
         oQGA==
X-Forwarded-Encrypted: i=1; AJvYcCWrBYYCSaZ8x8j4Rf7M51Pfgbcp8qHOtGTw7L0+cyD+6pLkWL25g4QW/fo+DaTLjn0y7i3tfTqgjzgMjTeiz0xMNCATow==
X-Gm-Message-State: AOJu0YzcpLmHXzwJEIKMAzDfklqgZRUMjR8unDJ0fE3SyyhA+m09JSSM
	voqmEjhctQgrzcODX982kZmA/+m0LNoi/QVyAr338UsrCM2E8U0eLAoGd3EqIK0=
X-Google-Smtp-Source: AGHT+IGoo37YCd5pa1aK7hhns9TuZNyLBM03+K0U1RWB6kTHMEI640d3issLziOCsz7k4KqmKLNsBA==
X-Received: by 2002:a0d:cdc2:0:b0:604:1917:369 with SMTP id p185-20020a0dcdc2000000b0060419170369mr16927414ywd.27.1708467285657;
        Tue, 20 Feb 2024 14:14:45 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id l37-20020a81ad25000000b00607fba01268sm2220208ywh.50.2024.02.20.14.14.44
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 14:14:44 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607dec82853so55496477b3.3
        for <nbd@other.debian.org>; Tue, 20 Feb 2024 14:14:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3LsWPBwa2eY41vBqA7dOGkOl9LPf3RMu+p1RcOGNjJmrABn2OIshUGrnJwAxmtCMjN1yH1NfODLXHIjpG9kXrokhwQA==
X-Received: by 2002:a0d:cb8c:0:b0:608:7bb8:9fb6 with SMTP id
 n134-20020a0dcb8c000000b006087bb89fb6mr417604ywd.32.1708467284625; Tue, 20
 Feb 2024 14:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
In-Reply-To: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 23:14:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwP747E4YaON9-YmGB6w=Aa6VgACRWX_QmYfTSB5RUKA@mail.gmail.com>
Message-ID: <CAMuHMdXwP747E4YaON9-YmGB6w=Aa6VgACRWX_QmYfTSB5RUKA@mail.gmail.com>
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
Resent-Message-ID: <s1_iaU9d8lG.A.wPC.uRS1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2756
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMuHMdXwP747E4YaON9-YmGB6w=Aa6VgACRWX_QmYfTSB5RUKA@mail.gmail.com
Resent-Date: Tue, 20 Feb 2024 22:15:10 +0000 (UTC)

On Tue, Feb 20, 2024 at 11:01=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Feb 15, 2024 at 9:16=E2=80=AFAM Christoph Hellwig <hch@lst.de> wr=
ote:
> > Pass the queue limit set at initialization time directly to
> > blk_mq_alloc_disk instead of updating it right after the allocation.
> >
> > This requires refactoring the code a bit so that what was mmc_setup_que=
ue
> > before also allocates the gendisk now and actually sets all limits.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
> queue_limits to blk_mq_alloc_disk") in block/for-next.
>
> I have bisected the following failure on White-Hawk (also seen on
> other R-Car Gen3/4 systems) to this commit:
>
>     renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
> 0x00000000ee140000, max clock rate 200 MHz
>     mmc0: new HS400 MMC card at address 0001
>     ------------[ cut here ]------------
>     WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
> blk_validate_limits+0x12c/0x1e0

Actual capacity should be:

mmc0: new HS400 MMC card at address 0001
mmcblk0: mmc0:0001 G1M15L 29.6 GiB
mmcblk0boot0: mmc0:0001 G1M15L 31.5 MiB
mmcblk0boot1: mmc0:0001 G1M15L 31.5 MiB
mmcblk0rpmb: mmc0:0001 G1M15L 4.00 MiB, chardev (245:0)

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

