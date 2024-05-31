Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B6E8D5E2E
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 11:27:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 82CC320577; Fri, 31 May 2024 09:27:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 09:27:20 2024
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
	by bendel.debian.org (Postfix) with ESMTP id D33E42053C
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 09:11:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.801 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VLhRd_VSXVkH for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 09:11:16 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-ot1-x32e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 26DAF204F1
	for <nbd@other.debian.org>; Fri, 31 May 2024 09:11:15 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6f8d0a1e500so1357429a34.3
        for <nbd@other.debian.org>; Fri, 31 May 2024 02:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146672; x=1717751472; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHySJ52Pl0hABImbEf8CzUryCpcO6Vzdug5aWyPJAWM=;
        b=JIGrCVZIt+fK0qAYfNmOrITViuWTUGa3RlOd8PG9/M262pQWmPzHyI5rpujA2XDSc6
         r0JaGWAYkZOaz03fcEfZs9vXv0D2q69Wx5VRkY9l1hrLQV6ljLj4I/unVjn20XTh9Qpl
         XL5040C0/Er3wHD6OYGdw3W+ECJe5aSZxu00fMxZAzEfyBIfW0BoZcZjBNEsEv18xtdf
         +x3t6tjYeVzgc0gqZ+I1gnmHYhVnom7nztG9wORCXRJn2RvEJRDCDXNSjRfd2jF7W+hk
         K0kNpLziXkwn0eGpzEW33kxKbUmYN5syC4UY5XTnA8mngXeQbWEkuef0ihrTMRpsIVSm
         8qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146672; x=1717751472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHySJ52Pl0hABImbEf8CzUryCpcO6Vzdug5aWyPJAWM=;
        b=nyNsEv67i/kz/2kfhyh823YumUcqSCTv3nSm+/BJcOuPQ8Z+4iSL68DC+jBcrsX5XV
         xHU4uA1H4tCsBOsIm3sLSblq19VJMdUZf90TyK1TkvelT8+XE/t1bhWlIrzBwzbi+gsF
         C8yVm2VkNXVo++WNmeGJUXsQ6hEsm1nS6vU032qYr87esbuKPoK7aVuPbSFXYqDcDxVU
         zHf0ruld6Z5jDqdcOpPFpa+8lZ8xKnSFXuk/znHwEuv2p+3LcOlpUw5xk1ylgHGVpEjb
         Mc8OURr62mpZNKuRR2Cl72/zVuILtC6DC/Je4BbACSFLMcT2wFO2+utAjKbVDj1b1KWf
         fR8A==
X-Forwarded-Encrypted: i=1; AJvYcCUd4Gl4zOxKVzgmrzKCUzjK2qpONdiyZgiQHDIaQ+eiwqXc7Mddix6lud32RwEWwEt9E8lTXn4FLsDSRfRrJLdvS5x2jA==
X-Gm-Message-State: AOJu0YyhjiX+Zez6n7OBy647i/5jhpBL+eDdECtVDWQT9P378eVKXxEB
	RkVrcWZ/0eNBM90uET7aGY64rmwJaf288hG1+xiorX4urEdhaMsEHxl3mAyHpvbldZt0JvRtXA9
	+Njaf8wAR1fESqLEdljhE8MjNkPo=
X-Google-Smtp-Source: AGHT+IGvsAs1mcJwvgWnNqWcEhu7b6x8mgHTIAZ0GzBV17r0EcNcgsUewUXES03iA8vPcRMr9oo8aonYpNodLH6h808=
X-Received: by 2002:a05:6871:339a:b0:250:75cd:34f2 with SMTP id
 586e51a60fabf-2508b99ababmr1494585fac.22.1717146672346; Fri, 31 May 2024
 02:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240531074837.1648501-1-hch@lst.de> <20240531074837.1648501-5-hch@lst.de>
In-Reply-To: <20240531074837.1648501-5-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 31 May 2024 11:11:00 +0200
Message-ID: <CAOi1vP-+j-RHLmnDLpsZREnYb_f7QGGhRC9YOgctsFNuE7yM3Q@mail.gmail.com>
Subject: Re: [PATCH 04/14] block: take io_opt and io_min into account for max_sectors
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	Dongsheng Yang <dongsheng.yang@easystack.cn>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, 
	Bart Van Assche <bvanassche@acm.org>, Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Sx8rz4bu7qF.A.ZtbK.4fZWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2873
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOi1vP-+j-RHLmnDLpsZREnYb_f7QGGhRC9YOgctsFNuE7yM3Q@mail.gmail.com
Resent-Date: Fri, 31 May 2024 09:27:20 +0000 (UTC)

On Fri, May 31, 2024 at 9:48=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
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
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  block/blk-settings.c |  7 +++++++
>  drivers/block/nbd.c  |  2 +-

For rbd

>  drivers/block/rbd.c  |  1 -

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

