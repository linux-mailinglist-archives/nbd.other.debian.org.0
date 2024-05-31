Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2298D5E2C
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 11:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9C5112057A; Fri, 31 May 2024 09:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 09:27:09 2024
Old-Return-Path: <idryomov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B76B8204F1
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 09:09:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.801 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5fej-htWgPZl for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 09:09:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-oa1-x2f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1D0E920478
	for <nbd@other.debian.org>; Fri, 31 May 2024 09:09:03 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-250932883daso121893fac.1
        for <nbd@other.debian.org>; Fri, 31 May 2024 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146540; x=1717751340; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7TiTdx/nEWXXgHHbHN78B+YsjlKDnX0w9LWVG0G2x4=;
        b=aN+6Um60iUgOX9SQ7w1wXeXiE0NERrQGmiKqZLZPgdvylxTvznCpdBuzqLh9nJhG4o
         AWGsFPvIVP0BSwY38i1NQc8sBx+dXW1iC47tLizhsfU/rpFIiTLA/mqziwPRzzR9Zbxd
         G/Zn5iClOFKLfyszAF83XeGn+nHuzZa4g3FPvdjTSvlgrH7tn840dFYYAGfXfG0S3SDD
         4CBSrO4VXM/kXpvt8nVWKJWbsT/ReQQnR/JG9jkAnJy5luc74xhcRDlRf50p402gdRfG
         srKYrf4Vytw8C89WKO9VSlm+KdEcjrsLQLs2MgGnuZMciXzSE1KVtVjR8WFYtOVrvY1R
         ESOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146540; x=1717751340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7TiTdx/nEWXXgHHbHN78B+YsjlKDnX0w9LWVG0G2x4=;
        b=qnuGIxsxRIg5XNWu1bqkj9CA7SSpNOJBp2fVv8/p6Sb46AN9KuiVY0ImJ7pospIy1A
         8HzJb0IEztJBMZB2Aw7UVysVWo9kjmV9r6LTz/b1Al4qHFk+OHMfZM2Ezi9KIFeY4FGZ
         WXVA/I5Vimv/7pS/IsqTqO3xnf610Qnl4Wauve6IW6k2DEiM8yvwlyEmIc2gHnS+gcA3
         6Ky38LYDRaKWlEHsSPUxaUo13sKLHZiggzL0mzpPiQzDBNwNghT/eLviVI9vPGKDfH6z
         CG0TeJwk6fZ9JbDuhL9Uh5FIopk2LeF2UMUARoPz+wjpJDfnv3MzJYrj9chZhbL9kXKN
         cdlg==
X-Forwarded-Encrypted: i=1; AJvYcCX9ULzWFJFs3mlAfX+MbVJW1izp2GQF9ZMRcf3wwhxrfs6RGj8LiEZw/yEpmIwbKxY1DP5DwRGoA+SB91AcoqgrKIAzCA==
X-Gm-Message-State: AOJu0Yz7javNYggR5e8ElKSXhTFDOvt8VRrAFIUpt1A1GEe9f6cx8t0h
	MZnxMNE9Frr7QuaiueTNx1qxssU1NbiaPEPA15Y88c+0lZYQurR04K/Zp1p2VR7xbn8VLDhKepI
	ub4ipD6+xp3+x/E5ODVdUVeWcoO0=
X-Google-Smtp-Source: AGHT+IHoKiJiwn0RUfGlBR1LOXIQjJEAP/TieA174CPldpRPuDqgZrspO+vxp9UsllxKnQz9RUjusbGg9aknaFlS5Ec=
X-Received: by 2002:a05:6870:9346:b0:250:6422:86a with SMTP id
 586e51a60fabf-25065b70997mr1985845fac.10.1717146540364; Fri, 31 May 2024
 02:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240531074837.1648501-1-hch@lst.de> <20240531074837.1648501-4-hch@lst.de>
In-Reply-To: <20240531074837.1648501-4-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 31 May 2024 11:08:48 +0200
Message-ID: <CAOi1vP_mY-a7aiWod-eVz8xuhGz4mHBBoZZgr2FoxS5wVUym3w@mail.gmail.com>
Subject: Re: [PATCH 03/14] rbd: increase io_opt again
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
Resent-Message-ID: <PZk95n5FGJM.A.znbK.tfZWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2872
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOi1vP_mY-a7aiWod-eVz8xuhGz4mHBBoZZgr2FoxS5wVUym3w@mail.gmail.com
Resent-Date: Fri, 31 May 2024 09:27:09 +0000 (UTC)

On Fri, May 31, 2024 at 9:48=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Commit 16d80c54ad42 ("rbd: set io_min, io_opt and discard_granularity to
> alloc_size") lowered the io_opt size for rbd from objset_bytes which is
> 4MB for typical setup to alloc_size which is typically 64KB.
>
> The commit mostly talks about discard behavior and does mention io_min
> in passing.  Reducing io_opt means reducing the readahead size, which
> seems counter-intuitive given that rbd currently abuses the user
> max_sectors setting to actually increase the I/O size.  Switch back
> to the old setting to allow larger reads (the readahead size despite it's
> name actually limits the size of any buffered read) and to prepare
> for using io_opt in the max_sectors calculation and getting drivers out
> of the business of overriding the max_user_sectors value.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 26ff5cd2bf0abc..46dc487ccc17eb 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4955,8 +4955,8 @@ static int rbd_init_disk(struct rbd_device *rbd_dev=
)
>         struct queue_limits lim =3D {
>                 .max_hw_sectors         =3D objset_bytes >> SECTOR_SHIFT,
>                 .max_user_sectors       =3D objset_bytes >> SECTOR_SHIFT,
> +               .io_opt                 =3D objset_bytes,
>                 .io_min                 =3D rbd_dev->opts->alloc_size,
> -               .io_opt                 =3D rbd_dev->opts->alloc_size,
>                 .max_segments           =3D USHRT_MAX,
>                 .max_segment_size       =3D UINT_MAX,
>         };
> --
> 2.43.0
>

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

