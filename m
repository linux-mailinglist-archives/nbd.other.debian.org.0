Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F314398E0
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 16:42:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0839F2047A; Mon, 25 Oct 2021 14:42:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 14:42:56 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C153C20367
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 14:25:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iN8s6Pzfdx6u for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 14:25:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x102a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 48C9A20346
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 14:25:36 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id fv3so2401475pjb.3
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=av0r/rjVqFrB/l7qERXJM+4hS0XcNVLfoNKN5vMbJNg=;
        b=x+zZ0eT2uie+47FbGcJT8mHH+XjW/4Ds3sjIAGgjAuF2E93R6vyPWhEmp75duwvgDu
         b9f+IjX290S6wRBGAzLK2zKpz2gMrmZkB5Wuzx67N7Qra6cOdsjog7MAk8Kveq9jeDi1
         LDvOAXPjAE5GcIf6PJaWaviYiIDwnZsPxa2/x0ENnVH0C2DIpToPlsmUFg6zTjQeCkso
         UZjfP66tbd9MJ/aPd6ajIU8I9WaweWquuEhyWN3c3y59n3axDr9pXBsSZ8RrFbY+trpQ
         qqP5Xbky4kw+ORXJKs5EVwysoe7NULRJ28tlgijvLYWwwL+Z8HAJaAuZUopEXNhHiagW
         FXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=av0r/rjVqFrB/l7qERXJM+4hS0XcNVLfoNKN5vMbJNg=;
        b=YTfezTPZweg55w7lPJUNgqwxDMz1MQRji9Vi+7Hk4zK7ScKIh/UWuZgMWW74IROXSD
         ahWTz5uZ625un1TeVbXHTJ7W539uYCcRMawF2qkHYiCsZbJihmTrW7TB9K5KiXqGUk3p
         TSl2gZrZ3N/mvmxuX0recNrOogdKM9+D80Q93fytQBliFmKkrCRW2ZFiEPuKJLBSin6F
         uJXYsvGdy3w0fuFNQNfDMOdDgK5l1W80Lg+Cmv30+EyCY+UqTobjECc81aDHzkTWTzOc
         s+lV8LXINYv7KFWvAScSVqBsFQbMQSmuJ8sPDBzAFsgya06S3+VRSfkqH/FYOJzVXnC/
         fv7A==
X-Gm-Message-State: AOAM5321jXYqB4Nd+YroZlCiCmZgr9qtGx+9lO4CGimf/n39egcn0WSp
	e7NRjDx37F+hBIbTQEZjjdtQ
X-Google-Smtp-Source: ABdhPJyhiVjNl7b9fz60gTx056u54hm+xBqxLbAE1GxLDhDkOva6CNRgvBIx+2Wgf5QcgiqLOfic2w==
X-Received: by 2002:a17:90b:2248:: with SMTP id hk8mr21042080pjb.102.1635171932763;
        Mon, 25 Oct 2021 07:25:32 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id c8sm17270047pgn.72.2021.10.25.07.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:25:31 -0700 (PDT)
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
Subject: [PATCH v2 3/4] loop: Use blk_validate_block_size() to validate block size
Date: Mon, 25 Oct 2021 22:25:05 +0800
Message-Id: <20211025142506.167-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025142506.167-1-xieyongji@bytedance.com>
References: <20211025142506.167-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kId4cDZKwbJ.A.nOH.vJsdhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1571
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025142506.167-4-xieyongji@bytedance.com
Resent-Date: Mon, 25 Oct 2021 14:42:56 +0000 (UTC)

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

