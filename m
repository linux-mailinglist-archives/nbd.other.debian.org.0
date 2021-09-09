Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C9E405355
	for <lists+nbd@lfdr.de>; Thu,  9 Sep 2021 14:51:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 701352082F; Thu,  9 Sep 2021 12:51:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  9 12:51:53 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BC8EF2072F
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Sep 2021 12:34:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8Ay3WEccIF3P for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Sep 2021 12:34:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-ed1-x530.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9ED8520720
	for <nbd@other.debian.org>; Thu,  9 Sep 2021 12:34:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v5so2445971edc.2
        for <nbd@other.debian.org>; Thu, 09 Sep 2021 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oX4Dj9ZXgOv8yaBPcUaPEk5dnnNEO7xIQcrdkFjSHKA=;
        b=E7uWS8yDE751Ij1pZzX4IMB9dvJ8U1MM4xw6zcVfKZ+vmEXQwWzK5ANY3O7DpaV969
         5zRN8Y35JaFlIJmo13bnSJICIDtbZiqChEzk3N5yyKzSFdMn4uxT/kkgRJPQeg7jHEVY
         GdQYjardLGHClo9/FL6L5+ufQJontEEcX/CPh3BwgEDcKrcIHSkK60b9h4xs0rGZjZ44
         026ldb7eMP5hqAuaYydZ5NJEHeREsSq1EIYb1GL4wmO0nNuloxVxoxFuAapM7lBYY2zn
         Gj4/HaP2E6vGv73PJjI4bzKtwfwSY5LyQy/tBbORi+jgZsWx1wDJxDiFylCOlPkE/RFy
         1mNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oX4Dj9ZXgOv8yaBPcUaPEk5dnnNEO7xIQcrdkFjSHKA=;
        b=j1D5xp+pUvoJSYPsxwi8H740oanw39tRrrY1T6eXGWgnchulkgX/zHDrLPTbaoyR8k
         /7Orppnj/mlcRdZzDuRAk3ySvjrU8VhKCxqWMwQUXpkpRsJLq6plqGmueWu3zWvr6LR0
         DXtaDGdQuEy3OSXDVPdzNudQhLJTwoG8ofm2EY53NG/vdPpAiINzy5epDQIO9a4uR79z
         YuMgWjNPwE5UqTWF3U2NbwoJfZekrC1rhf9fFO+p3L37nBgxf+Ikq1oQDl1EIOdExn3V
         Ml/4kLtCy6wzsEpPYTrD73SEeUD3BCMq9YhTyHmQUixP2u0CumnJenk4IZathWp4LUxq
         hESQ==
X-Gm-Message-State: AOAM533WZyxZQzz66HxZRSupV1kOjYQ/XvOCb+h/UI9fXBH/pPUxe00q
	m6jsZ3f5O1PSVkx+9O9ClUEfcvuRBUXsvL6fl/w3
X-Google-Smtp-Source: ABdhPJz7R5rWq5PdHrd+/9R7VKFyY4khAyM8rWwNp9zT3ExKuPkyRb2KXZ0SObAbCNjw/gtpQznwZm9lJDmQ8UkOjRo=
X-Received: by 2002:a05:6402:4247:: with SMTP id g7mr2925993edb.287.1631190859581;
 Thu, 09 Sep 2021 05:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121425.91-1-xieyongji@bytedance.com> <YTmqJHd7YWAQ2lZ7@infradead.org>
In-Reply-To: <YTmqJHd7YWAQ2lZ7@infradead.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 9 Sep 2021 20:34:12 +0800
Message-ID: <CACycT3vHrN3tgeH91gdzr08DXd8KCXyAuxUb5k-HcwB7coi4iA@mail.gmail.com>
Subject: Re: [PATCH] nbd: clear wb_err in bd_inode on disconnect
To: Christoph Hellwig <hch@infradead.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, yixingchen@bytedance.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8oP1vdeNy9G.A.XqD.pNgOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1423
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACycT3vHrN3tgeH91gdzr08DXd8KCXyAuxUb5k-HcwB7coi4iA@mail.gmail.com
Resent-Date: Thu,  9 Sep 2021 12:51:53 +0000 (UTC)

On Thu, Sep 9, 2021 at 2:31 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Sep 07, 2021 at 08:14:25PM +0800, Xie Yongji wrote:
> > When a nbd device encounters a writeback error, that error will
> > get propagated to the bd_inode's wb_err field. Then if this nbd
> > device's backend is disconnected and another is attached, we will
> > get back the previous writeback error on fsync, which is unexpected.
> > To fix it, let's clear out the wb_err on disconnect.
>
> I really do not like how internals of the implementation like into
> drivers here.  Can you add a block layer helper to clear any state
> instead? This should incude e.g. the size just cleared above and should
> also be used by the loop driver as well.

Sure, will do it.

Thanks,
Yongji

