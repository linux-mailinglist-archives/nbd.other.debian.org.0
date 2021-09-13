Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6A408A75
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 13:42:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BA5D8203AF; Mon, 13 Sep 2021 11:42:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 11:42:21 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F0E502037F
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 11:26:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mugpr0Omfbg5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 11:26:44 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x531.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B3E1620378
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 11:26:44 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id w7so9132408pgk.13
        for <nbd@other.debian.org>; Mon, 13 Sep 2021 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tzLNfeO+n0foX98RPjWTA3+lfxpTVqBrYMUe0GRh7SU=;
        b=PG0vv+H5Za0VKb8uOvX3ipBRLKdvD5bl4aXDoQxNgWwDJGh1OEM8ueADiTW8IGQp7d
         2BG2vaztqzHdpuxL2R4IotR8WFmANrqW3fBHq/HWEcAhgX/rvaX0nZP1Ms6zNyoQBSs0
         eQC/wWg7kZJKx5C7YRfyTC8/JYaP6dISK98TH5qsn1E8fLNrayw+nFUnrmQ5x35qQSKj
         aNdHoTrUAD9c1qsHiXq+pMGe0AVcVnfxeUQkNj3usDKpRkW9rTpQ0JYKz4XnIizoDAtn
         SkJ8JaPPekPr5nOyrlGEqVDYxXpxqRot6qYnQNXv+KzyoUXg4+NucNiRo4XX19tZQkRs
         qC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tzLNfeO+n0foX98RPjWTA3+lfxpTVqBrYMUe0GRh7SU=;
        b=c14xNMfIRuc9dVUImuBUvZsKBkgZjn9G/uXU+UNGjGSdZFGFtiZmqePX03HjoVorBh
         rBsdXdbAeTAOThFhfCCDX0i4OBzmk2Vus2TSWPdnG2ExXdGwvdhzBVIcdpVaiCDQTV2Z
         B+NOmB8fz0LfldagGI3BMReDcrxLWPjpzOT1IxwIwFGbYKSyqxHDCHeVbi4yuu/YVWyE
         INfGdhAqSmuI8IfD8uSGck5C4cqzJn7rU9hOHWFcP01gqb+1Sr0YhgJCukCTWIKoxYuT
         SDiNphl0v+40z8tqmpB5vS7b1GZMa9C6w7Pyo0q9Dtv26pZOBQtLl4/zHymephc/NiuJ
         ijFQ==
X-Gm-Message-State: AOAM530XWQdi+4C4UPW78MuoUNUFyzyjtraYj1zuq17GoT6kkrawjH19
	ZK4fikCc5kQUVWhMPdB+vYI6
X-Google-Smtp-Source: ABdhPJzgSOxBcJDVxyO4TEFgwoDf4k/KwWRbBl0bbS+KaFcGrmhrZVRcUEICjnW1ouQe0OqHDEXIGQ==
X-Received: by 2002:a63:e40a:: with SMTP id a10mr10881599pgi.414.1631532401307;
        Mon, 13 Sep 2021 04:26:41 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id n26sm7009660pfq.44.2021.09.13.04.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 04:26:40 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH 1/3] block: Add invalidate_gendisk() helper to invalidate the gendisk
Date: Mon, 13 Sep 2021 19:25:55 +0800
Message-Id: <20210913112557.191-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913112557.191-1-xieyongji@bytedance.com>
References: <20210913112557.191-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Beq5lDRMhPB.A.08C.dkzPhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1435
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210913112557.191-2-xieyongji@bytedance.com
Resent-Date: Mon, 13 Sep 2021 11:42:21 +0000 (UTC)

To hide internal implementation and simplify some driver code,
this adds a helper to invalidate the gendisk. It will clean the
gendisk's associated buffer/page caches and reset its internal
states.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/genhd.c         | 21 +++++++++++++++++++++
 include/linux/genhd.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index 7b6e5e1cf956..7d97fb93069a 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -601,6 +601,27 @@ void del_gendisk(struct gendisk *disk)
 }
 EXPORT_SYMBOL(del_gendisk);
 
+/**
+ * invalidate_gendisk - invalidate the gendisk
+ * @disk: the struct gendisk to invalidate
+ *
+ * A helper to invalidates the gendisk. It will clean the gendisk's associated
+ * buffer/page caches and reset its internal states so that the gendisk
+ * can be reused by the drivers.
+ *
+ * Context: can sleep
+ */
+
+void invalidate_gendisk(struct gendisk *disk)
+{
+	struct block_device *bdev = disk->part0;
+
+	invalidate_bdev(bdev);
+	bdev->bd_inode->i_mapping->wb_err = 0;
+	set_capacity(disk, 0);
+}
+EXPORT_SYMBOL(invalidate_gendisk);
+
 /* sysfs access to bad-blocks list. */
 static ssize_t disk_badblocks_show(struct device *dev,
 					struct device_attribute *attr,
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index c68d83c87f83..a3b2f6b1b7e8 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -221,6 +221,7 @@ static inline int add_disk(struct gendisk *disk)
 	return device_add_disk(NULL, disk, NULL);
 }
 extern void del_gendisk(struct gendisk *gp);
+extern void invalidate_gendisk(struct gendisk *gp);
 
 void set_disk_ro(struct gendisk *disk, bool read_only);
 
-- 
2.11.0

