Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DD351408E3E
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 15:33:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB13320390; Mon, 13 Sep 2021 13:33:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 13:33:08 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 66849203DE
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 13:16:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JT8iARl1xdbp for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 13:16:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x632.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0C003203D6
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 13:16:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id jg16so20995038ejc.1
        for <nbd@other.debian.org>; Mon, 13 Sep 2021 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rWeksFHVv/N3BBTXS57Au30PQ+gFerRKB+duU6bbpYs=;
        b=BZAcKkAWqRe5t6YlfZN/02XhMygpevekag0MI3VThwlwzaVJtihNhT3k45T95dIrmb
         Z52bbZ6oYMf7TtiEf1+wA1E9SXPh2T0SuMjamHdbgYwdkVPiCDjOVj+5TzTy5Fw7klxZ
         93nN5Kcc6A5ill/efE47gUMx3Lkdg91tB8a1bUQQgYRpgRA/9HuiNbr/NnaMa8gygEDQ
         nxBjqe/WVJAGafBwiwQxn8X6ZDUU+Bj47T3EUqFd+JEL1cScjlQqueFfwcVpxjq+GM4p
         wbJ/vFfAe+0etII9itVi1/nbjk0nl6Qb20H1rRjZVMc++iK+AEeJbqoxYhcGT1gvxLMy
         ezHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rWeksFHVv/N3BBTXS57Au30PQ+gFerRKB+duU6bbpYs=;
        b=MDhrQ6heHdoaoc0jmHk+O+bx3ZZSRH44WpWzmyNaJnwL5EpHfB5dJAHm9xd9T2p+HB
         8A7y0haYSwZUuf8ko4MntT6PFTTy9Ul7ShNR1FfCVGbEmharDRwG921AB0z5cyHi5Sm1
         4FRKeMOlbXFHd22TVrSii9SfIrJXVYAB5djRnt2i08EIjZjnj3Z5Q9zSPnMY1D0duYli
         s0YJX/b4PVu11XcFlmypQ/KVPEcbfyWGIDeL7ZqcKeoBHH60qTiCXNaadhIIsFogJ8Ax
         dVPfd9vIduVbzYOUMv9/HftjjZxw8rZYyj3yBy+fE2ZzgLDr8hQ9oxibzSsQvDLWV8rV
         9PDA==
X-Gm-Message-State: AOAM530pDOKKXrt+dpKbbulQBUrKrFRU9faPBya/VuhQemm5/LKErk0G
	JEHyKOFQ7/lsQh93woY3Fx6KVMzELxRQ+CrRtk9q
X-Google-Smtp-Source: ABdhPJyEhcow43YHraovoI3/EQvYAmiJ1/x7jk3rb/fRJ8j4Kh3I/V+A78c9OYXpudrN4Zvb2ehn69X8hMm1XWc3FYo=
X-Received: by 2002:a17:906:ece1:: with SMTP id qt1mr12368702ejb.281.1631538998039;
 Mon, 13 Sep 2021 06:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210913112557.191-1-xieyongji@bytedance.com> <20210913112557.191-2-xieyongji@bytedance.com>
 <YT9EuMgnTQezWJSQ@infradead.org>
In-Reply-To: <YT9EuMgnTQezWJSQ@infradead.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 13 Sep 2021 21:16:20 +0800
Message-ID: <CACycT3v8i=quvDdG6i2YrsqqEKPL8Oa+Dr6AztijREYQpyZryQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] block: Add invalidate_gendisk() helper to invalidate
 the gendisk
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, yixingchen@bytedance.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LCs2fC0PmRK.A.6PB.UM1PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1443
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3v8i=quvDdG6i2YrsqqEKPL8Oa+Dr6AztijREYQpyZryQ@mail.gmail.com
Resent-Date: Mon, 13 Sep 2021 13:33:08 +0000 (UTC)

On Mon, Sep 13, 2021 at 8:32 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Sep 13, 2021 at 07:25:55PM +0800, Xie Yongji wrote:
> >
> > +/**
> > + * invalidate_gendisk - invalidate the gendisk
> > + * @disk: the struct gendisk to invalidate
> > + *
> > + * A helper to invalidates the gendisk. It will clean the gendisk's associated
> > + * buffer/page caches and reset its internal states so that the gendisk
> > + * can be reused by the drivers.
> > + *
> > + * Context: can sleep
> > + */
> > +
> > +void invalidate_gendisk(struct gendisk *disk)
>
> No need for the empty line.  Also I wonder if invalidate_disk might be a
> better name - except for del_gendisk we don't really use _gendisk in
> function names at all.
>

Looks good to me.

> > +extern void invalidate_gendisk(struct gendisk *gp);
>
> No need for the extern.  Also I'd name the argument disk, just as in
> the actual implementation.
>

OK.

Thanks,
Yongji

