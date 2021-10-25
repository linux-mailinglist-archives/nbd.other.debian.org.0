Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CAC4398DD
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 16:42:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E377B2047C; Mon, 25 Oct 2021 14:42:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 14:42:32 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0FA1A2036A
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 14:25:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jRY-H1kGIxje for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 14:25:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x632.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 50A7A20367
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 14:25:27 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id v16so2665695ple.9
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TqXG0/tzAMme0lqJcgyNBNW84HzqzOSloOMxwNDMqnk=;
        b=ci5vKvt7MPVkFEOn/vdkYki+HHpreHpMUojahpuEUMkbCwTji7lH6Vg3wrB7GgUMEB
         Pbft2KjLVDtLw+SaufMtTrDdh752x/eNenzHDSkp9Z86nXZOEYia/FSnnqXnQasWpeXX
         iGobot9Ge/UjPYLrKVrSveN3w/51aVWafnYZznqhbYkklsZCDhEJCd8hKjEFs71P1+ZM
         NwMKY9w43ZqCGs5981N7CdtgaOvWQAeV61HGNQ3TFKpXicjEeunTj5kKiZhNUnIuF36G
         P1mgt4VNT0KsnqTKqcN9a900U+bFba/aedd1voCItjyvKk6HKPW0EM6elCe99FkrrRDW
         drEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TqXG0/tzAMme0lqJcgyNBNW84HzqzOSloOMxwNDMqnk=;
        b=mGconiJZbhb7/zXCzOhAf/6Pg4r+HFdYM66VQMaipy8R8sO0MrZShaxMqXObkZA6Fi
         UqJ4BSlhfE2ZyUZxh5Uq/qyqVVFlqhRSYP2mXUmvCrI7PpyNyMIkoty+6BKgoeGqnKCv
         zjNnJKdIh1qqswWaaXbMSvMmMW7AdPga/eMwSmPLn7oWmBgXjLUGdyvWcXw+psdrfS8X
         SSmnfVwRO1UD8hjKmLhTTASxBfQdRfIiAPunVsj2Ceh/Cb61zatlFmiXFqBLJOJP9+Bu
         KSonqlRqsFmRJaAIVieRcnr4ZZwHqg0MSU1DjYR5IEwgA4vh49yHtdydHxqfEfUFCZ36
         POCQ==
X-Gm-Message-State: AOAM533Jsphzs4/ZHCCYxaNzbtV7Vx3x2yzc//EpjDfldPdA/tIenwcW
	CXFYyDY4P8bPVHbvd9ggv4IR
X-Google-Smtp-Source: ABdhPJzQBWheUx42D4ZY8nK9BboMGGe2OJYiojH/SBj6h2EEIRDnE81SpikbXuVrnIafRrI2f90kZA==
X-Received: by 2002:a17:902:9b8a:b0:13f:c286:a060 with SMTP id y10-20020a1709029b8a00b0013fc286a060mr16366368plp.66.1635171923857;
        Mon, 25 Oct 2021 07:25:23 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id t3sm16393327pgo.51.2021.10.25.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:25:22 -0700 (PDT)
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
Subject: [PATCH v2 1/4] block: Add a helper to validate the block size
Date: Mon, 25 Oct 2021 22:25:03 +0800
Message-Id: <20211025142506.167-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025142506.167-1-xieyongji@bytedance.com>
References: <20211025142506.167-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rFJB58jsS_D.A.TKH.YJsdhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1569
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025142506.167-2-xieyongji@bytedance.com
Resent-Date: Mon, 25 Oct 2021 14:42:32 +0000 (UTC)

There are some duplicated codes to validate the block
size in block drivers. This limitation actually comes
from block layer, so this patch tries to add a new block
layer helper for that.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 include/linux/blkdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 12b9dbcc980e..805cd02d7914 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -235,6 +235,14 @@ struct request {
 	void *end_io_data;
 };
 
+static inline int blk_validate_block_size(unsigned int bsize)
+{
+	if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
+		return -EINVAL;
+
+	return 0;
+}
+
 static inline bool blk_op_is_passthrough(unsigned int op)
 {
 	op &= REQ_OP_MASK;
-- 
2.11.0

