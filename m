Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EEE50EB63
	for <lists+nbd@lfdr.de>; Tue, 26 Apr 2022 00:03:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 61E9D20345; Mon, 25 Apr 2022 22:03:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 25 22:03:28 2022
Old-Return-Path: <matthew.ruffell@canonical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1AA1E20306
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Apr 2022 21:47:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.065 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.575,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ntx47seKwdjq for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Apr 2022 21:47:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1F8AD2029D
	for <nbd@other.debian.org>; Mon, 25 Apr 2022 21:47:37 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 600863F325
	for <nbd@other.debian.org>; Mon, 25 Apr 2022 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1650923253;
	bh=UO4wzxZajFtH3qcfy3dLF1bQAk44v43NDT+rmdRn5Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=J5+97Ol7GprYEW2ZEzNG4XzYVNsOUW0hZWdsQzVB/duFtm7QztNyWaCuwFifRdVLS
	 UK1L5wsfM9Ng4KwhlUOM6ddLDISodBfm93unZoI892dJsJUI9OK76qgKASLecXZrIl
	 5xct1CynTk3pCa0/saQfmfmTeEuPUvvFJ39omJCB6zUfdh317D7D8oJL8sg2+gTRu5
	 zvxU6CqFHPfTPxzVPL7Yr8qVvVYIjp27l5LhfKkcRFx92VoQAZoiGANueJM+j7uut6
	 Z01+xXCiWe/4/Eu4Z42UtYTMKKty4G3LW01MvFO8wM3jPXKC2pKF4sYWBi/9RfCYM+
	 4vhJAozziJTUg==
Received: by mail-pl1-f198.google.com with SMTP id t14-20020a1709028c8e00b0015cf7e541feso3971923plo.1
        for <nbd@other.debian.org>; Mon, 25 Apr 2022 14:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UO4wzxZajFtH3qcfy3dLF1bQAk44v43NDT+rmdRn5Yo=;
        b=pZz5gPTUIc78iG5Xsi/9JwmNgZI4/L2QhozPG7SH+4QdM2+TywPgl6ia6NHZwCIiZu
         Ys+OeQGQ+OeRYksX8myid+1nIRZHL2RRdvLeiFJr5bv1OoL6wNXIMTMNZ74iTlOYnmuf
         D/5Lybh6OBHT+JK4vbKiHWlkaPKS513EXD+RjgCaw2hfjXO37eZMkUQfhMdnCIZHom+K
         Ae+m9vsmuSX8JyRXM1ZJkaJS9OpFoZQSo5/2Ubp/Vv9pDfjFRYkt5FkqPndiSypa8jhA
         aHyAgv9N9Bfv210rD0MqZQYt0KzjAr8v3PyLXjccdMMheqTidtkSg3+DQJUTJoUBpWlx
         +1Mg==
X-Gm-Message-State: AOAM533+3ks2cCYQI3uNaCHN39MVDO/+D8+Mq7MlrFU/ymyxyc3O3p1A
	cVC8Lp6R42Jq6VMHHJT53g5Tu71fHljSMUs/UnUXks2yrSHGMymEB9hTwrjQ8B6aHg2TbFh7d4a
	ClfHT4qkDDuqYi2AIDj6qGr7Em6fFqopajWLaFCEs8SpTc4k=
X-Received: by 2002:a17:90b:886:b0:1d9:3a05:3f2a with SMTP id bj6-20020a17090b088600b001d93a053f2amr14051820pjb.53.1650923251849;
        Mon, 25 Apr 2022 14:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2rdYzYOX06hsXRuD35oezdKlAmuDxmoRYv+cEWg5RH4h591X/jJQypqGczm4ZFvbqbJKbrTN/oPcN6sjDAD4=
X-Received: by 2002:a17:90b:886:b0:1d9:3a05:3f2a with SMTP id
 bj6-20020a17090b088600b001d93a053f2amr14051798pjb.53.1650923251590; Mon, 25
 Apr 2022 14:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220422054224.19527-1-matthew.ruffell@canonical.com> <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
In-Reply-To: <CAEzrpqe=LD3DQcEeLXmmFuq7cX_dAQ6DOCuJYWBoZWKKTmoTzA@mail.gmail.com>
From: Matthew Ruffell <matthew.ruffell@canonical.com>
Date: Tue, 26 Apr 2022 09:47:20 +1200
Message-ID: <CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com>
Subject: Re: [PROBLEM] nbd requests become stuck when devices watched by
 inotify emit udev uevent changes
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, 
	nbd <nbd@other.debian.org>, Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cfw70q8ht6O.A.UAD.wqxZiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2048
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKAwkKt3yMOOW3NXcE91WkGr+8xj050CYP2pLoQVHt_2wXq=-w@mail.gmail.com
Resent-Date: Mon, 25 Apr 2022 22:03:28 +0000 (UTC)

Hi Josef,

The pastebin has expired the link, and I can't access your patch.
Seems to default to 1 day deletion.

Could you please create a new paste or send the patch inline in this
email thread?

I am more than happy to try the patch out.

Thank you for your analysis.
Matthew

On Sat, Apr 23, 2022 at 3:24 AM Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Fri, Apr 22, 2022 at 1:42 AM Matthew Ruffell
> <matthew.ruffell@canonical.com> wrote:
> >
> > Dear maintainers of the nbd subsystem,
> >
> > A user has come across an issue which causes the nbd module to hang after a
> > disconnect where a write has been made to a qemu qcow image file, with qemu-nbd
> > being the server.
> >
>
> Ok there's two problems here, but I want to make sure I have the right
> fix for the hang first.  Can you apply this patch
>
> https://paste.centos.org/view/b1a2d01a
>
> and make sure the hang goes away?  Once that part is fixed I'll fix
> the IO errors, this is just us racing with systemd while we teardown
> the device and then we're triggering a partition read while the device
> is going down and it's complaining loudly.  Before we would
> set_capacity to 0 whenever we disconnected, but that causes problems
> with file systems that may still have the device open.  However now we
> only do this if the server does the CLEAR_SOCK ioctl, which clearly
> can race with systemd poking the device, so I need to make it
> set_capacity(0) when the last opener closes the device to prevent this
> style of race.
>
> Let me know if that patch fixes the hang, and then I'll work up
> something for the capacity problem.  Thanks,
>
> Josef

