Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D625D27DF13
	for <lists+nbd@lfdr.de>; Wed, 30 Sep 2020 05:42:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BAE222037C; Wed, 30 Sep 2020 03:42:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 30 03:42:08 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 705DE203A1
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Sep 2020 03:24:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ac9dOQF8gUOn for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Sep 2020 03:24:10 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x641.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AAF95203C2
	for <nbd@other.debian.org>; Wed, 30 Sep 2020 03:24:09 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t18so163896plo.1
        for <nbd@other.debian.org>; Tue, 29 Sep 2020 20:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NwE7i74AuLDH0Fg4fY0Imy1bHpX3sGiN2a+2wH0x5Aw=;
        b=lpaHpVFxeUbAycwqEq+dqDfNkNIpL8PpQ9uyAMX09hB34OpIeeoRbnH+RqatUvxJl0
         QlrzVjh3Jji4/KVUFgpZrZOpyqm1XzHnXrBoDaFikdfaT+cHtLVNQEIWqm0FNJlVs/Zl
         uf9oglP6DiMZFBD8NLbUjpPx2Ey7Jq9gwGQwQHF4p1Fo7GW5Q4Jemc+NXPw+m8p8W2FU
         Odzz4yqwlf7+/BGxx/59FFuiZvPT3A2yJuzmnBzeyhxOOWfwCGilkq14X93EGT4Khe5z
         +6RJQ72BwbZHOr4YuLF263NZXJtANc6GG2s0YOpGC/qlLIqvvTDa6gb3N6ulIkera9Yh
         cNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NwE7i74AuLDH0Fg4fY0Imy1bHpX3sGiN2a+2wH0x5Aw=;
        b=cUtzYRzCIEqCqPhSGKNbMWjqlxshMIPFT3cyqbO6TAXZE/kkyokl5v/ptpR5mz9B/0
         1mCaHkcrpjJn3FUfOSjkLtpQ0vVMhWur0Iwez9N+nNaIEtVuarPDEdzoR82v6VSu4k6F
         DnKcHGXrwdJIUctRjIzrWn0A4PQuzV6wqeyhgc/+W0cX8aAKs7CLVVeoquvRmM5QODBt
         BNW+xdvXITm6vDK6QW3FNIVXWRRpV9RVtMhOs72nwMJ/w476Hk8AFyG9S1mijo6ExhcN
         v1lVm81pcqK5TB/n1jjfpqgVBdDqhCfqfsLUuEF5uEqgTY6tYp3CtN0zjmQfbMQ+/K69
         vW3Q==
X-Gm-Message-State: AOAM533ujcqyuyXOeGRwm2Uqst8/TbnqhhOcQD8Wz04ycff4WqIdydc5
	/ymEOulpiWQfzqxD2pt6pF2+Gg==
X-Google-Smtp-Source: ABdhPJxNPWswpvqpHT8Jy/8mIsOtJ790xLBWEKWe2VTaNtFgevoBAO9F7IQJ37tS9CDI0MqTjb5tqA==
X-Received: by 2002:a17:90b:104f:: with SMTP id gq15mr607382pjb.215.1601436246107;
        Tue, 29 Sep 2020 20:24:06 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id w195sm226105pff.74.2020.09.29.20.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 20:24:05 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH v3 0/2] nbd: improve timeout handling and a fix
Date: Wed, 30 Sep 2020 11:23:48 +0800
Message-Id: <20200930032350.3936-1-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MYsqI-Ke_OP.A.z7H.Q6_cfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1006
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200930032350.3936-1-houpu@bytedance.com
Resent-Date: Wed, 30 Sep 2020 03:42:08 +0000 (UTC)

Patch #1 is a fix. Patch #2 is trying to improve io timeout
handling.

Thanks,
Hou

v3 changes:
* Add 'Reviewed-by: Josef Bacik <josef@toxicpanda.com>' in patch #2.

v2 changes:
* Add 'Reviewed-by: Josef Bacik <josef@toxicpanda.com>' in patch #1.
* Original patch #2 is dropped.
* Keep the behavior same as before when we don't set a .timeout
and num_connections > 1.
* Coding style fixes.

Hou Pu (2):
  nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
  nbd: introduce a client flag to do zero timeout handling

 drivers/block/nbd.c      | 33 ++++++++++++++++++++++++++++-----
 include/uapi/linux/nbd.h |  4 ++++
 2 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.11.0

