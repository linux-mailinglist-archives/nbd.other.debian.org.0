Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C56771514
	for <lists+nbd@lfdr.de>; Sun,  6 Aug 2023 14:42:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DBC942083B; Sun,  6 Aug 2023 12:42:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug  6 12:42:15 2023
Old-Return-Path: <atulpant.linux@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6605A207F0
	for <lists-other-nbd@bendel.debian.org>; Sun,  6 Aug 2023 12:24:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.089 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dmwmYLA59HIg for <lists-other-nbd@bendel.debian.org>;
	Sun,  6 Aug 2023 12:24:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pf1-x42d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 19787207F3
	for <nbd@other.debian.org>; Sun,  6 Aug 2023 12:24:03 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686c06b806cso2375646b3a.2
        for <nbd@other.debian.org>; Sun, 06 Aug 2023 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691324640; x=1691929440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0OP3sZeafU4m0UvmTlOzrFMO40KUOq+JpcUSvznD7bw=;
        b=rlM0y2UFWX5yMGImUCu9Uzd/HOr6asy+NiIwL5GVuh7acTg7rjT8i3fEt7Dx0N9LcK
         ZLTDcXd6ew4TMQTZrJIUk2NlrHrkVpgv1LNjmzcVSyqmtKdDLcx4mCy5IAJKOHYmwVBs
         OUwqNmiw3kiDk9cA+0xhjBERUpIwv+lI3FGGaxUbxvIhdb2P70Zz44Zv02KQ6HTkZ3Pt
         YGqTmdNnfvijvXL9Xyy/n62BQA0rBJ5NeXd1zfvMMNYb+ZeQuuv1SfXFzZxVpNI9APtW
         cjA/QxqvcoEaFWJYFTOUXh+sHe39sKJZS9Bu5QoDxg0jp2XZ6gmey5B/ocJMi0T0itA+
         SDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691324640; x=1691929440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OP3sZeafU4m0UvmTlOzrFMO40KUOq+JpcUSvznD7bw=;
        b=VG2WGH3JjeofEm5Wz+nE1xypeRVNu7q7nFNZPH2HaeDrPtoo2c/jVdOJODXlDDm6e1
         JsRO2WXTVaz+L1HJbD8FTCk4g1fZDUyViKlbJpKrWF/omPQaF4UN5i1PuAQLn/b9UltG
         tg6Y2ueuTG93Z9W5/uDw1CBdl9KGrs9Zf1HH30sFVaMTaeegJ9JGXIfvErt30dUxdv8o
         AfFZLLVI6QE+vw6V4gVGw6tuLh79QJ+xTI9yD+p67rwS2PZoSs6mb2zWO0wRxQclWsOk
         QtO9seRnUBo/8L+Pee8NFlgLQ7MSx30TAIV2Pb7KKFa3e748MMgBjwGsSLOxcH0lvwKU
         07uA==
X-Gm-Message-State: AOJu0YwOFYQOYYlurCiR3KdS8DajqjajNVayxdrWG7cN6n0FmHqaRSR0
	vsFq3DlEbH8gUBvOP8+pH3s=
X-Google-Smtp-Source: AGHT+IFr1bZnirGJUFRnxXC9TXA6S12TQZZnJCcuPAvKxdcjo7aby1bQ6E/0zdEL/4qy7x9DgHi4ug==
X-Received: by 2002:a05:6a00:2495:b0:66c:9e97:aece with SMTP id c21-20020a056a00249500b0066c9e97aecemr5796227pfv.10.1691324640150;
        Sun, 06 Aug 2023 05:24:00 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:3a2a:ee75:10eb:7534])
        by smtp.gmail.com with ESMTPSA id p26-20020a63741a000000b0054f9936accesm3540570pgc.55.2023.08.06.05.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 05:23:59 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: Atul Kumar Pant <atulpant.linux@gmail.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	shuah@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v1] drivers: block: Updates return value check
Date: Sun,  6 Aug 2023 17:53:51 +0530
Message-Id: <20230806122351.157168-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4JuemXyF_bG.A.YIE.nU5zkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2592
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230806122351.157168-1-atulpant.linux@gmail.com
Resent-Date: Sun,  6 Aug 2023 12:42:15 +0000 (UTC)

Updating the check of return value from debugfs_create_dir
to use IS_ERR.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 drivers/block/nbd.c     | 4 ++--
 drivers/block/pktcdvd.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9c35c958f2c8..65ecde3e2a5b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 		return -EIO;
 
 	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
-	if (!dir) {
+	if (IS_ERR(dir)) {
 		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
 			nbd_name(nbd));
 		return -EIO;
@@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
 	struct dentry *dbg_dir;
 
 	dbg_dir = debugfs_create_dir("nbd", NULL);
-	if (!dbg_dir)
+	if (IS_ERR(dbg_dir))
 		return -EIO;
 
 	nbd_dbg_dir = dbg_dir;
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index d5d7884cedd4..69e5a100b3cf 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
 	if (!pkt_debugfs_root)
 		return;
 	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
-	if (!pd->dfs_d_root)
+	if (IS_ERR(pd->dfs_d_root))
 		return;
 
 	pd->dfs_f_info = debugfs_create_file("info", 0444,
-- 
2.25.1

