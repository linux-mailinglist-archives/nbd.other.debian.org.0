Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1A3F7C6A
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 20:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8FC0C20917; Wed, 25 Aug 2021 18:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 18:48:09 2021
Old-Return-Path: <rathod.sahaab@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B804B205FF
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 18:32:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MEvBERs-n_pl for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 18:32:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 70024205FD
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 18:32:11 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id z1so234152ioh.7
        for <nbd@other.debian.org>; Wed, 25 Aug 2021 11:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FZGuC/ZmR4cNwFbU/2iGmptw6ic4P3aVF/51Wn2SsjY=;
        b=XAxPuAdc/BQXt1OcACWCo/1URWUFG071WYE5gsrgCMs8NJtM8SNt9hOoY2dCqDW39j
         e8qJxpG6ywDLDKRr2i/Ar+l5koSmxCbLQPSH0sgz1wcg08n6IPXeJdWRyipN5HkBPuJl
         i2xXlWHQRIsbee9rBFuCuA8EiVDHefsoJzFETt7FijofbWL1UBKplVR3ZOB5atDgSUrK
         8bmP5EuIRBXMkpgpBPuVlyxR31NBTf84LLHBst2/ZvDE3q1sQfsCZ+Bg8Il8cDbGuBs1
         LhAtdjBwvl6okYi4cscoi6rkFX2nbenXyPd1XRvv2dwDwQyWzieV5hN25iGoCL/232xg
         uX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FZGuC/ZmR4cNwFbU/2iGmptw6ic4P3aVF/51Wn2SsjY=;
        b=ioicSTmTjwHXDyplgSvmDJ+PiuVsPTTbsyfUt4BLBdh0Zx69yI39tVVT174Q/QgzHO
         mi8dwlEiNaxpYoROzhdvGl6S/UHOoT7NzVyW+Nk6mwPS/WU9dJYPwR757JCwn9B3hb2u
         2CNGJc4/gtqYk8Q/4OPaPuay69FzovQROZ/mzEXAuq7GQW6gFH670QlApRfnew1bs/u+
         Am9EpPvNAmIJK+3oi9Qirf0NXJlICmxyHHY3PievsBrsW1ruvrmz6E8IMPreEZZRO/V/
         hWYtQ7fDAvTOUKLofiRnyfSNJkKCK9Modt8o2//fvLx/F7uaj+QDglGWmQZKuH3n0aSH
         Uzyw==
X-Gm-Message-State: AOAM533TZVkeuu6S1/JAjN6aKu8sTb+fOEcNavCLxvob8t7EdY3484VC
	HK2tvAfd0bvgSuiIoYAzIl4jTNCRWn3n/v+AW50=
X-Google-Smtp-Source: ABdhPJzAJyZ82YYYjdEPVjFDdiKYZdav94b+h4jdeVPwe1weSCq8SqWgRDRiOc9pcoVNrcuuFWjAcznyvVAtrLYHLPs=
X-Received: by 2002:a05:6602:27ca:: with SMTP id l10mr38371735ios.16.1629916327713;
 Wed, 25 Aug 2021 11:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210624182714.GG30099@redhat.com> <CAAXt=1C9tBwc6wkrtFz=Fdgp0CccMSvj-BGVbncXJgLXWRwbjA@mail.gmail.com>
 <20210625085904.GI26415@redhat.com> <CAAXt=1AU0QH=PZ+Bx=_1=GZ7rTDMfr0e4M53rHnyw=mV2o_rQg@mail.gmail.com>
 <20210710075756.GX26415@redhat.com> <CAAXt=1CK3LHrsmC_nK8yqqufYBZiGgcjVXOakDjVULH+QhLa4A@mail.gmail.com>
 <20210731183900.GU26415@redhat.com> <CAAXt=1AHofuOUHLjpJ8BkfkXp2qxZWtwP76ireaXvg_gu-By_Q@mail.gmail.com>
 <20210807180805.GO26415@redhat.com> <CAAXt=1AJdzeMCdnBo4fqPQjetKJN-73CS7_Ln60Axr3EAfn3+w@mail.gmail.com>
 <20210823172026.dxunchzbofjg27wk@redhat.com>
In-Reply-To: <20210823172026.dxunchzbofjg27wk@redhat.com>
From: Abhay Raj Singh <rathod.sahaab@gmail.com>
Date: Thu, 26 Aug 2021 00:01:48 +0530
Message-ID: <CAAXt=1DZADG9WBezmDSTS6Miht4_OeGiSjX6eo_R3cjvkfFnPQ@mail.gmail.com>
Subject: Re: [Libguestfs] nbdcpy: from scratch nbdcopy using io_uring
To: Eric Blake <eblake@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, libguestfs@redhat.com, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZGpKGSjQ2y.A.mi.pBpJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1336
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAXt=1DZADG9WBezmDSTS6Miht4_OeGiSjX6eo_R3cjvkfFnPQ@mail.gmail.com
Resent-Date: Wed, 25 Aug 2021 18:48:09 +0000 (UTC)

Thanks, sir, the suggestions were very insightful.

> For that matter is there a benefit to having cache-line-optimized
> sizing, where all headers are exactly 32 bytes (both requests and
> responses, and both simple and structured replies)?  I'm thinking
> maybe NBD_OPT_FIXED_SIZE_HEADER might be a sane name for such an
> option.
>
32-bytes sound good also you mentioned about upgrading length field
from the current 32 bits to 64 bits, which will increase the size of
RequestHeaderfrom 28 to 32 bytes, also we currently need to add
__attribute__((__packed__)) to request header(for x64 at least) which
is not best thing for speed.

So, if I understand it correctly I need to implement this in nbdkit
too to make it work.

I gave the idea a bit more thought and I think there will be a sweet
spot for how large our NBD packets should be as
1. The small payloads (<1MB) might help us process more packets hence
should be better for a large buffer
2. But more packets might stress our NBD state machine causing it to
be more CPU intensive, however, that might not be very significant but
just putting it out there.

Anyways this is a bit different from my previous approach so I need to
redesign nbdcpy, to make it wait some time to collect packets before
reading. I will update on further developments.

Thanks & Regards,
Abhay

