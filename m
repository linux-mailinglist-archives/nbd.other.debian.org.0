Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BB42A43934E
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 12:03:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9E2802053B; Mon, 25 Oct 2021 10:03:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 10:03:31 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B86C520529
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 09:46:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.02 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iYkJF6vc3-kR for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 09:45:56 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x435.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 34CCE20522
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 09:45:56 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id x66so10175928pfx.13
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z+Z7xBwuEdiDo3yfPlLotr1uBNzHqi96x2Qr+oepBsg=;
        b=15U6o0BRYIjxKzdZQ9qlzBcMsGkmDKOqIlUj4DEIpH35tgQ9ByQuIOF2gOd2SrPOVK
         WLBWo5HGkc4gYHNzfAL3QJBcdShi2dMQrpMTV1/Dt1OXzHv8GQW/HT/XNYnYIFsYIcJ0
         ayswLcHqMl8yATnLNE720OJEsvVIPJ9F1Z5Z/ogPkQyeV6QcBqUpC6PFUn6SxOFP1055
         Ywo76qs1XQZPFmCmC2G3Dm1BZUQ6ncLkF42kqH7q0K9PXJJcDQ69Jx4HqlM/IOMjkq1b
         bMFPVAOfDR3pZb/IAYh7daWLvSpY1KoLmDTnQ87l5dJHaErhupAYRbdo6TqWxo5GCmjS
         /LZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+Z7xBwuEdiDo3yfPlLotr1uBNzHqi96x2Qr+oepBsg=;
        b=k2cvDPb8II/UdxPGrcaHQsFHunXI3B+9b1Rbpjp7sR75qyMqOiw51X38WjNznCJMVn
         Uzk9+EfTWAcmcGetVCciLKNaRK2/vEmKQpjARLok84wRhXAVubu6lYsYrvth2ER2ouJ8
         FiNR8l6UGnfH6AzvwaCyBh5PI9wrCdCN/8NqLl03jaKxteS8PLnrbbaZU6mJrMTzaa/v
         PmD8OZJvKdIFLOQ7dpei0A+6NMwrmqyTYp3qj4dvpqhQla4ta8ZgmtIbqcYmOS71NTv1
         Yl7W2a4EPhQDQ+rxF3cMIffQKMs3+Vu7uKZveBFfK3AjRCIOkbCm/Fi93GbYDZ9jrGwz
         eaSQ==
X-Gm-Message-State: AOAM531a3KEQOPOYBBi6XjJc+2nZgLcAkGdx0Ar1p6SSM/QEMMb3VM/U
	tNNPOeaGeGjAsnto3NwOaV+b
X-Google-Smtp-Source: ABdhPJyX2r+nUzD6cxyL3ncyEb6QxB6hw/+2sEZG0Mfnx94HOreDWdGH+gtwePOJc0jGFKfTH9/gjA==
X-Received: by 2002:a63:131f:: with SMTP id i31mr12758784pgl.207.1635155152846;
        Mon, 25 Oct 2021 02:45:52 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id s13sm20840212pfk.175.2021.10.25.02.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 02:45:52 -0700 (PDT)
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
Subject: [PATCH 2/4] nbd: Use blk_validate_block_size() to validate block size
Date: Mon, 25 Oct 2021 17:43:04 +0800
Message-Id: <20211025094306.97-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025094306.97-1-xieyongji@bytedance.com>
References: <20211025094306.97-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <T9j2JzJ624P.A.sRB.zDodhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1563
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025094306.97-3-xieyongji@bytedance.com
Resent-Date: Mon, 25 Oct 2021 10:03:31 +0000 (UTC)

Use the block layer helper to validate block size instead
of open coding it.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 1183f7872b71..3f58c3eb38b6 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -323,7 +323,8 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 {
 	if (!blksize)
 		blksize = 1u << NBD_DEF_BLKSIZE_BITS;
-	if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
+
+	if (blk_validate_block_size(blksize))
 		return -EINVAL;
 
 	nbd->config->bytesize = bytesize;
-- 
2.11.0

