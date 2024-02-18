Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA45859718
	for <lists+nbd@lfdr.de>; Sun, 18 Feb 2024 14:18:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 66F0520616; Sun, 18 Feb 2024 13:18:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Feb 18 13:18:14 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F4052205F2
	for <lists-other-nbd@bendel.debian.org>; Sun, 18 Feb 2024 13:02:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.91 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ju-7nEoRnzE7 for <lists-other-nbd@bendel.debian.org>;
	Sun, 18 Feb 2024 13:02:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1036.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 664E6205C5
	for <nbd@other.debian.org>; Sun, 18 Feb 2024 13:02:01 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2866b15b013so994140a91.0
        for <nbd@other.debian.org>; Sun, 18 Feb 2024 05:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1708261317; x=1708866117; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIYyy/W1tr/0bAEhThJxXh8k4ZWLMBlLPwt2pJ+jp6Y=;
        b=ZoA0KReh9qvac3SwJQMZzcvwokGxIyQkRzKBKcaXGTdNoZf4iFU1qfvRJw1M0DKHuv
         Ck09hPbTzs+kHwwEf0yBg49MrSnfUpr16Sh1vcmij75bpesYgu738/ZWbJ7c1kLoWqHo
         awdQusF3oixdczvJsM4GDHHMz235LmVzyA1tIleqRfmAg60hwLthnAliysRBG33Pz7im
         1ParNlNPFM342+GjCyHxRZy+NFTKx4YBcVzZ4udX9cDiqAqIzAbQ/szYM2pqu5PPrsIu
         W+q2vUf8ohVzMJLIRUbZGpmT2wlM3cJNNy37z08qNEFgYnCJWslObk3lESCL7UcGJjDl
         Yp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708261317; x=1708866117;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIYyy/W1tr/0bAEhThJxXh8k4ZWLMBlLPwt2pJ+jp6Y=;
        b=DvUtN9i7GgTmSmrwcG5KJModDZLcvDv1gecFuUmwDTcKXcJart3Nz9gUZptZY64nMC
         85oW2VAXZ8z1n9qXU2/gao6ps5SjqwGeNXz07h/9TIF/CUo2bQOPAvVi6WhHIA0meldg
         NTwvLk38eT+9nZuljj9Ou/6JRarZaB7WKvFiRxANBO8Ja18GP+QJj7yyn/0d5kBkPLNy
         mlQHQb7W5ct7UC636pN0/lyqROip0dOMF7VjY+t8wyZSMfFSlaFusqzDytuovp3GVNLi
         5vlDlf0gHcxP5W+H4SruTecxQt8FBAW/ZOdy9aUtXzuGNN+XMigUKKsKpOw7A9DCD3fr
         h3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUVwj+UDvsszcfFTzjcRQLyIbYU6XDS3RrZxi15sAkMMlsBxkVOLs9aDE1FoaXVP0gdH7ayPa/OXHyg6VwhHIQozCeGHg==
X-Gm-Message-State: AOJu0YxxaOYkEh1vLOKxz8HycfeG8pH0YHGtmPDwa0Ow5klsqUVoS94p
	IWYwmjAgr6jM8s91Wju54Z6T/Y7+bTSj2DL0D7H5BxCoGEwPNfQSAAeVsa9yvvE=
X-Google-Smtp-Source: AGHT+IFOVa6oJdPekL8bCPtPXjepHYdheq4ZXbm6St90f/I+EkgW0h8RafEA/oyz36xEGT9oV83dCg==
X-Received: by 2002:a17:902:bb81:b0:1d8:ca3a:9d2a with SMTP id m1-20020a170902bb8100b001d8ca3a9d2amr10414358pls.4.1708261317334;
        Sun, 18 Feb 2024 05:01:57 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id kn14-20020a170903078e00b001d9a91af8a4sm2685725plb.28.2024.02.18.05.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 05:01:56 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, Kees Cook <keescook@chromium.org>
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, 
 Michal Kubecek <mkubecek@suse.cz>, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20240218042534.it.206-kees@kernel.org>
References: <20240218042534.it.206-kees@kernel.org>
Subject: Re: [PATCH v4] nbd: null check for nla_nest_start
Message-Id: <170826131614.3482432.1638173744340292313.b4-ty@kernel.dk>
Date: Sun, 18 Feb 2024 06:01:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mJYTeKASp1N.A.19G.WOg0lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2751
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/170826131614.3482432.1638173744340292313.b4-ty@kernel.dk
Resent-Date: Sun, 18 Feb 2024 13:18:14 +0000 (UTC)


On Sat, 17 Feb 2024 20:25:38 -0800, Kees Cook wrote:
> nla_nest_start() may fail and return NULL. Insert a check and set errno
> based on other call sites within the same source code.
> 
> 

Applied, thanks!

[1/1] nbd: null check for nla_nest_start
      commit: 31edf4bbe0ba27fd03ac7d87eb2ee3d2a231af6d

Best regards,
-- 
Jens Axboe



