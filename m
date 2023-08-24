Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831E787442
	for <lists+nbd@lfdr.de>; Thu, 24 Aug 2023 17:33:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B5EB420681; Thu, 24 Aug 2023 15:33:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 24 15:33:12 2023
Old-Return-Path: <songxinying.ftd@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CDECB20583
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Aug 2023 15:17:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.199 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HSTyyXwAgBX9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Aug 2023 15:17:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B51752057B
	for <nbd@other.debian.org>; Thu, 24 Aug 2023 15:17:35 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so51188151fa.2
        for <nbd@other.debian.org>; Thu, 24 Aug 2023 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890253; x=1693495053;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x7QFTOLH78RvEs9lsDd2isR/kznJbT884Moit9I1Mww=;
        b=F8HYc2wlHQh7sFZRJXll5V+x4kkYAC97g23LuGAMfPuLh40W93RLLYxh4vUe4wYP0w
         Zy5nK9hW2b8Jd19JogoFt/PXkPGoCYhQktI7+C5DSN9XigtBd0E7KejfgQsPimFqN0VE
         q1bhBoVHKaX4CQvbiFWH1gAGc4bB3J7jIdnojT1KVWQqJk2Vovdd7YngZOZOioMl0vwY
         honm76e8nfgXhvn8IBVJHXxGWpvwrxiHHOCnGXgq57yGnjz9hezb8yTfcZnY8XJw0ydL
         u0lpf10gvJALa1QGZ9HReny0k2v7U22Ip6DnPQkogOjKTvMSP/1l8ij+sEsoswoB7JS5
         yu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890253; x=1693495053;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7QFTOLH78RvEs9lsDd2isR/kznJbT884Moit9I1Mww=;
        b=HK0srRcM7vnpsiDvWxWSmRIlN2rkNKOTZlSA1flVlnZH2ZoW++T5iYTxbPzO7FlZCQ
         Z0sxREfI1jBAXLsyUH3wCLLg5aEL8HicvGniz0WalXYY7nLk5oLTI/jGmOcA+PcSpHJY
         jUFiuF+OfsUGvmHJudOvxWMxsYseIpS2uXK1T7nva01P7a9hb7azeROdVzHPhdAvXKb5
         1elVlPWsfSyx378nBO7a2ClRKVTPlzzy67x9QGe7dsUnfG+oWxZhl6zKf9sg7iBXj/cl
         xdHuZqahbnmDrIA+i/CP+5NnsbhXr2xIZK+GtKd+zhXG1RA7UGe63KsNl/hdq8OyNn9w
         rQmg==
X-Gm-Message-State: AOJu0Yy5R0tsj1SSMwlr6HOWsqFZuSs8xRd0AKgvYCgrazoXVG3S65GC
	r1cl4MKLibucgEOO0FgmyfhPVvaswLP3AwIDybc=
X-Google-Smtp-Source: AGHT+IHLoSnR9wy0dD8HrHwRkD+cEwUF9Knq9ENj7AVSCpebugJsaTRmSWA3/gXe7kCvjkqLDIlIRGidCjZFkVZIh+0=
X-Received: by 2002:a2e:81d5:0:b0:2bc:e882:f717 with SMTP id
 s21-20020a2e81d5000000b002bce882f717mr1709229ljg.53.1692890251788; Thu, 24
 Aug 2023 08:17:31 -0700 (PDT)
MIME-Version: 1.0
From: Xinying Song <songxinying.ftd@gmail.com>
Date: Thu, 24 Aug 2023 23:17:20 +0800
Message-ID: <CAMWWNq8NavOF0hf3+RmfVJeM3VbLnuMEXXyYfbhQbQsH+CBvog@mail.gmail.com>
Subject: nbd: double reply err, how can nbd handle tag change after interrupt?
To: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bCjAm-aSbFF.A.rxF.4g35kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2632
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMWWNq8NavOF0hf3+RmfVJeM3VbLnuMEXXyYfbhQbQsH+CBvog@mail.gmail.com
Resent-Date: Thu, 24 Aug 2023 15:33:12 +0000 (UTC)

Hi,
Recently I find the nbd module of my server complains aboult "Double
reply" error when using rbd-nbd. With more investigation, I find every
time the error occurs nbd module is returning STS_RESOURCE to block
layer due to EINTR in sock_sendmsg. When the block layer get a
STS_RESOURCE ret value, it will free the tag of the request and
reallocate a new tag next time the request is being processed.
However, when the request is being interrupted, nbd module may have
sent the nbd header of that request to nbd server, so it is possible
that the tag of the request that nbd server gets is different with the
new tag in nbd module for the same request. I don't find any patch for
this in mainline. I'm not sure if my analisis is right, hope anyone
can help to explain. Thank you in advance.
Best regards.
Xinying Song

