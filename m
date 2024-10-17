Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF89A2182
	for <lists+nbd@lfdr.de>; Thu, 17 Oct 2024 13:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EB08F2061B; Thu, 17 Oct 2024 11:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 17 11:54:09 2024
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 902A720610
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Oct 2024 11:36:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.984 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DrJqu-pX8qSx for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Oct 2024 11:36:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id BC0FE205BF
	for <nbd@other.debian.org>; Thu, 17 Oct 2024 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729164994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n0WSr1WmF7RA4Fe9ll4u+vzJx+IjPh5Yd91Xl29OH1Q=;
	b=MhcJzcIqoBUi/3wgBvJoyq+ZSevSeA+DZw8s0j4/hOV9A5+yXzqgjU/3KQAy+KhV1G7FVI
	L09P1HIWPiztoYIX5WfJ3qODcKe1PtyVIDmxyFsUAQCrzOngb06V/J1gSzKXQLEMY9lhnr
	+gkLRcHIqiIVEpaeZ17icGv9nL7Bdz8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-Ri7peXqmOdOR5cjOSO91rQ-1; Thu,
 17 Oct 2024 07:36:31 -0400
X-MC-Unique: Ri7peXqmOdOR5cjOSO91rQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1516195609F;
	Thu, 17 Oct 2024 11:36:29 +0000 (UTC)
Received: from localhost (unknown [10.72.116.161])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 826AB19560AD;
	Thu, 17 Oct 2024 11:36:27 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org
Cc: josef@toxicpanda.com,
	nbd@other.debian.org,
	eblake@redhat.com,
	Ming Lei <ming.lei@redhat.com>,
	vincent.chen@sifive.com,
	Leon Schuermann <leon@is.currently.online>,
	Bart Van Assche <bvanassche@acm.org>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH] nbd: fix partial sending
Date: Thu, 17 Oct 2024 19:36:14 +0800
Message-ID: <20241017113614.2964389-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9RPz0zJY9hD.A.lqTJ.hrPEnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3172
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20241017113614.2964389-1-ming.lei@redhat.com
Resent-Date: Thu, 17 Oct 2024 11:54:09 +0000 (UTC)

nbd driver sends request header and payload with multiple call of
sock_sendmsg, and partial sending can't be avoided. However, nbd driver
returns BLK_STS_RESOURCE to block core in this situation. This way causes
one issue: request->tag may change in the next run of nbd_queue_rq(), but
the original old tag has been sent as part of header cookie, this way
confuses nbd driver reply handling, since the real request can't be
retrieved any more with the obsolete old tag.

Fix it by retrying sending directly, this way is reasonable & safe since
nothing can move on if the current hw queue(socket) has pending request,
and unnecessary requeue can be avoided in this way.

Cc: vincent.chen@sifive.com
Cc: Leon Schuermann <leon@is.currently.online>
Cc: Bart Van Assche <bvanassche@acm.org>
Reported-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
Kevin,
	Please test this version, thanks!

 drivers/block/nbd.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b852050d8a96..ef84071041e3 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -701,8 +701,9 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 			if (sent) {
 				nsock->pending = req;
 				nsock->sent = sent;
+			} else {
+				set_bit(NBD_CMD_REQUEUED, &cmd->flags);
 			}
-			set_bit(NBD_CMD_REQUEUED, &cmd->flags);
 			return BLK_STS_RESOURCE;
 		}
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
@@ -743,7 +744,6 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 					 */
 					nsock->pending = req;
 					nsock->sent = sent;
-					set_bit(NBD_CMD_REQUEUED, &cmd->flags);
 					return BLK_STS_RESOURCE;
 				}
 				dev_err(disk_to_dev(nbd->disk),
@@ -778,6 +778,35 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 	return BLK_STS_OK;
 }
 
+/*
+ * Send pending nbd request and payload, part of them have been sent
+ * already, so we have to send them all with current request, and can't
+ * return BLK_STS_RESOURCE, otherwise request tag may be changed in next
+ * retry
+ */
+static blk_status_t nbd_send_pending_cmd(struct nbd_device *nbd,
+		struct nbd_cmd *cmd)
+{
+	struct request *req = blk_mq_rq_from_pdu(cmd);
+	unsigned long deadline = READ_ONCE(req->deadline);
+	unsigned int wait_ms = 2;
+	blk_status_t res;
+
+	WARN_ON_ONCE(test_bit(NBD_CMD_REQUEUED, &cmd->flags));
+
+	while (true) {
+		res = nbd_send_cmd(nbd, cmd, cmd->index);
+		if (res != BLK_STS_RESOURCE)
+			return res;
+		if (READ_ONCE(jiffies) + msecs_to_jiffies(wait_ms) >= deadline)
+			break;
+		msleep(wait_ms);
+		wait_ms *= 2;
+	}
+
+	return BLK_STS_IOERR;
+}
+
 static int nbd_read_reply(struct nbd_device *nbd, struct socket *sock,
 			  struct nbd_reply *reply)
 {
@@ -1111,6 +1140,8 @@ static blk_status_t nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 		goto out;
 	}
 	ret = nbd_send_cmd(nbd, cmd, index);
+	if (ret == BLK_STS_RESOURCE && nsock->pending == req)
+		ret = nbd_send_pending_cmd(nbd, cmd);
 out:
 	mutex_unlock(&nsock->tx_lock);
 	nbd_config_put(nbd);
-- 
2.44.0

