Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E11272207
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 13:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3FE9A20300; Mon, 21 Sep 2020 11:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 11:15:10 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 58397202BB
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 10:57:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9-FgifIVwP0P for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 10:57:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1041.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C114F2029F
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 10:57:34 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id bw23so4423303pjb.2
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMBUI6Fmhk4dVucq9AzM0QSmMF7KbZUqiP0bTlSjq0I=;
        b=LbJ1WGK31+9bPUgqsPzlwNMXNJev+ldV2Lq5WGAxZb8tM7/8wEffEl4vXOiZL4N9Js
         AFhOpDQn+xkz2zQnyFpiTn025Pr0dWv70duzRjkvF6fRTdUqfA7Z0ktuWuaAAWQm8xi5
         kOmubfVc9/kEetzhC8agMMwyiYoSWKxDyNls1iOPMwIUrPmHXRwU/0EbhmHCydFOZCDZ
         +muN1zoGonrpYm+6QhWBvJOKQrjKEoRACzY32UY2DrfRvga+FKEhpaKtnzlX0gj4NZr6
         rnCxA0ba7nD3xiES77tU0E9kvdYKWzjGK1rNB+kMjKN1Wcg4HSMr1jFVtu7glg9SaNn1
         smXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMBUI6Fmhk4dVucq9AzM0QSmMF7KbZUqiP0bTlSjq0I=;
        b=tdcW1xpgyMln5IRRHIK2ckSP/k3QBJbvez6S3rdrbcou/F/39ajUwh3ucqqV6BOZC0
         LSsLqkkydkB5c43H384JjDQmnzISG/M4IJuJbu2O1h7EOdhOSUrx2V4Ygr8L0+i3P+VR
         Zj8s+Pb8v7JGEujxui4PwSNZ7KsrdRC74GqXnbX2zF+6S84I8GldgwnqmMrB4W1fe6Se
         zus/rmqpgf1ENJIa3BXrX60pcTDYsnakeE4o5bdnNtU6O6vQo4tOfXKEqsphWkTSfU8U
         +za9b5t8CDKLFc01EcKrwnCBVP8nsk7ROHfnsNj8HRyvBo03Q4ESOF5emveu4/rLnRLs
         1y7g==
X-Gm-Message-State: AOAM533Sl2Jn09w+anNhM1PrTpuKRtvGa4d/DR+0TwqekwzAc1uwkpj9
	W1NtTW8FovcK0GdTtU14km+lcA==
X-Google-Smtp-Source: ABdhPJy+d+Dlj/7r/2tSMN2/k0zQajzw5GRf5/uecx0w/UEnV2VkqS0v98RW7WSEMv/+877yccKYBQ==
X-Received: by 2002:a17:90a:d596:: with SMTP id v22mr25151925pju.146.1600685851315;
        Mon, 21 Sep 2020 03:57:31 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.73])
        by smtp.gmail.com with ESMTPSA id x62sm2792533pfx.20.2020.09.21.03.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 03:57:30 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 0/3] nbd: improve timeout handling and a fix
Date: Mon, 21 Sep 2020 18:57:15 +0800
Message-Id: <20200921105718.29006-1-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zbzcvV6kFyB.A.ol.-sIafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/989
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200921105718.29006-1-houpu@bytedance.com
Resent-Date: Mon, 21 Sep 2020 11:15:10 +0000 (UTC)

Patch #1 is a fix. Patch #2 and #3 are trying to improve io timeout
handling.

Thanks,
Hou

Hou Pu (3):
  nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
  nbd: unify behavior in timeout no matter how many sockets is
    configured
  nbd: introduce a client flag to do zero timeout handling

 drivers/block/nbd.c      | 36 +++++++++++++++++++++++++++++++-----
 include/uapi/linux/nbd.h |  4 ++++
 2 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.11.0

