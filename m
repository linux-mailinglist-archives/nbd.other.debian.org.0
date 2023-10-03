Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC417B6D68
	for <lists+nbd@lfdr.de>; Tue,  3 Oct 2023 17:48:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2946620633; Tue,  3 Oct 2023 15:48:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct  3 15:48:22 2023
Old-Return-Path: <BATV+2bb34a1ebb2c389c9bab+7345+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8085820687
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Oct 2023 15:31:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.85 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bNIWDefw38lN for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Oct 2023 15:31:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 803FA2067E
	for <nbd@other.debian.org>; Tue,  3 Oct 2023 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=/LG92AyoogL6wVS5Dlap2fK3Op49TorhbTYoOe3dNAA=; b=slbbNCPrrLxDFfP2ymPbcu2gXs
	U3GdfNwNDXKx0Xq+jgIZP2vRY0QDKNAEbJDJ9fQiz5vqg+lK8KZo+/o0xEGSdP2TtGPxx2Iz5M6uX
	hPmCKdRUivDjet12aOaKizZaSh2FTrRtWEYUhUe6n+4rsGYfBa1ErwcISg3cicRPd+YRjv+m4uPzc
	b9cYT2pgV80O/KVcbW0nhObUMMqsBvMPC7usHIX3Ak9/KHzs5bT4PDFuQnUNDet0NCSiwZGxGqwb0
	F3KISXUgEr0qgJXbX4YBL0jXtwQLoJcJtOpt9RbAVdTPXfk2KVkCgQuxtKE1IztsK0md/l+WXbof8
	qmHhCfMA==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhMc-00Esl6-1k;
	Tue, 03 Oct 2023 15:31:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: w@uter.be,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH] nbd: don't call blk_mark_disk_dead nbd_clear_sock_ioctl
Date: Tue,  3 Oct 2023 17:31:06 +0200
Message-Id: <20231003153106.1331363-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LYAgbaL9D-M.A.J_E.GfDHlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2657
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231003153106.1331363-1-hch@lst.de
Resent-Date: Tue,  3 Oct 2023 15:48:22 +0000 (UTC)

blk_mark_disk_dead is the proper interface to shut down a block
device, but it also makes the disk unusable forever.

nbd_clear_sock_ioctl on the other hand wants to shut down the file
system, but allow the block device to be used again when when connected
to another socket.  Switch nbd to use disk_force_media_change and
nbd_bdev_reset to go back to a behavior of the old __invalidate_device
call, with the added benefit of incrementing the device generation
as there is no guarantee the old content comes back when the device
is reconnected.

Reported-by: Samuel Holland <samuel.holland@sifive.com>
Reported-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Fixes: 0c1c9a27ce90 ("nbd: call blk_mark_disk_dead in nbd_clear_sock_ioctl")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index df1cd0f718b81c..800f131222fc8f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1436,8 +1436,9 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
 
 static void nbd_clear_sock_ioctl(struct nbd_device *nbd)
 {
-	blk_mark_disk_dead(nbd->disk);
 	nbd_clear_sock(nbd);
+	disk_force_media_change(nbd->disk);
+	nbd_bdev_reset(nbd);
 	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
 			       &nbd->config->runtime_flags))
 		nbd_config_put(nbd);
-- 
2.39.2

