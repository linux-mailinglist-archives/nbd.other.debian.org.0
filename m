Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B97106B63DD
	for <lists+nbd@lfdr.de>; Sun, 12 Mar 2023 09:48:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 94985205A7; Sun, 12 Mar 2023 08:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar 12 08:48:11 2023
Old-Return-Path: <minlei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_FINANCE10,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 32AED2064B
	for <lists-other-nbd@bendel.debian.org>; Sun, 12 Mar 2023 08:30:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.702 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_FINANCE10=0.5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OKfqTaS8UFy4 for <lists-other-nbd@bendel.debian.org>;
	Sun, 12 Mar 2023 08:30:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 5BD052062D
	for <nbd@other.debian.org>; Sun, 12 Mar 2023 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678609820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTJUAFMiKw9YXPlS9lywYBNgOfv1YiKLGXLNoVp00UQ=;
	b=bgDzcsI60TIDbJ0Y3Gbw4FyR17xVSmXjgOn7F61iA5kI2GlF0OYPWdp0W8IS52oj9r+9vs
	loP7ttvl+B3xfm1kHo4FlByPFOhNVC/A+HFW6Snzv/7+eji/Va+eLRXgcXagOWxCQSPiem
	WiuaaQCrMEUFLhJlL+qECdyPtSAo0uI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-hQvys1WIPJuoBnR0jFs4mA-1; Sun, 12 Mar 2023 04:30:18 -0400
X-MC-Unique: hQvys1WIPJuoBnR0jFs4mA-1
Received: by mail-ua1-f71.google.com with SMTP id 93-20020a9f2066000000b00743dc8a5085so1527411uam.7
        for <nbd@other.debian.org>; Sun, 12 Mar 2023 00:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678609818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTJUAFMiKw9YXPlS9lywYBNgOfv1YiKLGXLNoVp00UQ=;
        b=qDAdBuQOdIsaH8e1W6jmGjBuJN8ZDB3mxtzl5qJVEijcmgd8RzHvtfCSO3bj5aa2Ee
         GD65ht7zZkT7tstt9GRoLAnD2LIKUWTBOfsf2WhxrC3IdhneouYSategecsDcRW+Zh+u
         TIfCB86b0z9p6YMd6/QPMFOixN17JoeE0NvV9ydvv+l53I7WUC/t1Sz/FU4+lN/8U56b
         v04PlFdiaPgYj6Anw7nE7KNYw9sYAP+zySPp/pYSSItrqKhPH2r82lfttUnwW00mGqG4
         nnyRrFui94W7Etdu21Ys5C3DjGYhgUSdzNT6pYmkoxrWEzNRCvkYPwFdeCwbYHRhSvvr
         ZcCw==
X-Gm-Message-State: AO0yUKXYCYwAUgxcAGo9pl3jcNU+1nmH89d35jWze/7Ne9/H7nyivNoM
	4q/cbqEfqYdM7vyGhe7PVSY9a0CnvS0IDZt58QqCmIx8T9Yw0+h5N+g1INqBAzHvvVcgQ269SxD
	wkmuu3dFhLVzqje0+Mu/L9AGVxlgZ/w==
X-Received: by 2002:a1f:5081:0:b0:418:4529:a308 with SMTP id e123-20020a1f5081000000b004184529a308mr18819942vkb.3.1678609818161;
        Sun, 12 Mar 2023 00:30:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/XxiUHqj7uZm7+uQmpQQmAFDztF4XwTwbAWzfBXxoaAKYWNuNGHKx1WneKNKQ2hYsmxYfu0s630gn5HA+5VLg=
X-Received: by 2002:a1f:5081:0:b0:418:4529:a308 with SMTP id
 e123-20020a1f5081000000b004184529a308mr18819935vkb.3.1678609817771; Sun, 12
 Mar 2023 00:30:17 -0800 (PST)
MIME-Version: 1.0
References: <Y8lSYBU9q5fjs7jS@T590> <ZAyAdwWdw0I034IZ@pc220518.home.grep.be>
In-Reply-To: <ZAyAdwWdw0I034IZ@pc220518.home.grep.be>
From: Ming Lei <ming.lei@redhat.com>
Date: Sun, 12 Mar 2023 16:30:06 +0800
Message-ID: <CAFj5m9KM1xbwPobvEYBmgotrU8s2jBQGcSQafJVJM+iQMS0pjA@mail.gmail.com>
Subject: Re: ublk-nbd: ublk-nbd is avaialbe
To: Wouter Verhelst <w@uter.be>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <b8NUCPk2F3M.A.fKD.LHZDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2384
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFj5m9KM1xbwPobvEYBmgotrU8s2jBQGcSQafJVJM+iQMS0pjA@mail.gmail.com
Resent-Date: Sun, 12 Mar 2023 08:48:11 +0000 (UTC)

On Sat, Mar 11, 2023 at 9:58=E2=80=AFPM Wouter Verhelst <w@uter.be> wrote:
>
> Hi,
>
> On Thu, Jan 19, 2023 at 10:23:28PM +0800, Ming Lei wrote:
> > The handshake implementation is borrowed from nbd project[2], so
> > basically ublk-nbd just adds new code for implementing transmission
> > phase, and it can be thought as moving linux block nbd driver into
> > userspace.
> [...]
> > Any comments are welcome!
>
> I see you copied nbd-client.c and modified it, but removed all the
> author information from it (including mine).
>
> Please don't do that. nbd-client is not public domain, it is GPLv2,
> which means you need to keep copyright statements around somewhere. You
> can move them into an AUTHORS file or some such if you prefer, but you
> can't just remove them blindly.

Thanks for finding it, and it must be one accident, and I will add the
author info
back soon.

thanks,

