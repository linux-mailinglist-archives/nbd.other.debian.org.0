Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A993043934F
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 12:03:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 910BC20549; Mon, 25 Oct 2021 10:03:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 10:03:42 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CDA4720522
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 09:46:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fHB0rv3FIeXi for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 09:45:59 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x62d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C0C7320463
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 09:45:59 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id s24so3536544plp.0
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=av0r/rjVqFrB/l7qERXJM+4hS0XcNVLfoNKN5vMbJNg=;
        b=xOAqkrP0HrjsX48+je+o53PG2YVd8dM2nPjkvA1GW931f3/u7jXAHVCpoirZqe/36e
         0c6Ip65FUEezJbZXUhHsUzj7F0JGLaN4ZicNmtyiwJ2XjoQLaqHWtvZqyLm1ZKPFDh8x
         BTqcsT9KpbdcR7+ciDxVM2Ozoo5HpLIqiINTiDwMtVjySAEdH3tnObnRRyGJKaK7moQd
         wONL20McEcBXVnYZEq/zpPPd8SO0P7nLHHiRDXcKywelGZVbnTkdC6oV12p2hi4LsrCs
         NRFJct9KJnUoD0ImCkW+qfum8v/iHMrh6jxRBWTqDVtogoK+K9v4/XJrltN2HyBxfWuT
         fypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=av0r/rjVqFrB/l7qERXJM+4hS0XcNVLfoNKN5vMbJNg=;
        b=A8vyJOnYi1FVmOhbHNRy2f9TDsOVr0BAzdQqrGLpW5BxqhAcegOhwEIIi+4uFIXwDG
         c0sucl0PutateIeAMxja+d9OkK6ND40icUXMYAKbDKb8bpBAokIbkaqZzkXXBB2PtTY3
         EHbmhEhjGB4M3+s3abI6NVcVzlNnaaVTK9nHE7oWCEmH2C7QuhWwb7CQJtk4rmxe0p7p
         9N80O+80hknZne2T/1/LJvfg2tQsMRyV2Zl3RtU0OPtxn2EUSA0N9/g4+CP8VLKDrKXl
         1Fw0hYRFdBQH5UPmsSX9dJeZPg9NYvFKd2dypmVnXlOjXLKiKTlc1KDgO3Ij60K59D/s
         zCYA==
X-Gm-Message-State: AOAM531qUnfcVmfxSIEoIIkY/tRYNSvN57P7zln0tEDI4fnwiPx9oIHN
	VXb38WPviR+LmHnTgM2wL7p9
X-Google-Smtp-Source: ABdhPJy6XTgail4CfgzGrXE97eq+6+UO+3FgXOYxCk4f+rRZvdp0T/8Yqnm08YBSmOhKEQoi7f/JyA==
X-Received: by 2002:a17:90b:1d08:: with SMTP id on8mr34553738pjb.25.1635155156410;
        Mon, 25 Oct 2021 02:45:56 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id oj5sm7404319pjb.45.2021.10.25.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 02:45:56 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	hch@lst.de,
	josef@toxicpanda.com,
	mst@redhat.com,
	jasowang@redhat.com,
	stefanha@redhat.com,
	kwolf@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 3/4] loop: Use blk_validate_block_size() to validate block size
Date: Mon, 25 Oct 2021 17:43:05 +0800
Message-Id: <20211025094306.97-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025094306.97-1-xieyongji@bytedance.com>
References: <20211025094306.97-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lwFjGh_Y5WC.A.6TB.-DodhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1564
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025094306.97-4-xieyongji@bytedance.com
Resent-Date: Mon, 25 Oct 2021 10:03:42 +0000 (UTC)

Remove loop_validate_block_size() and use the block layer helper
to validate block size.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/loop.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 7bf4686af774..dfc72a1f6500 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -273,19 +273,6 @@ static void __loop_update_dio(struct loop_device *lo, bool dio)
 }
 
 /**
- * loop_validate_block_size() - validates the passed in block size
- * @bsize: size to validate
- */
-static int
-loop_validate_block_size(unsigned short bsize)
-{
-	if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
-		return -EINVAL;
-
-	return 0;
-}
-
-/**
  * loop_set_size() - sets device size and notifies userspace
  * @lo: struct loop_device to set the size for
  * @size: new size of the loop device
@@ -1236,7 +1223,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	}
 
 	if (config->block_size) {
-		error = loop_validate_block_size(config->block_size);
+		error = blk_validate_block_size(config->block_size);
 		if (error)
 			goto out_unlock;
 	}
@@ -1759,7 +1746,7 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	if (lo->lo_state != Lo_bound)
 		return -ENXIO;
 
-	err = loop_validate_block_size(arg);
+	err = blk_validate_block_size(arg);
 	if (err)
 		return err;
 
-- 
2.11.0

