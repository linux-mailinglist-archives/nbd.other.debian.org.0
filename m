Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A748D5C40
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 10:07:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CE0302058A; Fri, 31 May 2024 08:07:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 08:07:22 2024
Old-Return-Path: <BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B506D2055B
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 07:49:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lbG5pKEq5agO for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 07:49:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AA8E620559
	for <nbd@other.debian.org>; Fri, 31 May 2024 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=G254IYRsUd/F6t4PlJahixfTtyWkS+KjkuNozPFW2uM=; b=mCfAB2Q3IG7ARRB/1pICP3EKhx
	BtsvlSjEu+mUGJHdLHTvoJOmfRKjXxZbNxLy4KOfOIoTiP37YS600VEXpgV/uP9orX00qlWer8q/4
	MqGvCypDXaIwvVXmRrJ1K8o1tyNVFri/wRN+r8xhPtEgtnttXcI2/uR1po1i3iqcBuzQdmttvNtJF
	oChxsdFiMIHdgU8Fvaju7qPUGHzeaRTfRR1LK2zbdzzOelGNuR2nbzEhvJ15Xap/+vOuczm4IhNaA
	4KPN2ftKI7ksG9v6J9jDdoyHPHRrn7UXV85lXH0GCoodOce35RcaAaP3IEmY28xn6qGm+n9XQh5zR
	gLnZ0o+w==;
Received: from 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCx0V-00000009Xcv-0vGx;
	Fri, 31 May 2024 07:48:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 06/14] sd: add a sd_disable_discard helper
Date: Fri, 31 May 2024 09:48:01 +0200
Message-ID: <20240531074837.1648501-7-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Z_iCXeuvNoP.A.haWJ.6UYWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2863
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240531074837.1648501-7-hch@lst.de
Resent-Date: Fri, 31 May 2024 08:07:22 +0000 (UTC)

Add helper to disable discard when it is not supported and use it
instead of sd_config_discard in the I/O completion handler.  This avoids
touching more fields than required in the I/O completion handler and
prepares for converting sd to use the atomic queue limits API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/sd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 83aa17fea39d39..f07d90474e682b 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -821,6 +821,12 @@ static unsigned char sd_setup_protect_cmnd(struct scsi_cmnd *scmd,
 	return protect;
 }
 
+static void sd_disable_discard(struct scsi_disk *sdkp)
+{
+	sdkp->provisioning_mode = SD_LBP_DISABLE;
+	blk_queue_max_discard_sectors(sdkp->disk->queue, 0);
+}
+
 static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
 {
 	struct request_queue *q = sdkp->disk->queue;
@@ -2245,12 +2251,12 @@ static int sd_done(struct scsi_cmnd *SCpnt)
 		case 0x24:	/* INVALID FIELD IN CDB */
 			switch (SCpnt->cmnd[0]) {
 			case UNMAP:
-				sd_config_discard(sdkp, SD_LBP_DISABLE);
+				sd_disable_discard(sdkp);
 				break;
 			case WRITE_SAME_16:
 			case WRITE_SAME:
 				if (SCpnt->cmnd[1] & 8) { /* UNMAP */
-					sd_config_discard(sdkp, SD_LBP_DISABLE);
+					sd_disable_discard(sdkp);
 				} else {
 					sdkp->device->no_write_same = 1;
 					sd_config_write_same(sdkp);
-- 
2.43.0

