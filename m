Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BA752BE1
	for <lists+nbd@lfdr.de>; Thu, 13 Jul 2023 22:54:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C2F2D20B20; Thu, 13 Jul 2023 20:54:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 13 20:54:11 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3D36120A13
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jul 2023 20:38:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id h9iV2o-z3D3W for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jul 2023 20:38:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x633.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B34CE20ABE
	for <nbd@other.debian.org>; Thu, 13 Jul 2023 20:38:04 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b89b0c73d7so1495185ad.1
        for <nbd@other.debian.org>; Thu, 13 Jul 2023 13:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1689280680; x=1689885480;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1Q3QVXuA3e+9GjXcm3jtTXFaZS47K/0EuW+3XlNfNc=;
        b=Su8Wda2t8a9fyq+mKQcL/x7F/nORxih5QNN3QcI8gU6tafMcFTpXJ/JwTC+hoKIAet
         UZMsZJb96148P+d+aPws2YjRiYEf/edVpyjk4+wpEJ9M1XzqIucAg9yImocZFmYK9wJK
         xaE29kKpjDeCOxxq0rQ+6whCvhArs3pZ84vH3p/ZLNWFeACVq7oihBFPE5g9PWRpVt62
         m/+T4BW1NQTA7qrHOcSd4KuKrl9Spcm6bLiz8E7RZ/f+rVQrLrv9scU9gZNQlE9kebGZ
         0RGTY3HPcbhwteIksfVKa0OxCoVWRm5KTkbDlcno5Uv52JGfmdZij+dF0jwVK882tSpc
         Hovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689280680; x=1689885480;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Q3QVXuA3e+9GjXcm3jtTXFaZS47K/0EuW+3XlNfNc=;
        b=YuvZLb7yktvoiae4f/EpVYPLCHN0it0A6In+zjxTqnAdjdVlCEo9jdZdHYRObcgIAD
         F5rCsMINj6bgGd19RghQbT//oCjNDiXW07gGn5mexfguMDjB7JPzZoGByXQgsGOnqxNH
         j9JGjwExINbwEHN/V7zHK+eiz7r9Fytg3guzQOqAu4o5zjtgXbGJNyWQLITljyxMuNqR
         ou8vHh077ET6KLqMALUoMTZ3V8PLUH5YljRGje4bTBBWkvMwAGeCsxI6kxPAZbMxtp1C
         FeKV/8qzacSdPGkJrbOgD8aksG8Vg2VQ+8Bl9GwfqhpbpYoOqk6umNJopbH8Mlz25XgV
         OoMg==
X-Gm-Message-State: ABy/qLYINQAXNGAkggxGWi3bS6S0JCf38z8B7v2lPrxzqbknqUQssmhs
	bx/68unmwSqvEJ+b9OuW7cHxvw==
X-Google-Smtp-Source: APBJJlFtDbDfCH1QZYudWC+aygAHdxLHIdPeg2AQ0LHcswNN+FtzghG6W1WdomahIOIyN5rpCIt89g==
X-Received: by 2002:a17:902:e549:b0:1b8:a8e5:e8bc with SMTP id n9-20020a170902e54900b001b8a8e5e8bcmr3342583plf.6.1689280680481;
        Thu, 13 Jul 2023 13:38:00 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902988a00b001b89045ff03sm6258074plp.233.2023.07.13.13.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 13:37:59 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
In-Reply-To: <20230713-b4-nbd-genl-v3-1-226cbddba04b@weissschuh.net>
References: <20230713-b4-nbd-genl-v3-1-226cbddba04b@weissschuh.net>
Subject: Re: [PATCH v3] nbd: automatically load module on genl access
Message-Id: <168928067935.580122.1235240259614744275.b4-ty@kernel.dk>
Date: Thu, 13 Jul 2023 14:37:59 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-099c9
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hcByjUysT0K.A.J5.zRGskB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2571
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/168928067935.580122.1235240259614744275.b4-ty@kernel.dk
Resent-Date: Thu, 13 Jul 2023 20:54:11 +0000 (UTC)


On Thu, 13 Jul 2023 21:29:35 +0200, Thomas Weißschuh wrote:
> Add a module alias to nbd.ko that allows the generic netlink core to
> automatically load the module when netlink messages for nbd are
> received.
> 
> This frees the user from manually having to load the module before using
> nbd functionality via netlink.
> If the system policy allows it this can even be used to load the nbd
> module from containers which would otherwise not have access to the
> necessary module files to do a normal "modprobe nbd".
> 
> [...]

Applied, thanks!

[1/1] nbd: automatically load module on genl access
      commit: 82e37f43c37845b69955a0dfa5e0d1a2a830bdb7

Best regards,
-- 
Jens Axboe



