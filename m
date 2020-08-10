Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E22405AC
	for <lists+nbd@lfdr.de>; Mon, 10 Aug 2020 14:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68C84205B3; Mon, 10 Aug 2020 12:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 10 12:18:09 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 267D1205AC
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Aug 2020 12:01:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 10-W-Ll1uwwj for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Aug 2020 12:01:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1042.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BD32020339
	for <nbd@other.debian.org>; Mon, 10 Aug 2020 12:00:58 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id t6so4909737pjr.0
        for <nbd@other.debian.org>; Mon, 10 Aug 2020 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=J5NMSWLZnk+MsiWSWRywCSAdMKXFevy9G71hx6FYlmU=;
        b=JXjmPpxSzA+gVk/JHPgluZHOVUYN7iwvYtV7P5MQ6kGnwpLbdiN1vh8sHh60eKo4y8
         IaUgel1hBWnI6LxxXqNd9oXw3E0p6GoD+rQOktcY90SU7vnJB9CTGkrCz8FACHrH7y7D
         HBmU+fif+gpbIVXPtZLhh6shMFWUCy7anLXZIEppJhpEYg1nTPH1U3sHrhGcJV1MZyfV
         /A8Xn/Pgv0cKOaLfroHbn3/zfC2rRkQs6WM61VPZ0HwM12wNHWlKjnplTDLxYHm3KGHm
         lqLLIhASAOr/8ZHr/B6mVvNLZxmG4/1eevbC3HoZs2jtDO86ggNSr7cDpSCrEGQUO5S2
         pHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=J5NMSWLZnk+MsiWSWRywCSAdMKXFevy9G71hx6FYlmU=;
        b=dbystkRO9vj8qbSSEKm2BEjqrmLprkg9VuvKaVT80plTF+CTG8TuqSDRdrDc5e4H3y
         GpiuRSxgcSE0XmdOeukwp+pkhc5R+cUibankUd2+SWo6MKuapEcxLGNt8+nDwA98GbdQ
         ejvPRAm64KNl2wmFy9xJpsd9zMWqu9qNfJjDY2MCn7CEs7LIwGuvOH64Osx8P4RYHqyH
         sUJm61qJVhk/a+dSAqT68KE1kvau1nVTP2EEA+Px3j/2oFibbXtZD3w9A3CZbf0yKaW4
         /+jw7A93btmHUPSTmwQrvAWHzACW6KXlM7rBebEKeuDwOa507DYdQpsclZf3AWKORwNt
         6R/A==
X-Gm-Message-State: AOAM532vpB8Ux/mHVCNgSCNqDASJb6KI/SObb1Cs5YREt5p6L1f0Z+lZ
	ToxpqnggizS8v/lC0lG2Kg5rsQ==
X-Google-Smtp-Source: ABdhPJwq5sbrPHVl71G13+on8Palt8gY94TlYincrSVzLbZ0IroPCkjWv9neUvHk/9Vlas+e8Add9A==
X-Received: by 2002:a17:902:bc46:: with SMTP id t6mr22965741plz.273.1597060855161;
        Mon, 10 Aug 2020 05:00:55 -0700 (PDT)
Received: from debian.bytedance.net ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id o134sm22222637pfg.200.2020.08.10.05.00.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 05:00:54 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	mchristi@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH] nbd: restore default timeout when setting it to zero
Date: Mon, 10 Aug 2020 08:00:44 -0400
Message-Id: <20200810120044.2152-1-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ECl0lsKGZCD.A.R1H.BsTMfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/929
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200810120044.2152-1-houpu@bytedance.com
Resent-Date: Mon, 10 Aug 2020 12:18:09 +0000 (UTC)

If we configured io timeout of nbd0 to 100s. Later after we
finished using it, we configured nbd0 again and set the io
timeout to 0. We expect it would timeout after 30 seconds
and keep retry. But in fact we could not change the timeout
when we set it to 0. the timeout is still the original 100s.

So change the timeout to default 30s when we set it to zero.
It also behaves same as commit 2da22da57348 ("nbd: fix zero
cmd timeout handling v2").

It becomes more important if we were reconfigure a nbd device
and the io timeout it set to zero. Because it could take 30s
to detect the new socket and thus io could be completed more
quickly compared to 100s.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ce7e9f223b20..bc9dc1f847e1 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout)
 	nbd->tag_set.timeout = timeout * HZ;
 	if (timeout)
 		blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
+	else
+		blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
 }
 
 /* Must be called with config_lock held */
-- 
2.11.0

