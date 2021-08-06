Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 888F03E2D19
	for <lists+nbd@lfdr.de>; Fri,  6 Aug 2021 17:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7101220630; Fri,  6 Aug 2021 15:03:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  6 15:03:20 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MONEY,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,STOCKLIKE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4FB012058A
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Aug 2021 14:45:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.755 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MONEY=0.5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, STOCKLIKE=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fgLrbuydK6hv for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Aug 2021 14:45:26 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 89AFF2059A
	for <nbd@other.debian.org>; Fri,  6 Aug 2021 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628261121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g02NNSi8BKXFu9HdVxcvonhWT7pRtGQw5k4dnx6xGH8=;
	b=C0/daRwCP3ThNYtFBJURdyk0Y0vwXP1v8XeMs39/8FR2tR+Dstl8JSndna4kYejsR5K6T4
	HLQupvs+b73WvXTOIuzbPVsAUvknSMBCJGz5aO8XOVt7yKdLIYTTyn9WD6YKR1ckr4FukZ
	37sFoTrkmPl8ThYQVSV3HmAG/jQEzvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-r9AMVNqAPeescJAOslgJSA-1; Fri, 06 Aug 2021 10:30:01 -0400
X-MC-Unique: r9AMVNqAPeescJAOslgJSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B972FDF8A0;
	Fri,  6 Aug 2021 14:29:59 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.40.192.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A72415D9D5;
	Fri,  6 Aug 2021 14:29:48 +0000 (UTC)
From: pkalever@redhat.com
To: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	josef@toxicpanda.com,
	axboe@kernel.dk,
	idryomov@redhat.com,
	xiubli@redhat.com,
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Subject: [PATCH v1 2/2] nbd: reset the queue/io_timeout to default on disconnect
Date: Fri,  6 Aug 2021 19:59:14 +0530
Message-Id: <20210806142914.70556-3-pkalever@redhat.com>
In-Reply-To: <20210806142914.70556-1-pkalever@redhat.com>
References: <20210806142914.70556-1-pkalever@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Q_a2OVjOt7O.A.eKF.48UDhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1243
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210806142914.70556-3-pkalever@redhat.com
Resent-Date: Fri,  6 Aug 2021 15:03:20 +0000 (UTC)

From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>

Without any changes to NBD_ATTR_TIMEOUT (default is 30 secs),
$ rbd-nbd map rbd-pool/image0 --try-netlink
/dev/nbd0
$ cat /sys/block/nbd0/queue/io_timeout
30000
$ rbd-nbd unmap /dev/nbd0
$ cat /sys/block/nbd0/queue/io_timeout
30000

Now user sets NBD_ATTR_TIMEOUT to 60,
$ rbd-nbd map rbd-pool/image0 --try-netlink --io-timeout 60
/dev/nbd0
$ cat /sys/block/nbd0/queue/io_timeout
60000
$ rbd-nbd unmap /dev/nbd0
$ cat /sys/block/nbd0/queue/io_timeout
60000

Now user doesn't alter NBD_ATTR_TIMEOUT, but sysfs still shows it as 60,
$ rbd-nbd map rbd-pool/image0 --try-netlink
/dev/nbd0
$ cat /sys/block/nbd0/queue/io_timeout
60000
$ rbd-nbd unmap /dev/nbd0
$ cat /sys/block/nbd0/queue/io_timeout
60000

The problem exists with ioctl interface too.

Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
---
 drivers/block/nbd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 16a1a14b1fd1..a45aabc4914b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -158,6 +158,7 @@ static void nbd_connect_reply(struct genl_info *info, int index);
 static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info);
 static void nbd_dead_link_work(struct work_struct *work);
 static void nbd_disconnect_and_put(struct nbd_device *nbd);
+static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout);
 
 static inline struct device *nbd_to_dev(struct nbd_device *nbd)
 {
@@ -1250,7 +1251,7 @@ static void nbd_config_put(struct nbd_device *nbd)
 			destroy_workqueue(nbd->recv_workq);
 		nbd->recv_workq = NULL;
 
-		nbd->tag_set.timeout = 0;
+		nbd_set_cmd_timeout(nbd, 0);
 		nbd->disk->queue->limits.discard_granularity = 0;
 		nbd->disk->queue->limits.discard_alignment = 0;
 		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
@@ -2124,6 +2125,10 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	if (ret)
 		goto out;
 
+	/*
+	 * On reconfigure, if NBD_ATTR_TIMEOUT is not provided, we will
+	 * continue to use the cmd timeout provided with connect initially.
+	 */
 	if (info->attrs[NBD_ATTR_TIMEOUT])
 		nbd_set_cmd_timeout(nbd,
 				    nla_get_u64(info->attrs[NBD_ATTR_TIMEOUT]));
-- 
2.31.1

