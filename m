Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CAA408DEA
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 15:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DCA6F203C2; Mon, 13 Sep 2021 13:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 13:30:09 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DAEDD203DE
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 13:14:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id f2KeIM_t_bvf for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 13:14:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ej1-x62c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C6683203D5
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 13:14:51 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ho42so20959876ejc.9
        for <nbd@other.debian.org>; Mon, 13 Sep 2021 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMkvd2XitPzUDN1Wycio35V+4AIrXPwaQ/vDiDQjWK0=;
        b=KkDyl0Ifgt2aRdU6fbVozbKCUgJd/sQ+d+HyOCqH4KPJRHGcw+Ijbd628Lazz2zf13
         qfRssLX/YJgrq2MdmqVIbqdO5W7n8DZIy//VSqNG96Dyas/9Xx+m/1jqNvflyr0zJ3ai
         KlRQWR/v4kOWDOeP7VCI2n+5QcknY3SRD1mHmXWR0+I+ES+jW0raqwthvhg4bjKktVnW
         aXaf+bMgQq52xezeLd3KA5ugo4URLNlBOYN66C91lBa9m5i5i0GcnHX2zxZevyg3wtEi
         ZH0QG2au97VLX716H+2FpPBIQ3LKAK2X++0gDjVwXny2BdB6n6K4KnFYcc5TXOplqJ7F
         ohAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMkvd2XitPzUDN1Wycio35V+4AIrXPwaQ/vDiDQjWK0=;
        b=JcsjnG5Xxpw7AmCEcK+yJWCHArh/MguCYyd4yhjVZfhNUx2PHMWf+qBYKRNYlfOtbh
         1rYTTj/JfxKvmIgUoVch9eP1SmrBID7Ko78VmnVTaz2TP1MVSlIetgOihgZf7g9CacEn
         3UzzBFRD+cEmr0PUoq4mxjFalFlMSr/hh6TvFRZEPg12MVV4fhz1C85er2P56nqdzZXT
         gi+/F5LYredha3lhHXqbYbz15OZl+OhvuH7lrUyH40d3/s/isr7BsSiui+SkMSFnGozb
         110hB0MY0qa9+1qXJHHxW1ss231xPskJXSamuMqjzRzXdzgR6/nsa89Qn+2RfU3eIv+0
         0vLg==
X-Gm-Message-State: AOAM531M/+hs/ZHPuO1ySUiaTfST9+1tRz/ZZyRWA/vlrtdgwM8uRXb5
	/x8FkxMdLkwjx8Ygh/vO5cOG7Yaa3Twp1Gf7xpNI
X-Google-Smtp-Source: ABdhPJwHOmQse5JaEJZ9pdSms9x3cPQBvPXsPcnevtEzlANE5PG+3T95s3z+9oFoZWNK01UJ3aS4eVhx326VZNRqn+M=
X-Received: by 2002:a17:906:1484:: with SMTP id x4mr12677672ejc.72.1631538888667;
 Mon, 13 Sep 2021 06:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210913112557.191-1-xieyongji@bytedance.com> <20210913112557.191-3-xieyongji@bytedance.com>
 <YT9FVrXcaUdaXlu6@infradead.org>
In-Reply-To: <YT9FVrXcaUdaXlu6@infradead.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Mon, 13 Sep 2021 21:14:36 +0800
Message-ID: <CACycT3uY0BA1ax_fMpUq9rtbboDdAcTMLZeMmkLNBQMrgHAVig@mail.gmail.com>
Subject: Re: [PATCH 2/3] loop: Use invalidate_gendisk() helper to invalidate gendisk
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, yixingchen@bytedance.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Tnwf-AGmQ-E.A.JJB.hJ1PhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1442
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3uY0BA1ax_fMpUq9rtbboDdAcTMLZeMmkLNBQMrgHAVig@mail.gmail.com
Resent-Date: Mon, 13 Sep 2021 13:30:09 +0000 (UTC)

On Mon, Sep 13, 2021 at 8:35 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Sep 13, 2021 at 07:25:56PM +0800, Xie Yongji wrote:
> > Use invalidate_gendisk() helper to simplify the code for gendisk
> > invalidation.
>
> bdev can't be null here so this looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> Can you also add a cleanup patch to remove the bdev checks and the
> entire bdev variable in __loop_clr_fd?

Sure.

Thanks,
Yongji

