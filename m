Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8013029F7
	for <lists+nbd@lfdr.de>; Mon, 25 Jan 2021 19:21:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7FDB7203B1; Mon, 25 Jan 2021 18:21:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 25 18:21:08 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A815F20396
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Jan 2021 18:05:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.729 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.749,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ncJIt-5MXQei for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Jan 2021 18:04:55 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x633.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BCF5D203B9
	for <nbd@other.debian.org>; Mon, 25 Jan 2021 18:04:51 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id h15so5653179pli.8
        for <nbd@other.debian.org>; Mon, 25 Jan 2021 10:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=HFIw0n1S05QNXPbIf5jQGUjQnr5Q45q0C9PmXQ+j6PM=;
        b=Yd7IlCy2J+9XBpAHZFUsh1BSVxdpDbEN1+b66E1vTmLrRXPZaYT86wm0rnLIDq4uaI
         dbeIsDANBsMnu31ivGGIf4btiuUYelGwEZkFjprJ3IShrG9WO5o6KEDzjA73shaJ/4Qv
         bdnoPCA1HIdSuv2eQA1jZ7ecw7bVI5aVqEA5hKeJrKyJhDif1ObIH43ha8NY6t5bbFd5
         H0xopy8X2ElfNfCz7iiK9o5pTY46r5g8BrFe3ANXWSUY7k2QHxYS7u1y773f9b0pouzn
         RHH+X3RIBxASv/eqOFMNKY9yS9hWAPAkOwBHMszY7VE6EKLK7TaTSxEreGHCk5PD49MC
         N6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HFIw0n1S05QNXPbIf5jQGUjQnr5Q45q0C9PmXQ+j6PM=;
        b=I2BMetY/vfogNTqL7nnh/K4C43KcynOkbqcgxuiM7YKq1BXUYFn26QcZRM3J6BMm3e
         voJuWRyWNAL7IpuNY8gY0R4gd3sLtkdVYGn019LJvJ14J8F9eTlKNwprW2Lq5lehnamo
         YAu2CcR6RAHFxd+UVm53of7dCrHOvqPnmRt60OiR5RLheQBz6g54O54TZJFrCXPl/FfH
         bwLVx1KxsH2XqLO5n/SaZ+O6NKJDO/7IqxA8awfWDPDjsi0G0yNTBicgBaa8WFvfxMa9
         CgQvJme7MUgEQG4gLHw9SukU5b1nGRoBX+gOCAY65QgXTazzP35DuR267U2IPCmmIvyc
         uFFw==
X-Gm-Message-State: AOAM531+CBnta0kr5dRaiHemboWE057iduRTuxHLVdBWyP+ygo/Durbs
	2/jTsmycc0bIqRT3/oZFk6AD3w==
X-Google-Smtp-Source: ABdhPJzd8uaUcdiXamsAQkzl3wvARZCWqAhwOv8o/vKaeqj24PgXQRalyDWSeRIX5z+g7aBfDYhmDg==
X-Received: by 2002:a17:903:22c2:b029:dd:f952:e341 with SMTP id y2-20020a17090322c2b02900ddf952e341mr1603962plg.67.1611597888016;
        Mon, 25 Jan 2021 10:04:48 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id i7sm16885792pfc.50.2021.01.25.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 10:04:47 -0800 (PST)
Subject: Re: [PATCH] nbd: freeze the queue while we're adding connections
To: Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, kernel-team@fb.com
References: <24dff677353e2e30a71d8b66c4dffdbdf77c4dbd.1611595239.git.josef@toxicpanda.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <8393944d-f3d4-42e9-3814-032c141432f8@kernel.dk>
Date: Mon, 25 Jan 2021 11:04:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24dff677353e2e30a71d8b66c4dffdbdf77c4dbd.1611595239.git.josef@toxicpanda.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4mTj7Xa98tF.A.WJG.UwwDgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1106
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8393944d-f3d4-42e9-3814-032c141432f8@kernel.dk
Resent-Date: Mon, 25 Jan 2021 18:21:08 +0000 (UTC)

On 1/25/21 10:21 AM, Josef Bacik wrote:
> When setting up a device, we can krealloc the config->socks array to add
> new sockets to the configuration.  However if we happen to get a IO
> request in at this point even though we aren't setup we could hit a UAF,
> as we deref config->socks without any locking, assuming that the
> configuration was setup already and that ->socks is safe to access it as
> we have a reference on the configuration.
> 
> But there's nothing really preventing IO from occurring at this point of
> the device setup, we don't want to incur the overhead of a lock to
> access ->socks when it will never change while the device is running.
> To fix this UAF scenario simply freeze the queue if we are adding
> sockets.  This will protect us from this particular case without adding
> any additional overhead for the normal running case.

Applied, thanks.

-- 
Jens Axboe

