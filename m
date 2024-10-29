Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 617699B3FD6
	for <lists+nbd@lfdr.de>; Tue, 29 Oct 2024 02:36:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 23BE0205E2; Tue, 29 Oct 2024 01:36:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 29 01:36:11 2024
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6237C205BA
	for <lists-other-nbd@bendel.debian.org>; Tue, 29 Oct 2024 01:20:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.22 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.421, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.699]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 66cz6DttRTJC for <lists-other-nbd@bendel.debian.org>;
	Tue, 29 Oct 2024 01:20:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 17F12205CB
	for <nbd@other.debian.org>; Tue, 29 Oct 2024 01:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730164798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WNMbK6tnCIQzJ9PMcLLLrD6cfAt4KQVqcwg0Zc03tMk=;
	b=C2IpuHH9xFwOin9oedVqYQpfFl/TMG3O0z3x65wJYlOWWfQV+gOSH6g/DKz2gsSg/2vzwq
	hj6f+EnPye/H2kDht4auAKiHLMDnTlQ8i6GM6cfqCveSq30NcUbD0+W8cVOAQ/DXtv4K5l
	MOobO9Qyl+xQgJpk7zWhqAsLm+d/HZ8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681--DC9ZPsLOzCaDUVTnjUf_Q-1; Mon,
 28 Oct 2024 21:19:53 -0400
X-MC-Unique: -DC9ZPsLOzCaDUVTnjUf_Q-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB88919560AE;
	Tue, 29 Oct 2024 01:19:50 +0000 (UTC)
Received: from localhost (unknown [10.72.116.82])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 05FDF19560A2;
	Tue, 29 Oct 2024 01:19:48 +0000 (UTC)
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
Subject: [PATCH V3] nbd: fix partial sending
Date: Tue, 29 Oct 2024 09:19:41 +0800
Message-ID: <20241029011941.153037-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bUuQJfdMLVK.A.hiTN.LwDInB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3182
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20241029011941.153037-1-ming.lei@redhat.com
Resent-Date: Tue, 29 Oct 2024 01:36:11 +0000 (UTC)

nbd driver sends request header and payload with multiple call of
sock_sendmsg, and partial sending can't be avoided. However, nbd driver
returns BLK_STS_RESOURCE to block core in this situation. This way causes
one issue: request->tag may change in the next run of nbd_queue_rq(), but
the original old tag has been sent as part of header cookie, this way
confuses nbd driver reply handling, since the real request can't be
retrieved any more with the obsolete old tag.

Fix it by retrying sending directly in per-socket work function,
meantime return BLK_STS_OK to block layer core.

Cc: vincent.chen@sifive.com
Cc: Leon Schuermann <leon@is.currently.online>
Cc: Bart Van Assche <bvanassche@acm.org>
Reported-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
V3:
	- rename nbd_run_pending_work()(Kevin)
	- warning on double schedule(Kevin)
	- cover requeue in handling pending work function

V2:
	- move pending retry to socket work function and return BLK_STS_OK, so that
	userspace can get chance to handle the signal(Kevin)


 drivers/block/nbd.c | 95 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 10 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b852050d8a96..a14a454ba0e8 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -62,6 +62,7 @@ struct nbd_sock {
 	bool dead;
 	int fallback_index;
 	int cookie;
+	struct work_struct work;
 };
 
 struct recv_thread_args {
@@ -141,6 +142,9 @@ struct nbd_device {
  */
 #define NBD_CMD_INFLIGHT	2
 
+/* Just part of request header or data payload is sent successfully */
+#define NBD_CMD_PARTIAL_SEND	3
+
 struct nbd_cmd {
 	struct nbd_device *nbd;
 	struct mutex lock;
@@ -466,6 +470,12 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 	if (!mutex_trylock(&cmd->lock))
 		return BLK_EH_RESET_TIMER;
 
+	/* partial send is handled in nbd_sock's work function */
+	if (test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags)) {
+		mutex_unlock(&cmd->lock);
+		return BLK_EH_RESET_TIMER;
+	}
+
 	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
 		mutex_unlock(&cmd->lock);
 		return BLK_EH_DONE;
@@ -614,6 +624,30 @@ static inline int was_interrupted(int result)
 	return result == -ERESTARTSYS || result == -EINTR;
 }
 
+/*
+ * We've already sent header or part of data payload, have no choice but
+ * to set pending and schedule it in work.
+ *
+ * And we have to return BLK_STS_OK to block core, otherwise this same
+ * request may be re-dispatched with different tag, but our header has
+ * been sent out with old tag, and this way does confuse reply handling.
+ */
+static void nbd_sched_pending_work(struct nbd_device *nbd,
+				   struct nbd_sock *nsock,
+				   struct nbd_cmd *cmd, int sent)
+{
+	struct request *req = blk_mq_rq_from_pdu(cmd);
+
+	/* pending work should be scheduled only once */
+	WARN_ON_ONCE(test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags));
+
+	nsock->pending = req;
+	nsock->sent = sent;
+	set_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags);
+	refcount_inc(&nbd->config_refs);
+	schedule_work(&nsock->work);
+}
+
 /*
  * Returns BLK_STS_RESOURCE if the caller should retry after a delay.
  * Returns BLK_STS_IOERR if sending failed.
@@ -699,8 +733,8 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 			 * completely done.
 			 */
 			if (sent) {
-				nsock->pending = req;
-				nsock->sent = sent;
+				nbd_sched_pending_work(nbd, nsock, cmd, sent);
+				return BLK_STS_OK;
 			}
 			set_bit(NBD_CMD_REQUEUED, &cmd->flags);
 			return BLK_STS_RESOURCE;
@@ -737,14 +771,8 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 			result = sock_xmit(nbd, index, 1, &from, flags, &sent);
 			if (result < 0) {
 				if (was_interrupted(result)) {
-					/* We've already sent the header, we
-					 * have no choice but to set pending and
-					 * return BUSY.
-					 */
-					nsock->pending = req;
-					nsock->sent = sent;
-					set_bit(NBD_CMD_REQUEUED, &cmd->flags);
-					return BLK_STS_RESOURCE;
+					nbd_sched_pending_work(nbd, nsock, cmd, sent);
+					return BLK_STS_OK;
 				}
 				dev_err(disk_to_dev(nbd->disk),
 					"Send data failed (result %d)\n",
@@ -770,6 +798,14 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 	return BLK_STS_OK;
 
 requeue:
+	/*
+	 * Can't requeue in case we are dealing with partial send
+	 *
+	 * We must run from pending work function.
+	 * */
+	if (test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags))
+		return BLK_STS_OK;
+
 	/* retry on a different socket */
 	dev_err_ratelimited(disk_to_dev(nbd->disk),
 			    "Request send failed, requeueing\n");
@@ -778,6 +814,44 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 	return BLK_STS_OK;
 }
 
+/* handle partial sending */
+static void nbd_pending_cmd_work(struct work_struct *work)
+{
+	struct nbd_sock *nsock = container_of(work, struct nbd_sock, work);
+	struct request *req = nsock->pending;
+	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
+	struct nbd_device *nbd = cmd->nbd;
+	unsigned long deadline = READ_ONCE(req->deadline);
+	unsigned int wait_ms = 2;
+
+	mutex_lock(&cmd->lock);
+
+	WARN_ON_ONCE(test_bit(NBD_CMD_REQUEUED, &cmd->flags));
+	if (WARN_ON_ONCE(!test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags)))
+		goto out;
+
+	mutex_lock(&nsock->tx_lock);
+	while (true) {
+		nbd_send_cmd(nbd, cmd, cmd->index);
+		if (!nsock->pending)
+			break;
+
+		/* don't bother timeout handler for partial sending */
+		if (READ_ONCE(jiffies) + msecs_to_jiffies(wait_ms) >= deadline) {
+			cmd->status = BLK_STS_IOERR;
+			blk_mq_complete_request(req);
+			break;
+		}
+		msleep(wait_ms);
+		wait_ms *= 2;
+	}
+	mutex_unlock(&nsock->tx_lock);
+	clear_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags);
+out:
+	mutex_unlock(&cmd->lock);
+	nbd_config_put(nbd);
+}
+
 static int nbd_read_reply(struct nbd_device *nbd, struct socket *sock,
 			  struct nbd_reply *reply)
 {
@@ -1224,6 +1298,7 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	nsock->pending = NULL;
 	nsock->sent = 0;
 	nsock->cookie = 0;
+	INIT_WORK(&nsock->work, nbd_pending_cmd_work);
 	socks[config->num_connections++] = nsock;
 	atomic_inc(&config->live_connections);
 	blk_mq_unfreeze_queue(nbd->disk->queue);
-- 
2.44.0

