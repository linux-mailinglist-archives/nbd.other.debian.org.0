Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD25227ECD
	for <lists+nbd@lfdr.de>; Tue, 21 Jul 2020 13:27:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E4D892053E; Tue, 21 Jul 2020 11:27:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 21 11:27:30 2020
Old-Return-Path: <mlevitsk@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7661F20580
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jul 2020 11:10:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.921 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ijUZO3t-zCYN for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jul 2020 11:10:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 69D6B2053E
	for <nbd@other.debian.org>; Tue, 21 Jul 2020 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595329810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gteU3EGNoUKPt8oYOM7d1sSCLxaOHL3O+rsdN+CvQ8=;
	b=EvylTtA+0yvGWUk24Lo9JdFOaaz0cOU54VJV5qYJHF3XU09iegQVIxLOiw92DD0reopPf5
	senWNSvPo3ibBq11tgzy30jfZLbvwKEEFo+FAH1+hnjAV0xzr8CaJ5buPACLvB7W6/R4QP
	8dKQO67TwqT1+5y0RKcsaby2vOTmUkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-QTw1zjUEPNq-t8eTeL3FpQ-1; Tue, 21 Jul 2020 06:54:04 -0400
X-MC-Unique: QTw1zjUEPNq-t8eTeL3FpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DC681009625;
	Tue, 21 Jul 2020 10:54:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA0CD1C4;
	Tue, 21 Jul 2020 10:53:26 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Keith Busch <kbusch@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org (open list:BLOCK LAYER),
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org (open list:NVM EXPRESS DRIVER),
	linux-scsi@vger.kernel.org (open list:SCSI CDROM DRIVER),
	Tejun Heo <tj@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Jason Wang <jasowang@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Colin Ian King <colin.king@canonical.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ajay Joshi <ajay.joshi@wdc.com>,
	Ming Lei <ming.lei@redhat.com>,
	linux-mmc@vger.kernel.org (open list:SONY MEMORYSTICK SUBSYSTEM),
	Christoph Hellwig <hch@lst.de>,
	Satya Tangirala <satyat@google.com>,
	nbd@other.debian.org (open list:NETWORK BLOCK DEVICE (NBD)),
	Hou Tao <houtao1@huawei.com>,
	Jens Axboe <axboe@fb.com>,
	virtualization@lists.linux-foundation.org (open list:VIRTIO CORE AND NET DRIVERS),
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Alex Dubov <oakad@yahoo.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH 02/10] block: virtio-blk: check logical block size
Date: Tue, 21 Jul 2020 13:52:31 +0300
Message-Id: <20200721105239.8270-3-mlevitsk@redhat.com>
In-Reply-To: <20200721105239.8270-1-mlevitsk@redhat.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <E_7XrjP96_D.A.hXD.iEtFfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/918
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200721105239.8270-3-mlevitsk@redhat.com
Resent-Date: Tue, 21 Jul 2020 11:27:30 +0000 (UTC)

Linux kernel only supports logical block sizes which are power of two,
at least 512 bytes and no more that PAGE_SIZE.

Check this instead of crashing later on.

Note that there is no need to check physical block size since it is
only a hint, and virtio-blk already only supports power of two values.

Bugzilla link: https://bugzilla.redhat.com/show_bug.cgi?id=1664619

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/block/virtio_blk.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 980df853ee497..b5ee87cba00ed 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -809,10 +809,18 @@ static int virtblk_probe(struct virtio_device *vdev)
 	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
 				   struct virtio_blk_config, blk_size,
 				   &blk_size);
-	if (!err)
+	if (!err) {
+		if (!blk_is_valid_logical_block_size(blk_size)) {
+			dev_err(&vdev->dev,
+				"%s failure: invalid logical block size %d\n",
+				__func__, blk_size);
+			err = -EINVAL;
+			goto out_cleanup_queue;
+		}
 		blk_queue_logical_block_size(q, blk_size);
-	else
+	} else {
 		blk_size = queue_logical_block_size(q);
+	}
 
 	/* Use topology information if available */
 	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_TOPOLOGY,
@@ -872,6 +880,9 @@ static int virtblk_probe(struct virtio_device *vdev)
 	device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
 	return 0;
 
+out_cleanup_queue:
+	blk_cleanup_queue(vblk->disk->queue);
+	vblk->disk->queue = NULL;
 out_free_tags:
 	blk_mq_free_tag_set(&vblk->tag_set);
 out_put_disk:
-- 
2.26.2

