Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B243B4FD
	for <lists+nbd@lfdr.de>; Tue, 26 Oct 2021 17:00:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B11520381; Tue, 26 Oct 2021 15:00:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 26 15:00:21 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CD9C42043C
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Oct 2021 14:42:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SkghYYaLvv7T for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Oct 2021 14:42:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1034.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6838C20433
	for <nbd@other.debian.org>; Tue, 26 Oct 2021 14:42:57 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id x1-20020a17090a530100b001a1efa4ebe6so1462896pjh.0
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TqXG0/tzAMme0lqJcgyNBNW84HzqzOSloOMxwNDMqnk=;
        b=4Uoy2ivd6uzyXo6Bmv0aXm5MmnUwpA6xwiPFquzbRkZTyRRY4UNetOEgSK4I/+I4Hs
         cKQMXQyeDPDR7Z3/e/VHdvzK8auY822368Vkua5jFt2pNRX6WElVvi56m1PXXALhq7Q5
         9MjGbof65vT4ZVYTsd2S1lNtt8tiNb0TNEVSVjR/FvRhJBKKd/RBuNLBb45aTezTh7ie
         rHGEwVnlQijC58C7l1SfEHHSIamwkhqqqS5HB2+qVofIJYZBIxWuDAAdXa0VKZi3vf3g
         7xiCe/YNR030jxAwfiyg+eYkDC8rHzxyNa7ezPLc9GdF7B/KXWS7ZNVuRUvwSiKaX/kA
         YKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TqXG0/tzAMme0lqJcgyNBNW84HzqzOSloOMxwNDMqnk=;
        b=5A2tU3eDtcKynX4+1A8vj6woND6gzYgVp3U2cUtHnit5dJlPHCSAyauyM2TmmU4VWF
         Tk0fjRoMAWY7iPehx/lH0YWrMObuScOacFSzscCiB9lRt9EUfEh1r1ABVsZuzNKyyZqt
         rmXT43DeTeehuQ9G1yf5eymf0FPwapo6xTaY42S+wC4jxuSnLTipwWGChVKnM7yggQdh
         oFlNpKiRIvECTGbQHABABkCxDiKL3qa39jv2P89l8PCAntwkgbtZI4kNZnNVf2dGXeEh
         xBL1XrONKNJX597qvSkh129+hVZASvN133e6/8+kiKCXrlORYy2xqYfyPy6+09fJjKup
         cQfA==
X-Gm-Message-State: AOAM531evBU1nJB0EFFVTFsjeE8ZkR2a6CauraKy3vVzbIo3IHHallZv
	bwqtbUW/cB0uUgBjWsoaGUcd
X-Google-Smtp-Source: ABdhPJxDwzTaNXwa8zQVleZVpvYopPJy2hn0TFeAdTDt/zvKmOazBfBhS7NJeIu2hl6KbdFN99IGQQ==
X-Received: by 2002:a17:90b:4c41:: with SMTP id np1mr40155366pjb.18.1635259373880;
        Tue, 26 Oct 2021 07:42:53 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id j19sm3396218pfj.127.2021.10.26.07.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:42:48 -0700 (PDT)
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
Subject: [PATCH v3 1/4] block: Add a helper to validate the block size
Date: Tue, 26 Oct 2021 22:40:12 +0800
Message-Id: <20211026144015.188-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026144015.188-1-xieyongji@bytedance.com>
References: <20211026144015.188-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vNzmr-Q5XqH.A.YeF.FgBehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1578
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211026144015.188-2-xieyongji@bytedance.com
Resent-Date: Tue, 26 Oct 2021 15:00:21 +0000 (UTC)

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

