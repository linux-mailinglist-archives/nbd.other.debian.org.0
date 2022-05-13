Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB24525A01
	for <lists+nbd@lfdr.de>; Fri, 13 May 2022 05:21:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6F0C52037B; Fri, 13 May 2022 03:21:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 13 03:21:10 2022
Old-Return-Path: <matthew.ruffell@canonical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3BDC3203AA
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 May 2022 03:04:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.065 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.575,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o1STzVQb5d27 for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 May 2022 03:04:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 497 seconds by postgrey-1.36 at bendel; Fri, 13 May 2022 03:04:52 UTC
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E3C4520399
	for <nbd@other.debian.org>; Fri, 13 May 2022 03:04:52 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 249603F802
	for <nbd@other.debian.org>; Fri, 13 May 2022 02:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1652410591;
	bh=rF63nrgHe2cIWk7sqY1Jv0XZG3knafOJHCDaTqNMlvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=U7KowGIG4s7z5FG0WOqTY/eK9wmuEnpsB2PFxDxPPyr4e1M1zHDP8JSrCwLUBaCYP
	 j5on83bV4UEsnsf1EbLFjQU6SdJeWrLPidvoyCYeLbJ7hGJl7kYUDhuFwvgC2GKqIT
	 eUs5UEle2gslIGlADDUVXA3zidIc4eXk0qF+oehgS2WdSPLwroyY7nMYoP1pu/FWOF
	 xsEtWAYZUZ5mAMnzDVwyLU5kKi5UiqNrQTzj188ZiGLJn0TeAJ5mxjjyIh9JxdTSX9
	 d7CzkUGB6irM976tohb6FQl2YuU+DDx5areRZ56ElOrVMjb/PCJv6f/WzWHiQ9KYXI
	 R/tK/GNLgXWhA==
Received: by mail-pj1-f72.google.com with SMTP id gn21-20020a17090ac79500b001dc8a800410so3438989pjb.0
        for <nbd@other.debian.org>; Thu, 12 May 2022 19:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rF63nrgHe2cIWk7sqY1Jv0XZG3knafOJHCDaTqNMlvM=;
        b=6nXYAEoASKRJjT48UYtwYWqA49COpspT+46x7UYf65F89NjNt5Jc1bxa6wnC7Xoodb
         rmKdxJyFh2cXtfkVfJSTdlLsRkORZxWy+hmJupOdmUvoikgiD6tLEsfMKrtC9YYEtnIl
         PxxHpCPuIZcA9ORS6ARx0REX4yARakMObmIFg7yn3htNQfIarfhWSrZFr8fNdOBPrXh+
         /RShJ71AcBBRrZESzHZU25nG8H9gUeMZQoQfRVfV28v5UPdNYXTT72v2fi96wte0da/E
         pII+B9EoJ5Wyxa4Am2kVESNPhNJ5f1A30hcUYpX1Wgne0VTIL50q9bNijEwHWGdzXLtD
         a8JA==
X-Gm-Message-State: AOAM530x/qjtydW9f36ZCI9zP5AN83Gpu49vf6acslHQGysLaamowb5e
	rrTmmb3YVFtM3KwccVkn2v/Wc1q+c9s8OP0Fjr802hcqrmx9ODaWqNYtErIiBFtnX3OlFhHjznh
	s1F1+Og85C3XxKT3DQWf+27HQAmeYdpbNZJ0n01RFQJ6ytuY=
X-Received: by 2002:a05:6a00:14ce:b0:50f:ac00:2a8b with SMTP id w14-20020a056a0014ce00b0050fac002a8bmr2515924pfu.36.1652410589569;
        Thu, 12 May 2022 19:56:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF07aqxQuyHQBnn1dyRbK0T+OdhcKZA2/h0j3IrKXjFeE5mXIWYnicu3Vjp1wRI+BJrCi2u/Pe5db7SXi1Biw=
X-Received: by 2002:a05:6a00:14ce:b0:50f:ac00:2a8b with SMTP id
 w14-20020a056a0014ce00b0050fac002a8bmr2515909pfu.36.1652410589312; Thu, 12
 May 2022 19:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220422054224.19527-1-matthew.ruffell@canonical.com>
 <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com> <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
In-Reply-To: <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
From: Matthew Ruffell <matthew.ruffell@canonical.com>
Date: Fri, 13 May 2022 14:56:18 +1200
Message-ID: <CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com>
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, 
	nbd <nbd@other.debian.org>, Linux Kernel <linux-kernel@vger.kernel.org>, yukuai3@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mD0_vZK7MyI.A.oNG.m6cfiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2064
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKAwkKvfFn18RjupuqGpx4QeAiMYKSq7QUTd3wEL=pkZ+BENpQ@mail.gmail.com
Resent-Date: Fri, 13 May 2022 03:21:10 +0000 (UTC)

Hi Josef,

Just a friendly ping, I am more than happy to test a patch, if you send it
inline in the email, since the pastebin you used expired after 1 day, and I
couldn't access it.

I came across and tested Yu Kuai's patches [1][2] which are for the same issue,
and they indeed fix the hang. Thank you Yu.

[1] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
https://lists.debian.org/nbd/2022/04/msg00212.html

[2] nbd: fix io hung while disconnecting device
https://lists.debian.org/nbd/2022/04/msg00207.html

I am also happy to test any patches to fix the I/O errors.

Thanks,
Matthew

On Tue, Apr 26, 2022 at 9:47 AM Matthew Ruffell
<matthew.ruffell@canonical.com> wrote:
>
> Hi Josef,
>
> The pastebin has expired the link, and I can't access your patch.
> Seems to default to 1 day deletion.
>
> Could you please create a new paste or send the patch inline in this
> email thread?
>
> I am more than happy to try the patch out.
>
> Thank you for your analysis.
> Matthew
>
> On Sat, Apr 23, 2022 at 3:24 AM Josef Bacik <josef@toxicpanda.com> wrote:
> >
> > On Fri, Apr 22, 2022 at 1:42 AM Matthew Ruffell
> > <matthew.ruffell@canonical.com> wrote:
> > >
> > > Dear maintainers of the nbd subsystem,
> > >
> > > A user has come across an issue which causes the nbd module to hang after a
> > > disconnect where a write has been made to a qemu qcow image file, with qemu-nbd
> > > being the server.
> > >
> >
> > Ok there's two problems here, but I want to make sure I have the right
> > fix for the hang first.  Can you apply this patch
> >
> > https://paste.centos.org/view/b1a2d01a
> >
> > and make sure the hang goes away?  Once that part is fixed I'll fix
> > the IO errors, this is just us racing with systemd while we teardown
> > the device and then we're triggering a partition read while the device
> > is going down and it's complaining loudly.  Before we would
> > set_capacity to 0 whenever we disconnected, but that causes problems
> > with file systems that may still have the device open.  However now we
> > only do this if the server does the CLEAR_SOCK ioctl, which clearly
> > can race with systemd poking the device, so I need to make it
> > set_capacity(0) when the last opener closes the device to prevent this
> > style of race.
> >
> > Let me know if that patch fixes the hang, and then I'll work up
> > something for the capacity problem.  Thanks,
> >
> > Josef

