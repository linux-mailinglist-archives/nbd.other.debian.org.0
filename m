Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 704041D1285
	for <lists+nbd@lfdr.de>; Wed, 13 May 2020 14:21:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F03C220354; Wed, 13 May 2020 12:21:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 13 12:21:08 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E14F92022E
	for <lists-other-nbd@bendel.debian.org>; Wed, 13 May 2020 12:03:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7jY-iW96Uevu for <lists-other-nbd@bendel.debian.org>;
	Wed, 13 May 2020 12:03:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-wm1-x341.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5C39520326
	for <nbd@other.debian.org>; Wed, 13 May 2020 12:03:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u16so28163590wmc.5
        for <nbd@other.debian.org>; Wed, 13 May 2020 05:03:16 -0700 (PDT)
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k3fs1BLKtzG099u3CgLy58/9ILkEABhBTm9A+LIuHXM=;
        b=pT6qYxmGM2SoowfqRAm4b6ZnL3452CJrFvZI/ZIDevCNNwTc9daFMYFtuwXvHt/hfD
         r3DVttTh8Xkmo1xktXm7NEQxIbmXapQ+fnlIIfltRZNF9fDGrXny/1bOfwJ6vU825oRN
         HDCHJwzMOs3UdZHxcdSacst1Xk+tH8bIm+kolpMWTGvDg+Tzw1+1tfZZ7eJruoEVyNXs
         lbkoAp/jGc9XmtEbTjDXG0I7Y4p20mzr3QSohynmWUDEeUHMzHKbNqnH1MZg1S73jJnf
         4r07ynb2UkmmMxF/zbdTer9AisCOZSLz0GNTjoG0VnJtfl7GtFpy6M1TxhbNaQh6l4LA
         kBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3fs1BLKtzG099u3CgLy58/9ILkEABhBTm9A+LIuHXM=;
        b=Qis8/uL0dBUWYj11z7zKqh52EBCoZn6e/7to38G8v0E+PX9vzJ+8l3j7/Z+ZFbI9OK
         tUpJJ42V0rKBjxGmwkMOTQ6x6wbXE3ZQGZJNHKFjFRaCWgE0X7rwnIPkqaNckmoEcemY
         //SvfPWsfn5zHQbeKQgUrEqvmxPTvzUkn3+MD0kzycbmkcqCuNhLYgg9ZSV7D77AZUVa
         RNLpVUsat42PxVCXbCKmjTDQRPa2qSdbg+Dr6TlhZeje0c7RnpeXBFFLA/wKi0+5psnj
         /9letkhBGAud5UgCx9XqDLnvPbOwOG2Z+i9ksHM2y1Ib4TdAhqR7rSUh3GtB8Y1Geiro
         r3Eg==
X-Gm-Message-State: AGi0PubSbwSiTLHgnpmJ59ECL+KO9DU8ESlA6VIRhvV9+kjLpfhtIXNA
	iBTWaN9tG0zRVoPQgvdDNq0qQMuu5C+YjHfO7BBPuw==
X-Google-Smtp-Source: APiQypLVIruiKQj5MuhzcA9Z8EW2j/28PcQzLLRZavdzT7l0kjnkHZOIDtgZxdFzMRDiltXJlgLQMWnUxNp/7s9gnjM=
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr33555929wmf.188.1589371394083;
 Wed, 13 May 2020 05:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200422090018.23210-1-houpu@bytedance.com>
In-Reply-To: <20200422090018.23210-1-houpu@bytedance.com>
From: Hou Pu <houpu@bytedance.com>
Date: Wed, 13 May 2020 20:03:03 +0800
Message-ID: <CAO9YExsLF_SveFp38yqz66HOtmM5xgRAFxLE88eqXJjitO684Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] nbd: export dead connection timeout
To: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <t_nUwLwMKxF.A.GfG.0Y-ueB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/877
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAO9YExsLF_SveFp38yqz66HOtmM5xgRAFxLE88eqXJjitO684Q@mail.gmail.com
Resent-Date: Wed, 13 May 2020 12:21:08 +0000 (UTC)

Hi Josef,

Would you like to accept these patches?
(Just in case you missed this thread).

Thanks,
Hou

On Wed, Apr 22, 2020 at 5:00 PM Hou Pu <houpu@bytedance.com> wrote:
>
> Here are two trivial patches:
>
> Hou Pu (2):
>   nbd: export dead_conn_timeout via debugfs
>   nbd: set max discard sectors in the unit of sector
>
>  drivers/block/nbd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
>
> Thanks,
> Hou
>
>
> --
> 2.11.0
>

