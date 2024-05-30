Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF078D52C9
	for <lists+nbd@lfdr.de>; Thu, 30 May 2024 22:03:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A953520505; Thu, 30 May 2024 20:03:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 20:03:46 2024
Old-Return-Path: <idryomov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AD5492050C
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2024 19:48:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gVa1nyal2fb8 for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2024 19:48:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5B18120509
	for <nbd@other.debian.org>; Thu, 30 May 2024 19:48:22 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-24ca0876a83so664872fac.2
        for <nbd@other.debian.org>; Thu, 30 May 2024 12:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717098498; x=1717703298; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41y1G1yWB6PRjXPqqWESihB4DpKvKPtS6LjA52lk1aM=;
        b=WRbvjNg2MOBBMUVuvb+/T3Y/UZZi8Kxrg2ekKNso96f7RODyPVZOwoax7MCowMQnVB
         hGojIKj/5z40NoQiF4duHCpG8ykW/bYigmMzavC3G4zzUTzDFhujU6RWoiNlU/hEjxWG
         InTn2Z2v9uLxl0LylcwbuPsKWYkGe6LzKgCRqu89Q2L9pPL2DVtYcf5BVCXErNiqae6h
         in66p4iZdibjHQxmk6C2B/UEO6+AdgE1vED1h43Bj1+MBXBc47ruqIJxeiMg6Ub1tKZf
         zM7ThvPWAjt6O33On4ak9icVQbtyMzOHv4t5LVGE3IOPB/vlQOIbg3zLyHfpD3Aos5GJ
         IyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717098498; x=1717703298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41y1G1yWB6PRjXPqqWESihB4DpKvKPtS6LjA52lk1aM=;
        b=Zhy6M4hYTw1r80dq0haRIKVFHWR2P3iI+fr4SiMQrFwcClEa4ROvyWzZVGbAJ+jFsL
         gPPm+vWVkGiHbjWAhfOhsYdxhu6NZ43joDKayskAqRpDUdYyl7bqPUlVomwg/xeCtV0g
         ZdPvGkV2D33BnnfrpdTNEK9nRlWXq0Dj5zscpCOkj/BogRvKpfl+CaMPiHzbgx6WlMlA
         LdtWiJ+jiHuDVdzMu0tfbNc27N9DxxsUgt0jKO57cdSCFoko3817cY3lcmeUMYZzWUQY
         e++prSwQ3EGOOqyyObuw776r441npkfw2JzDhajmEQd2gPfhOqh5ZkzuABYAzYVYqv/8
         6/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVUa98xsHqZHPJkR5icRlvE/5OvRvNgap5x92WbPlC8MwarF5ZL6V5uqtJMxK4dlqzW/NCA7Rd4UKAP0zJYBhT9ttWodA==
X-Gm-Message-State: AOJu0Yw41LEzcEKqteKqpO0HEebIgJ7GNKa31d3AoVVYeU6a3E+gP76v
	B3b/q3FZVhGy8LrZayOgECpa32PVubnqN3H82w1U8El7bcoBC66ukwebWUg7vlzF8qiwV/kizOF
	GgaLX/yRcY8+2rU24KiFMk77/l0k=
X-Google-Smtp-Source: AGHT+IGxcLZtvGZ8VsT8cGFEuW/elxJjHWgoM8RDpdS5UpADe97i5sefwnR8gwVFsz1jHFTWagn8cx64x4raaIJwd/s=
X-Received: by 2002:a05:6870:b492:b0:250:6f7c:495 with SMTP id
 586e51a60fabf-2506f7c0a24mr2683166fac.9.1717098498330; Thu, 30 May 2024
 12:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-3-hch@lst.de>
In-Reply-To: <20240529050507.1392041-3-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 30 May 2024 21:48:06 +0200
Message-ID: <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com>
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for max_sectors
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	Dongsheng Yang <dongsheng.yang@easystack.cn>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6wAfoYN7C0H.A.4neO.iuNWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2844
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com
Resent-Date: Thu, 30 May 2024 20:03:46 +0000 (UTC)

On Wed, May 29, 2024 at 7:05=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> The soft max_sectors limit is normally capped by the hardware limits and
> an arbitrary upper limit enforced by the kernel, but can be modified by
> the user.  A few drivers want to increase this limit (nbd, rbd) or
> adjust it up or down based on hardware capabilities (sd).
>
> Change blk_validate_limits to default max_sectors to the optimal I/O
> size, or upgrade it to the preferred minimal I/O size if that is
> larger than the kernel default if no optimal I/O size is provided based
> on the logic in the SD driver.
>
> This keeps the existing kernel default for drivers that do not provide
> an io_opt or very big io_min value, but picks a much more useful
> default for those who provide these hints, and allows to remove the
> hacks to set the user max_sectors limit in nbd, rbd and sd.
>
> Note that rd picks a different value for the optimal I/O size vs the
> user max_sectors value, so this is a bit of a behavior change that
> could use careful review from people familiar with rbd.

Hi Christoph,

For rbd, this change effectively lowers max_sectors from 4M to 64K or
less and that is definitely not desirable.  From previous interactions
with users we want max_sectors to match max_hw_sectors -- this has come
up a quite a few times over the years.  Some people just aren't aware
of the soft cap and the fact that it's adjustable and get frustrated
over the time poured into debugging their iostat numbers for workloads
that can send object (set) size I/Os.

Looking at the git history, we lowered io_opt from objset_bytes to
opts->alloc_size in commit [1], but I guess io_opt was lowered just
along for the ride.  What that commit was concerned with is really
discard_granularity and to a smaller extent io_min.

How much difference does io_opt make in the real world?  If what rbd
does stands in the way of a tree-wide cleanup, I would much rather bump
io_opt back to objset_bytes (i.e. what max_user_sectors is currently
set to).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D16d80c54ad42c573a897ae7bcf5a9816be54e6fe

Thanks,

                Ilya

