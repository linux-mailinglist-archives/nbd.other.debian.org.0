Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E94536CEA
	for <lists+nbd@lfdr.de>; Sat, 28 May 2022 14:36:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 43288203AB; Sat, 28 May 2022 12:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 28 12:36:09 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E73720468
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 May 2022 12:20:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HMwrhzta77_P for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 May 2022 12:20:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pf1-x431.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A3A9520479
	for <nbd@other.debian.org>; Sat, 28 May 2022 12:20:54 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id bo5so6558937pfb.4
        for <nbd@other.debian.org>; Sat, 28 May 2022 05:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=xVmGe1pvb1NKRaxS08eK6LDkM0yzbPm06yZ8alaEbGk=;
        b=Ex2RVVuwUDGAbS1eIGz9BZZiDjRCWA6n5ETkHu9T74L+YmnqBwOzmRt0D50GLnOcne
         89Im+fxHAz6j3hRxEvc8R4BVZn4FSXO/VmBuoQawOEDggIitflk67OQOvDVNZ0/CFlxL
         DK8iYRkwrJfQOYB7KE1Q72sHW12gjrecYlfNM4GbZ67ycf0lgrsh1iw5G+T+/XUW1UTH
         98Mx/5kNsKY9Yga4YT0rjk66vV9ftOeY2xm0J/LQIth9jUKj7qNXixfOBK3OEXNoJZtN
         2ylGELGbC9BcWPNGMtvGXG6lyoi17gatTcDV66SCDagwsM3ThUEDzl3qfMJqmoYBb9HI
         LNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=xVmGe1pvb1NKRaxS08eK6LDkM0yzbPm06yZ8alaEbGk=;
        b=Ny85JgSWfN20yZkihtqDeItJS6xJBqptxRKcaSqsDwYvOdFxrRUlwC7+fCbdwdxP4+
         4DwFatAqBhGi05QCb3tCTk2wh+7V3woLPRZfLQFGYl0T2jKax3E/Io2WA5tY2OyeUofu
         U2Vj0vt1HE0BV7eMZRQ7SFuNYguR6B5EJMOP7DG8zSt4VykgBA+5AuiQ4dAHdqljg0Sk
         XOfjoYht+Y3+mPZ0I4BKyDWzfwpqrWAgMqMtH7GyE9UDkUQQz8e8ruSDEMHOx/HKqcJ5
         UybCQ45G1N221/9z4M24yLBSWEMss4wQfE53rBdIZ8o32KJaFLgsGIQzMBSwXBUt1T2F
         JgUQ==
X-Gm-Message-State: AOAM530Sulcp+V+CkUdaQ32s6kUrWFgoEz8+/2eY9soyq7tgd6TSB1eT
	OBjEKc6sCTQP9t7lq/kIr3Ct9w==
X-Google-Smtp-Source: ABdhPJw2JoXBOtEAH4o4PFJ8GxYYTMxM+Pl16lVdghppJx0YDlQ4ug4s8djl3xsFNogW6/uma3Fgjg==
X-Received: by 2002:a05:6a00:2386:b0:519:1ff1:d723 with SMTP id f6-20020a056a00238600b005191ff1d723mr11292271pfc.21.1653740450875;
        Sat, 28 May 2022 05:20:50 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id gb8-20020a17090b060800b001df51e34036sm3203230pjb.0.2022.05.28.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 05:20:50 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: yukuai3@huawei.com, ming.lei@redhat.com, josef@toxicpanda.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, linux-kernel@vger.kernel.org, yi.zhang@huawei.com
In-Reply-To: <20220521073749.3146892-1-yukuai3@huawei.com>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
Subject: Re: [PATCH -next v3 0/6] nbd: bugfix and cleanup patches
Message-Id: <165374044976.753929.3131835512531137863.b4-ty@kernel.dk>
Date: Sat, 28 May 2022 06:20:49 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rn84O68m2EE.A.RtE.5chkiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2109
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/165374044976.753929.3131835512531137863.b4-ty@kernel.dk
Resent-Date: Sat, 28 May 2022 12:36:09 +0000 (UTC)

On Sat, 21 May 2022 15:37:43 +0800, Yu Kuai wrote:
> Changes in v3:
>  - rewrap to 80 columns where possible in patch 6
> Changes in v2:
>  - in patch 3, instead of clear and then reset the flag if rq is not
>  completed, test first and clear if rq is going to complete.
> 
> path 1-2 fix races between nbd setup and module removal.
> patch 3 fix io can't be completed in some error path.
> patch 4 fix io hung when disconnecting failed.
> patch 5 fix sysfs warning about duplicate creation.
> patch 6 use pr_err to output error message.
> 
> [...]

Applied, thanks!

[1/6] nbd: call genl_unregister_family() first in nbd_cleanup()
      commit: 06c4da89c24e7023ea448cadf8e9daf06a0aae6e
[2/6] nbd: fix race between nbd_alloc_config() and module removal
      commit: c55b2b983b0fa012942c3eb16384b2b722caa810
[3/6] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
      commit: 2895f1831e911ca87d4efdf43e35eb72a0c7e66e
[4/6] nbd: fix io hung while disconnecting device
      commit: 09dadb5985023e27d4740ebd17e6fea4640110e5
[5/6] nbd: fix possible overflow on 'first_minor' in nbd_dev_add()
      commit: 858f1bf65d3d9c00b5e2d8ca87dc79ed88267c98
[6/6] nbd: use pr_err to output error message
      commit: 1243172d5894e2d8f277ee3c278180792de5c521

Best regards,
-- 
Jens Axboe


