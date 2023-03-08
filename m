Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A006B0BEE
	for <lists+nbd@lfdr.de>; Wed,  8 Mar 2023 15:54:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 67D01204DD; Wed,  8 Mar 2023 14:54:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar  8 14:54:12 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 63B1F204B7
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Mar 2023 14:36:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RLLDpYTXnJHV for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Mar 2023 14:36:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1030.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 188FC204B3
	for <nbd@other.debian.org>; Wed,  8 Mar 2023 14:36:39 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id m8-20020a17090a4d8800b002377bced051so2589945pjh.0
        for <nbd@other.debian.org>; Wed, 08 Mar 2023 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1678286196;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU9zfr0sSfDMF8EOQ6jauX+ahLmztKAP76LRaaO6mow=;
        b=Fbs+f7XWjkx4EqHPb0TlwAyQZ185YQctaYG47jre943R45uIHXbUlucC6nAZbBvWHX
         goq5qAcdRsr9ico/tWvRs+Ww6TmnWvKMn9gEtV4Gtw4Y5kIbLcmkVTvSC28Yp7RX8oif
         BIL6oVv/FRwpAx2Or9phACtlRCWhb7z+yn2LqMBFZd6htgmJErC6D3+To5/5iaFzaOAe
         6xwTB7JJ3duEVM/BxOhblP8en49hD0Ppzsc9mS2E4YFwXnV3Hd6qU63abdweSo6R+gMs
         LlOPy6w0Lf8EN65Ox2dnLdfYw1HHyCxep6BFY4+VpZ46k2D5M5FFXj+dUcpFy8YL687H
         im1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678286196;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU9zfr0sSfDMF8EOQ6jauX+ahLmztKAP76LRaaO6mow=;
        b=SPSsfa5pqpL0aC3MDZ5EmyiUFo5G69PWol1ajPt5xhLa84qrNdulBCpzNu9VCf4/ni
         TtXFCWQcYES4yEDYiHDG8q5ot9TT9EwupIXfpzO3jVcTTFjHyQvnKH7HTI6mg0fEFvFC
         7gJnw4krDciDN0z7r8zZKRv2B+Io51dYDZ/7wnmb9sQoiqNQjdj4iAWxJCAZMx5f9vdB
         ulsovedqvnmhnF2hvawzNAkZmYuOYfJxnl+iFYpVlKOzVSzkduYcrQdaR4csn5mAJaRY
         aiotkzR/Q9A+DHKKToGUygMqpz3H7ZseHE0UvseqRDwh64KsfLwhq7WTDhowIajnDle/
         GoXA==
X-Gm-Message-State: AO0yUKXqKH5YUg9MVUwwqTy5ySHaA4BBn53BRCR+hiyI4CtMGRxfQ8Qw
	Pej+zWjAGEo/gNQnBkNpFCntHA==
X-Google-Smtp-Source: AK7set8gk+M4PkzVS8H5/ctwv9YsnJEaEbiSgDwCH2uyaFrRYOEWehf71f7sAC2ty0F7Lx9iCnHLdg==
X-Received: by 2002:a05:6a20:3d24:b0:cc:fced:f740 with SMTP id y36-20020a056a203d2400b000ccfcedf740mr22413856pzi.0.1678286195808;
        Wed, 08 Mar 2023 06:36:35 -0800 (PST)
Received: from [127.0.0.1] ([50.233.106.125])
        by smtp.gmail.com with ESMTPSA id v15-20020a62a50f000000b005b02ddd852dsm9734100pfm.142.2023.03.08.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 06:36:35 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Jakub Kicinski <kuba@kernel.org>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
In-Reply-To: <20230224021301.1630703-1-kuba@kernel.org>
References: <20230224021301.1630703-1-kuba@kernel.org>
Subject: Re: [PATCH -next 1/2] nbd: allow genl access outside init_net
Message-Id: <167828619510.180985.80953362723422693.b4-ty@kernel.dk>
Date: Wed, 08 Mar 2023 07:36:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ebd05
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mPKHj4QpzjM.A.WIG.UGKCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2358
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/167828619510.180985.80953362723422693.b4-ty@kernel.dk
Resent-Date: Wed,  8 Mar 2023 14:54:12 +0000 (UTC)


On Thu, 23 Feb 2023 18:13:00 -0800, Jakub Kicinski wrote:
> NBD doesn't have much to do with networking, allow users outside
> init_net to access the family.
> 
> 

Applied, thanks!

[1/2] nbd: allow genl access outside init_net
      commit: 6a650ef04718aff580d6b352c38ca839991fd3ae
[2/2] nbd: use the structured req attr check
      commit: d09b3a9ff6c6ef74298e19b22b362bc0a6e4e9dd

Best regards,
-- 
Jens Axboe



