Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C4403915
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 13:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BBE9020828; Wed,  8 Sep 2021 11:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 11:45:10 2021
Old-Return-Path: <naresh.kamboju@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AAFBC207FA
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 11:28:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8c_UPQfDD-Ca for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 11:28:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linaro. - helo: .mail-ej1-x636.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C53E0207F0
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 11:28:25 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a25so3460183ejv.6
        for <nbd@other.debian.org>; Wed, 08 Sep 2021 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0w+npLymedQOmdkTjXEumVbGXNXmwr0XOw2iRGbnJe0=;
        b=Wz9lc/POPlH8xx/KP/FRuLfS23o1KhqT6EbV6HiIsyXMU8fLbcsGfocpr2wc6l+37g
         b2oIY45PVww3mmqG/B3Tj3nyKJlM/c86zTngbXaprFAEYUbKIeW1FORaeY/sGR/RHKQv
         nOFNu1ukZPOQSIFqKOCI2C7JayZs3Ltly5bzTa4S3N+2UgS/Jt/beR1Une1/wz5J3QZB
         T9M9S9WWT2KawsXE+EUMZcH+pEJcz79K+nlOcDgU0NMrXhvYxx75CKwS3WOiSGh4pXmf
         9yL9lePshOTUbr3tZ+dDVR2Pn9cxd9mlbcn3urHqmTYVB2P/BruFjQ306IiiPput9I6X
         pc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0w+npLymedQOmdkTjXEumVbGXNXmwr0XOw2iRGbnJe0=;
        b=coFDHsT/Ov6iRGO+d6J9M22bSXzqlyCMvPxenMT4aqsUHFgA6H5la3f+FBLqnx18kW
         AMO1UaPLyZNmpckZXVDZ7mOHeatB0i/1d09jHqAnTKJbX5Aop0jLuTv7xVHFffHG2j/A
         fHWoulJ2iW2IoI9vkt+gZHVxz77OQqOITfmWYTquLIVs5js7bJa6hRuTNgMXIR75jsJf
         EkBKbOsLCuyoQIuNPUxQB/BBoedkCjnORLH6wVfG69VVaZmtJM+eAUtFv3dQpehH5O+e
         51Wj284aRO0AWvC1RmYqzwBTNGQzSHASzKJ+2UaZ2saHBY23pcpvel8QTcnnaMZ7GXjA
         i5Zg==
X-Gm-Message-State: AOAM531LAljFIJLlwlyvoxpYPj/7wgMh9tmS7yDtZjMctElThh2j95IQ
	pRPNXE5wNQL1GWdLq/VgU+R/Uq1qDJkBflm2KBFbzg==
X-Google-Smtp-Source: ABdhPJzOGH87ffdACbvniW2JGxeaTFyzRqmCcDgdU4oQca4TO5+hAdJEpXBgzeIreusv+eEddBrBTzLTp7SpFvsNrMo=
X-Received: by 2002:a17:906:681:: with SMTP id u1mr3452871ejb.499.1631100502434;
 Wed, 08 Sep 2021 04:28:22 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 8 Sep 2021 16:58:11 +0530
Message-ID: <CA+G9fYvThAuTu1-Tg+7BaFofxfBkvBuTAnycuws-U4p473MeZQ@mail.gmail.com>
Subject: ERROR: modpost: __mulodi4 [drivers/block/nbd.ko] undefined!
To: linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	open list <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, lkft-triage@lists.linaro.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <W-RuBdWQj5K.A.cZB.GJKOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1416
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CA+G9fYvThAuTu1-Tg+7BaFofxfBkvBuTAnycuws-U4p473MeZQ@mail.gmail.com
Resent-Date: Wed,  8 Sep 2021 11:45:10 +0000 (UTC)

Following build warnings/ errors noticed while building linux next
master branch with clang-13 for arm architecture with following configs.
  - footbridge_defconfig
  - mini2440_defconfig
  - s3c2410_defconfig

ERROR: modpost: __mulodi4 [drivers/block/nbd.ko] undefined!
make[2]: *** [/builds/linux/scripts/Makefile.modpost:134:
modules-only.symvers] Error 1
make[2]: *** Deleting file 'modules-only.symvers'
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1952: modules] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2
make: Target '__all' not remade because of errors.

Build config:
https://builds.tuxbuild.com/1xqOnCtgaWedE8U8jhmbI3FuAuJ/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git_describe: next-20210908
    git_ref:
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 999569d59a0aa2509ae4a67ecc266c1134e37e7b
    git_short_log: 999569d59a0a (\Add linux-next specific files for 20210908\)
    kconfig: [
        mini2440_defconfig
    ],
    target_arch: arm
    toolchain: clang-13

steps to reproduce:
https://builds.tuxbuild.com/1xqOnCtgaWedE8U8jhmbI3FuAuJ/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org

