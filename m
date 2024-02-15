Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 82453856AA3
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 18:12:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4E93D20711; Thu, 15 Feb 2024 17:12:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 17:12:13 2024
Old-Return-Path: <ulf.hansson@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9C68620712
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.79 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id H1ol9723n0l2 for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 16:54:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linaro. - helo: .mail-yb1-xb31.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1F19F20713
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 16:54:22 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1891596276.0
        for <nbd@other.debian.org>; Thu, 15 Feb 2024 08:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708016059; x=1708620859; darn=other.debian.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEQiCmvhKfS0/A0znECfTzFjRTV/dZsqotvM6rEKanU=;
        b=G8G3WlLouiuspMXy71ZoKlMr7Dan4NSDiitrxmNURcNVKKAG1T9UhkJ65KdWoIvKcV
         OPILhiZybOV0VwdA4iRW2TKTwxGpzwxhfKL2UiKc2OI7snw65P/U1WyI54fsbdwUQ+cJ
         wwCVWOf8jAwu8fJWaGJxMYHHHinH6nnMyaX/8Uj/AaVqj2G9F+2mWN/yUeM5TPI0Ohtj
         zrtTcnT4W0ctbfCCPNG/OjgtdlT77jAJ8v/pz6FYmWe7Tpi1PUsc6e5J1+KtKMRjFg10
         l2BbWJd+NTOf87tbPiAMgm5i47glzKYLlHsweYp3rOuBaWXJTQkCrQvAiaZ5I2NwyASA
         ZAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016059; x=1708620859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEQiCmvhKfS0/A0znECfTzFjRTV/dZsqotvM6rEKanU=;
        b=Ncjr9rVI6cs5fR8ClpGHdpPstECKge+AecaZCy42uW9AfD5hQbz7a7chhHb7OLdYcf
         gsl5SDYfHQBQOIU/ShqHFQ5mwStFhFDo8tEIeVGViKuejfdgqD0dChqR8/H5+7spE6g7
         wo4haudwXZV8zegp0XTantmBcQBl10OMJ2H/siREmWxOzqF+EAk9LmZHDlu00U8PJNqF
         geuOXfsl1hev+1tUKqBmpE4D0U1do2e2CBAqOAZycYqv4v9FyzxA2xHsY2juB3udinjw
         fAcw74cqmoFQ9AlgIk3cB/zn6Th2LTT4GSjBSJ3OZ/jEc6L6QGuYlxUhTlmPeYa61sWn
         Kibw==
X-Forwarded-Encrypted: i=1; AJvYcCXsx/1pOAdniVU4VKj8TTmTBgAQmkqjnB0ty0F2gM4QKMR0ybvT1Sed6rnAz96DRVRVmPc1S9Qf6ZxZeVdE66dAte3wZA==
X-Gm-Message-State: AOJu0YxUPz9LwMP9iFEdKJiDtJIesYsi95Nbs8p2vcV7RRT7LrnL248k
	dVAh/AqzpgulpXlUNgmJFx5u+n1pcMB4YbQlaIhdzEugLhmYVmUsM6WMfbTsFJ9AZ5Sd+/bPei4
	941bIStLrSRXzus9JAdspSqM5jeXl/uU4cvNvSw==
X-Google-Smtp-Source: AGHT+IF28WiAUAxb9BXDQ9j656YBYmKEubg2qRwCcoIKEiRoMN+j/rX1+ioqB8yOfGTSrxa8mYZDRwHKLR7BN/dl2kA=
X-Received: by 2002:a81:b717:0:b0:607:c65a:ba02 with SMTP id
 v23-20020a81b717000000b00607c65aba02mr1752372ywh.17.1708016059449; Thu, 15
 Feb 2024 08:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAPDyKFqPnC9jwWnoVz+UVJJ_SGYnB4CrB8jmJOSxCnT7AYQrKg@mail.gmail.com> <20240215164942.GA19722@lst.de>
In-Reply-To: <20240215164942.GA19722@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Feb 2024 17:53:43 +0100
Message-ID: <CAPDyKFpSNL28sWqNMY9Y2+tP9VMd_Wabnw1hVjQ-g0RfKCUVgQ@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oyFhUPAv3uI.A.ZVE.tXkzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2746
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPDyKFpSNL28sWqNMY9Y2+tP9VMd_Wabnw1hVjQ-g0RfKCUVgQ@mail.gmail.com
Resent-Date: Thu, 15 Feb 2024 17:12:13 +0000 (UTC)

On Thu, 15 Feb 2024 at 17:49, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Feb 15, 2024 at 05:40:37PM +0100, Ulf Hansson wrote:
> > Looks like $subject patch, patch11 and patch12  have already been
> > queued up as they are cooking linux-next. Normally I prefer to funnel
> > these via my mmc tree, to avoid potential conflicts (mostly for mmc,
> > where more active developments are ongoing).
>
> None of this is in my fresh linux-next pull, which would be rather
> surprising anyway as I've just sent them out and Jens isn't that
> quick to merge unreviewed series :)

Weird. :-)

>
> That being said it depends on prep patches in the block tree and thus
> I'd prefer merging this entire series through that tree.

Okay, in that case, np! Next time, it would be nice to get that
information upfront in a cover-letter or similar.

If not too late, feel free to add my acks on the three patches for mmc
and memstick.

Kind regards
Uffe

