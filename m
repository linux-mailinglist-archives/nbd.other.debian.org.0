Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 786B977D4AF
	for <lists+nbd@lfdr.de>; Tue, 15 Aug 2023 22:58:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 64CA621DA0; Tue, 15 Aug 2023 20:58:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 15 20:58:17 2023
Old-Return-Path: <atulpant.linux@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 978AE21BFD
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Aug 2023 20:38:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LpkYUWbVYERr for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Aug 2023 20:38:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-x632.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 49AE220D9B
	for <nbd@other.debian.org>; Tue, 15 Aug 2023 20:38:08 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bdb801c667so36641165ad.1
        for <nbd@other.debian.org>; Tue, 15 Aug 2023 13:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692131884; x=1692736684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9ApbnI87Q8RNqPgxcxbxYleBLjFt36Eud/z8NM1Jfc=;
        b=Igj27S3Q1W7pnf91BSrgUhHYMac9KPTpHDNMOSpyjGg87YOqrM8yugbC9cQpM9wFZn
         ot905KzakQ/YUojEz0/la0PlQcexdTkV45EUPdQnKkunKIKgveO6JG3bv/6pgNYvalik
         UqWYSWuq+SbR1g1jX/emIsChbfQyWYnBmNKUlCtPFO0f3aUqGdJ8K3b4Y5KJS1me89BY
         3FVnSH4f22UmdGN4eSKRukmqoOtNH/T41pGJSB8pqMnVFiD1wWqL7fjuU2JYKmywif5N
         HeDbsn+VbosOa+pjWaRjS1lKO8IFSabcQ2uSHHGk16BiEO4Ihv9OrDdu4p4YEY+ESIr8
         jGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131884; x=1692736684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9ApbnI87Q8RNqPgxcxbxYleBLjFt36Eud/z8NM1Jfc=;
        b=fLO/0R1js1MDzE0ZVSYaLxvfwYXKkksI7U4iPSqbdyqMo2gMU7/NKBbXl7uREEWSCA
         zi6TvhJYjj36YW9/uw8t4+xYOlhkWl3RD0CmfgKVN0UeiPcI4kRXRU8Rf425qGowmy2q
         q0hxQeMIPKP9pF7T+c6GMpQjdgPRgG5IK2EG3jXvwAtiw8G97YqQyz3EZafS0Sb/GD4S
         YSy1O+nBR0qfUsZsQk3Q+BJzRom7bcwCzeMkQFJS7LyEBA2VxvRmDc5ulPR2jaTP08pG
         VbnRilA+S9D4cnI1Fu+CwwLtgdMiSx0AWLNO78fDh0smYMX7PgMkPup8I8fFqEYwoKNA
         vAzQ==
X-Gm-Message-State: AOJu0YxQ1QuNPCt5GD5pAw6AxP1ACFVU/lGXO+dNKHpxdCgltXzF+QiQ
	EpGEA9JuXLE324RR20766QU=
X-Google-Smtp-Source: AGHT+IHhUV8EaldMz7zWKp34yUjxtun7VSqtlbQQK+DzG0CXOWQECA3nlkJg7rjhLd5VtW+qDgr4YA==
X-Received: by 2002:a17:903:11c9:b0:1bb:ce4a:5893 with SMTP id q9-20020a17090311c900b001bbce4a5893mr17379711plh.30.1692131884499;
        Tue, 15 Aug 2023 13:38:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:db85:3caf:1429:e455])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902da8b00b001b9e9f191f2sm11492962plx.15.2023.08.15.13.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 13:38:04 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: Atul Kumar Pant <atulpant.linux@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	shuah@kernel.org
Subject: [PATCH v1] drivers: block: Drop unnecessary error check for debugfs_create_dir
Date: Wed, 16 Aug 2023 02:07:39 +0530
Message-Id: <20230815203739.51706-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yCcHpgIuAfO.A.3K.pb-2kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2629
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230815203739.51706-1-atulpant.linux@gmail.com
Resent-Date: Tue, 15 Aug 2023 20:58:17 +0000 (UTC)

This patch removes the error checking for debugfs_create_dir.
Even if we get an error from this function, other debugfs APIs will
handle the error value and doesn't crash in that case. Hence caller can
safely ignore the errors that occur during the creation of debugfs nodes.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 drivers/block/nbd.c     | 7 -------
 drivers/block/pktcdvd.c | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 65ecde3e2a5b..f64c79f6e112 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1666,11 +1666,6 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 		return -EIO;
 
 	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
-	if (IS_ERR(dir)) {
-		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
-			nbd_name(nbd));
-		return -EIO;
-	}
 	config->dbg_dir = dir;
 
 	debugfs_create_file("tasks", 0444, dir, nbd, &nbd_dbg_tasks_fops);
@@ -1692,8 +1687,6 @@ static int nbd_dbg_init(void)
 	struct dentry *dbg_dir;
 
 	dbg_dir = debugfs_create_dir("nbd", NULL);
-	if (IS_ERR(dbg_dir))
-		return -EIO;
 
 	nbd_dbg_dir = dbg_dir;
 
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 69e5a100b3cf..37cdd68c3de5 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -451,8 +451,6 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
 	if (!pkt_debugfs_root)
 		return;
 	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
-	if (IS_ERR(pd->dfs_d_root))
-		return;
 
 	pd->dfs_f_info = debugfs_create_file("info", 0444,
 					     pd->dfs_d_root, pd, &debug_fops);
-- 
2.25.1

