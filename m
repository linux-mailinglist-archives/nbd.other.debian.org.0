Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5E50BBDC
	for <lists+nbd@lfdr.de>; Fri, 22 Apr 2022 17:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1903E20419; Fri, 22 Apr 2022 15:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 22 15:42:10 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4302E203BC
	for <lists-other-nbd@bendel.debian.org>; Fri, 22 Apr 2022 15:24:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QN-RaPbrUGSc for <lists-other-nbd@bendel.debian.org>;
	Fri, 22 Apr 2022 15:24:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-il1-x129.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 24E412040D
	for <nbd@other.debian.org>; Fri, 22 Apr 2022 15:24:13 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id o5so5243049ils.11
        for <nbd@other.debian.org>; Fri, 22 Apr 2022 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wxv1VHcdMAWKawTEifnINmazC29umb2i5gHiDAZVeBk=;
        b=335nWJbBDhabHr89gG5tFiLbFOQLvASDcW1EglELgq0uhxBp97C2KaIqEwRKVbYsmx
         GpS+ja0gF1YRQsUZmFTz2Nl2pDXP+Xg6v+vWDRNYMU8cLM1cbEfDWjFhC1kiLwXMHCqc
         eUNTTMg/IucTx/f6rGjggjmKpM7YImY+ja+IfNi+FzeDGPOhrYxJqIu19gGYohfQaFGV
         0SRajNzdFfpfR5CbaoKsMJp5T0wjU80hAdAdMAGsWbQc6pgeR7DyeISxjBih7RRxtKeA
         yyb7xs1AH/m8scE0u5RTvPAz4HOf8cex/5nDUlehQfn/pXUbFnP8ggIcugUC7gLXuD4C
         AWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wxv1VHcdMAWKawTEifnINmazC29umb2i5gHiDAZVeBk=;
        b=KNVi6xKFntSix7QkvQWwMWHj+cQL3UmuLApOORdSYCU/Bc6BGnuQMwBBwb04wMU9KF
         jxZ8TB0Wn7lvnrIy2vVW9OXJc9Pzdq7qr2vwHsR41418XuVZEBeiCEwCUbBGPhjGIPJw
         r/mZ7AY6GxJX80lxh1kfjHbJHU8ngIGaaClqQ27LYZmCTJE8E+iiu3SGjsOFhYMUQlnX
         PjETN0kgewdZyq+PnuKltzG3zgZDI/d19yoaSG6cxQXuReVeFD7XC3Mxf/Xbvwa1QmL4
         Ze4q254yz+WhmKJYaxWoy1433kohzQB0/Ou3fmpwlmfvHVWGISDXrXN+d60KrNDHxvfT
         QOJw==
X-Gm-Message-State: AOAM533WPzOeymLeyWARk6z7SUBzXtkBPMFLj+LoRxxZHTqwi13GRN1f
	yBetWUjpn9g51T83rAgYRNqhiWwPqhU4IXym5bKsbw==
X-Google-Smtp-Source: ABdhPJynI2j2o9aSn9G09xaJSPgHCkDd+G+caW0XT60z6/oGe+SAEg8uILSJZITvWsJcMG2BcnPuKkJSdTWGHxW7IyE=
X-Received: by 2002:a92:d2ca:0:b0:2ca:ca3a:de89 with SMTP id
 w10-20020a92d2ca000000b002caca3ade89mr2225426ilg.127.1650641049737; Fri, 22
 Apr 2022 08:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220422054224.19527-1-matthew.ruffell@canonical.com>
In-Reply-To: <20220422054224.19527-1-matthew.ruffell@canonical.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 22 Apr 2022 11:23:58 -0400
Message-ID: <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
To: Matthew Ruffell <matthew.ruffell@canonical.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, 
	nbd <nbd@other.debian.org>, Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <68_miqs4z3G.A.vXF.RzsYiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2045
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com
Resent-Date: Fri, 22 Apr 2022 15:42:10 +0000 (UTC)

On Fri, Apr 22, 2022 at 1:42 AM Matthew Ruffell
<matthew.ruffell@canonical.com> wrote:
>
> Dear maintainers of the nbd subsystem,
>
> A user has come across an issue which causes the nbd module to hang after a
> disconnect where a write has been made to a qemu qcow image file, with qemu-nbd
> being the server.
>

Ok there's two problems here, but I want to make sure I have the right
fix for the hang first.  Can you apply this patch

https://paste.centos.org/view/b1a2d01a

and make sure the hang goes away?  Once that part is fixed I'll fix
the IO errors, this is just us racing with systemd while we teardown
the device and then we're triggering a partition read while the device
is going down and it's complaining loudly.  Before we would
set_capacity to 0 whenever we disconnected, but that causes problems
with file systems that may still have the device open.  However now we
only do this if the server does the CLEAR_SOCK ioctl, which clearly
can race with systemd poking the device, so I need to make it
set_capacity(0) when the last opener closes the device to prevent this
style of race.

Let me know if that patch fixes the hang, and then I'll work up
something for the capacity problem.  Thanks,

Josef

