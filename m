Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB09949188
	for <lists+nbd@lfdr.de>; Tue,  6 Aug 2024 15:31:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9FA80205B1; Tue,  6 Aug 2024 13:31:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  6 13:31:33 2024
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A80D420580
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Aug 2024 13:31:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pnvo4ttlxqvw for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Aug 2024 13:31:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 554AE20547
	for <nbd@other.debian.org>; Tue,  6 Aug 2024 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3rHWsnZQI00onpRkU1ccFvqkYqofNkevl1X51tyBwPQ=; b=hSFpjyeSfnk+ZH3lxfFkFu0for
	3sF52lRNjW3fliXat9Ook9xhpayt5iRp3kH0v8nyHRtN2n8syn0C0IAGoYQ8fVLDBNgc/bdYonbYH
	0WEBsouGDYGuFVYPgsvCez/BMhZA6q5Kl5+ZCzagK1Z5I4aP/3VMyV/ySy2n1zkX4qsELnjRoTL/x
	K9SJpB40bQW8j9ltKHamgvwjg+WXii965qkaaMWEX7MIPkha9RZxUL1kweq4zHLCvbQdzp3Mwh5uY
	Ff1Pl75NnjScsG09NKvAdR0Z0njWLN7HAykDOZ1IftByYD9gFCXkNT9yTdK4qxL00y6xj2++xK7/h
	f21thkQA==;
Received: from [196.251.239.242] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1sbKHT-00HZHU-39;
	Tue, 06 Aug 2024 15:31:15 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <wouter@grep.be>)
	id 1sbKHP-000000017kg-3K8h;
	Tue, 06 Aug 2024 15:31:11 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Wouter Verhelst <w@uter.be>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] nbd: nbd_bg_flags_show: add NBD_FLAG_ROTATIONAL
Date: Tue,  6 Aug 2024 15:30:55 +0200
Message-ID: <20240806133058.268058-2-w@uter.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806133058.268058-1-w@uter.be>
References: <20240803130432.5952-1-w@uter.be>
 <20240806133058.268058-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XFaoRKlvcWI.A.ZT6M.1WismB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3122
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240806133058.268058-2-w@uter.be
Resent-Date: Tue,  6 Aug 2024 13:31:33 +0000 (UTC)

Also handle NBD_FLAG_ROTATIONAL in our debug helper function

Signed-off-by: Wouter Verhelst <w@uter.be>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 58221b89965d..20e9f9fdeaae 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1714,6 +1714,8 @@ static int nbd_dbg_flags_show(struct seq_file *s, void *unused)
 		seq_puts(s, "NBD_FLAG_SEND_TRIM\n");
 	if (flags & NBD_FLAG_SEND_WRITE_ZEROES)
 		seq_puts(s, "NBD_FLAG_SEND_WRITE_ZEROES\n");
+	if (flags & NBD_FLAG_ROTATIONAL)
+		seq_puts(s, "NBD_FLAG_ROTATIONAL\n");
 
 	return 0;
 }
-- 
2.43.0

