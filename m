Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE3D1B3B06
	for <lists+nbd@lfdr.de>; Wed, 22 Apr 2020 11:18:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 480582047E; Wed, 22 Apr 2020 09:18:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 22 09:18:20 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9EF5E203C9
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Apr 2020 09:01:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0gJdjYioUzqM for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Apr 2020 09:01:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x642.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4ADF6203E0
	for <nbd@other.debian.org>; Wed, 22 Apr 2020 09:01:03 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t4so669263plq.12
        for <nbd@other.debian.org>; Wed, 22 Apr 2020 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1oSwgbdRKpWZbApHpNeDS3+KWK+1P6ooTW7bXAE3HjU=;
        b=LvFNogxUGjZvf3SM0OAOr5tM6QS7MLodlGdCun3hcECrno31c8F4T12COi/Jti5nm1
         eQoqXSS005CMFkmUrKiOnT4X8pVjMTgOqk/juIXsl4HvkvZlPGqSnADHGejFAFauZTDf
         f3YPCZzFtRPZWUx5W0NCCB8QPuQLPO/sHZTVdx6PkCrIYmHnPpT37HLbrr1WzI7cCadc
         pdZmSH1EWEvjcQYvNpPTmgy0XbR1EUMnhbBwkptD3I2ZPyZdmNy3OnAGQTc5v2TZi0er
         3H7acLvRACpl88gbj5ChBBmHhIIsnAZ1sVyyzK1k8EwTLDOJLDxk/y65402f1cHcRBqC
         zp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1oSwgbdRKpWZbApHpNeDS3+KWK+1P6ooTW7bXAE3HjU=;
        b=QXso+wBDtaonBtCX9yH6qVnEYbPbwRxHuZie4VcpuVIVQy+G8LOu9zabFi3ZEQrp5k
         ms/VnHuX2HhyS6C+uDArJD4SKzWJjwQnfEgEqvyXB0XoUtwwR8oFababW0XXBsIhzA9F
         RqxhjgcbEsy+XpZpN7FbYB1swEDGNXxKWwvB2AyupLm1qlJwE66qi/1aRjpFHRIMnjB7
         Phfd2LFzQE9zng45MbvXfuw+1HoZgOju4eS5sUN0ESjYgJSq8NGce+NKZA/FOqxrK8lI
         qodsDQgNK24Y/yLziipB8qKkuAgN7aayS6kgUEsJRGIdNl2Zu1/lmJeFY8ppkRrWLkmx
         884A==
X-Gm-Message-State: AGi0PuZJrGEjJ30qKVYivNSKB2rmWqnVwnLOTogcU5l802wPOqWJ+58Y
	ti/nrnHUA5Egs1Xngy13OFgKUw==
X-Google-Smtp-Source: APiQypLprH/dcnAnO/TtFdHjnAWs0V2X23WQolusyOg6z01Eo42FZ/7AUTNPVzF57vzMTIDipCi8ew==
X-Received: by 2002:a17:90a:fb4e:: with SMTP id iq14mr10559136pjb.146.1587546059901;
        Wed, 22 Apr 2020 02:00:59 -0700 (PDT)
Received: from debian.bytedance.net ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id p66sm4660054pfb.65.2020.04.22.02.00.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 02:00:59 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mpa@pengutronix.de,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 1/2] nbd: export dead_conn_timeout via debugfs
Date: Wed, 22 Apr 2020 05:00:17 -0400
Message-Id: <20200422090018.23210-2-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200422090018.23210-1-houpu@bytedance.com>
References: <20200422090018.23210-1-houpu@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NCvlLStm-pJ.A.hsH.cvAoeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/873
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200422090018.23210-2-houpu@bytedance.com
Resent-Date: Wed, 22 Apr 2020 09:18:20 +0000 (UTC)

As dead_conn_timeout could be changed by reconfiguring
a nbd device. Export it so user could find current value
of it.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43cff01a5a67..59c6ce2d2e43 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1597,6 +1597,8 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 
 	debugfs_create_file("tasks", 0444, dir, nbd, &nbd_dbg_tasks_ops);
 	debugfs_create_u64("size_bytes", 0444, dir, &config->bytesize);
+	debugfs_create_u64("dead_conn_timeout", 0444, dir,
+			   &config->dead_conn_timeout);
 	debugfs_create_u32("timeout", 0444, dir, &nbd->tag_set.timeout);
 	debugfs_create_u64("blocksize", 0444, dir, &config->blksize);
 	debugfs_create_file("flags", 0444, dir, nbd, &nbd_dbg_flags_ops);
-- 
2.11.0

