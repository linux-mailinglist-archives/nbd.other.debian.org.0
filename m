Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5E4149CA
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 14:54:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A0C6B20C58; Wed, 22 Sep 2021 12:54:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 12:54:21 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CDBA920BD2
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 12:37:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6Ht6Pl7zeS6H for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 12:37:55 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1034.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 790CE20BBE
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 12:37:55 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id p12-20020a17090adf8c00b0019c959bc795so2180286pjv.1
        for <nbd@other.debian.org>; Wed, 22 Sep 2021 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b9H/YcNe1Su6v+wAcfOK/V9t4tOEyD2Zp8GPh0hUJH8=;
        b=GVylT1NldRLz2LWSYbYrzix54Fy6cssx1KG0Dlymj6MxJf5fs1Jg/WPQfp6AR/UWrJ
         4G9vxn5QQRv7gjG30oBMcK14+KG7tpTQBo+IlRzMfN81+Qr1QTZEiZd0Wv1YA1L73+CG
         NGNYV4mLo82OVz95Ed+EH2Vgl/xQx41F+dhEbkQD5DvdpUYiMovYkui6z6s/8+Y5SfdT
         pilKqxBfZHq/iN2yShFzoWy8vF3xtyPGl8t8lC+1pXJou4jq+HpqyG6BrMma4VN+xfin
         keXVfHLPD0iRvDCux0gJL5OHfNobmbxn2daGazJe2axRZQ3JrIRmbVslKAzJXKJIxSae
         A8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b9H/YcNe1Su6v+wAcfOK/V9t4tOEyD2Zp8GPh0hUJH8=;
        b=yzLbr9jQfYEweuoPuh2h/nkTSCaGzpk+EH3aNjPp0POJPnNcHv62ejikPduQZgr8MP
         awsKnqXSBMLpz4Mj53zztCDdiLjhEp6GGdOUFcZpZYidwSzbeSVgfP84PXeJcHzWVRYx
         GFaHW4KbBcDZQBd5OzXSNLVA9hggjZ1F0h6cqs2Tn2GlU/4WgzoQZkEArN9m2MSA4rmV
         pzCqV+csPJ6MHm7JdJjNmp78knfuwLxAKN55UU1EYnyXMyZjJ5XbLr9jfh2JKhQnI6Mi
         DtqjbC7wy7bagO3I3zK0E3wOMhsbvoiEpOSNl92GCyqSRHjFYC6PHPirlzQZ38A+3Hx7
         pW1Q==
X-Gm-Message-State: AOAM530cxnINZ8CSFB28xLKh0ZyksdXNzVCgVB4ox05eKx85x5vZE93x
	pxsdyxUtlqGvRUYukNz99iZW
X-Google-Smtp-Source: ABdhPJzWj6ckkva6gfc1tWPCOz5uAGu3XwQ4XiAYiv1dEbfGvfJxZFTKKZFBnIjJnRW/D0FprXn7gg==
X-Received: by 2002:a17:902:e153:b0:13b:63ba:7288 with SMTP id d19-20020a170902e15300b0013b63ba7288mr31284297pla.33.1632314271853;
        Wed, 22 Sep 2021 05:37:51 -0700 (PDT)
Received: from localhost ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id g8sm2477038pfv.51.2021.09.22.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:37:51 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH v2 1/4] block: Add invalidate_disk() helper to invalidate the gendisk
Date: Wed, 22 Sep 2021 20:37:08 +0800
Message-Id: <20210922123711.187-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922123711.187-1-xieyongji@bytedance.com>
References: <20210922123711.187-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MZdSD4rGL6.A.jP.9dyShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1520
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210922123711.187-2-xieyongji@bytedance.com
Resent-Date: Wed, 22 Sep 2021 12:54:21 +0000 (UTC)

To hide internal implementation and simplify some driver code,
this adds a helper to invalidate the gendisk. It will clean the
gendisk's associated buffer/page caches and reset its internal
states.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/genhd.c         | 20 ++++++++++++++++++++
 include/linux/genhd.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index 7b6e5e1cf956..876c0e478baf 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -601,6 +601,26 @@ void del_gendisk(struct gendisk *disk)
 }
 EXPORT_SYMBOL(del_gendisk);
 
+/**
+ * invalidate_disk - invalidate the disk
+ * @disk: the struct gendisk to invalidate
+ *
+ * A helper to invalidates the disk. It will clean the disk's associated
+ * buffer/page caches and reset its internal states so that the disk
+ * can be reused by the drivers.
+ *
+ * Context: can sleep
+ */
+void invalidate_disk(struct gendisk *disk)
+{
+	struct block_device *bdev = disk->part0;
+
+	invalidate_bdev(bdev);
+	bdev->bd_inode->i_mapping->wb_err = 0;
+	set_capacity(disk, 0);
+}
+EXPORT_SYMBOL(invalidate_disk);
+
 /* sysfs access to bad-blocks list. */
 static ssize_t disk_badblocks_show(struct device *dev,
 					struct device_attribute *attr,
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index c68d83c87f83..ea815feb3626 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -222,6 +222,8 @@ static inline int add_disk(struct gendisk *disk)
 }
 extern void del_gendisk(struct gendisk *gp);
 
+void invalidate_disk(struct gendisk *disk);
+
 void set_disk_ro(struct gendisk *disk, bool read_only);
 
 static inline int get_disk_ro(struct gendisk *disk)
-- 
2.11.0

