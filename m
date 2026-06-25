Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9qyrM2nwPGrXuggAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 25 Jun 2026 11:10:01 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708C6C417F
	for <lists+nbd@lfdr.de>; Thu, 25 Jun 2026 11:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=huawei.com (policy=quarantine);
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5C5382046F; Thu, 25 Jun 2026 09:10:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 25 09:10:01 2026
Old-Return-Path: <yangerkun@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=4.0 tests=FOURLA,FVGT_m_MULTI_ODD,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9376B2063A
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jun 2026 08:52:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.931 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kLOzhFY8_Rb3 for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jun 2026 08:52:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huaweicloud. - helo: .dggsgout12.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 22BA620639
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 08:52:11 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gmCFj2BpjzKHMSw
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 16:51:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 4F67640B56
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 16:52:06 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP2 (Coremail) with SMTP id Syh0CgA3rYIw7DxqlmUxDA--.39891S6;
	Thu, 25 Jun 2026 16:52:06 +0800 (CST)
From: Yang Erkun <yangerkun@huawei.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	hch@lst.de,
	yukuai@kernel.org
Cc: yi.zhang@huawei.com,
	chengzhihao1@huawei.com,
	echo.chenlin@huawei.com,
	leo.lilong@huaweicloud.com,
	wangkefeng.wang@huawei.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH v2 2/5] nbd: replace socks pointer array with xarray
Date: Thu, 25 Jun 2026 16:44:55 +0800
Message-ID: <20260625084458.4171890-3-yangerkun@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260625084458.4171890-1-yangerkun@huawei.com>
References: <20260625084458.4171890-1-yangerkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgA3rYIw7DxqlmUxDA--.39891S6
X-Coremail-Antispam: 1UD129KBjvAXoW3KF4kKFy7Cw18Gr1rKryUZFb_yoW8Jr1DZo
	WxXF9agw48Jr17XFWFg3WfKFW8Xa1qkwsxAr4UCrnxu3WUKa1Yga43Kw43Ca43Jr15KFyI
	y34fWw47Z3W3Jr1rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOV7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr
	yl82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY64kExVAvwVAq07x20xyl4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUo8nYUUUUU
Sender: yangerkun@huaweicloud.com
X-CM-SenderInfo: 51dqwvhunx0q5kxd4v5lfo033gof0z/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Mlvsd_WWXmO.A.gCYI.pBPPqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3567
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260625084458.4171890-3-yangerkun@huawei.com
Resent-Date: Thu, 25 Jun 2026 09:10:01 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.69 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : No valid SPF, No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:hch@lst.de,m:yukuai@kernel.org,m:yi.zhang@huawei.com,m:chengzhihao1@huawei.com,m:echo.chenlin@huawei.com,m:leo.lilong@huaweicloud.com,m:wangkefeng.wang@huawei.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:rdns,bendel.debian.org:helo,huawei.com:email,huawei.com:mid,huawei.com:from_mime,other.debian.org:from_smtp];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7708C6C417F

From: Long Li <leo.lilong@huawei.com>

Replace the krealloc-based struct nbd_sock **socks array with struct
xarray socks. Each nbd sock is fully initialized before being stored
into the xarray via xa_store(), ensuring concurrent readers calling
xa_load() never observe a partially initialized socket.

Convert all array index accesses to xa_load() and open-coded for-loops
to xa_for_each().

Signed-off-by: Long Li <leo.lilong@huawei.com>
---
 drivers/block/nbd.c | 155 +++++++++++++++++++++++++++-----------------
 1 file changed, 96 insertions(+), 59 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index dcba3042862a..d88bdc97f4d1 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -38,6 +38,7 @@
 #include <linux/types.h>
 #include <linux/debugfs.h>
 #include <linux/blk-mq.h>
+#include <linux/xarray.h>
 
 #include <linux/uaccess.h>
 #include <asm/types.h>
@@ -94,7 +95,7 @@ struct nbd_config {
 	unsigned long runtime_flags;
 	u64 dead_conn_timeout;
 
-	struct nbd_sock **socks;
+	struct xarray socks;
 	int num_connections;
 	atomic_t live_connections;
 	wait_queue_head_t conn_wait;
@@ -398,15 +399,15 @@ static void nbd_complete_rq(struct request *req)
 static void sock_shutdown(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
-	int i;
+	struct nbd_sock *nsock;
+	unsigned long i;
 
 	if (config->num_connections == 0)
 		return;
 	if (test_and_set_bit(NBD_RT_DISCONNECTED, &config->runtime_flags))
 		return;
 
-	for (i = 0; i < config->num_connections; i++) {
-		struct nbd_sock *nsock = config->socks[i];
+	xa_for_each(&config->socks, i, nsock) {
 		mutex_lock(&nsock->tx_lock);
 		nbd_mark_nsock_dead(nbd, nsock, 0);
 		mutex_unlock(&nsock->tx_lock);
@@ -453,6 +454,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
 	struct nbd_device *nbd = cmd->nbd;
 	struct nbd_config *config;
+	struct nbd_sock *nsock;
 
 	if (!mutex_trylock(&cmd->lock))
 		return BLK_EH_RESET_TIMER;
@@ -488,10 +490,9 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 		 * connection is configured, the submit path will wait util
 		 * a new connection is reconfigured or util dead timeout.
 		 */
-		if (config->socks) {
-			if (cmd->index < config->num_connections) {
-				struct nbd_sock *nsock =
-					config->socks[cmd->index];
+		if (!xa_empty(&config->socks)) {
+			nsock = xa_load(&config->socks, cmd->index);
+			if (nsock) {
 				mutex_lock(&nsock->tx_lock);
 				/* We can have multiple outstanding requests, so
 				 * we don't want to mark the nsock dead if we've
@@ -515,22 +516,24 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 		 * Userspace sets timeout=0 to disable socket disconnection,
 		 * so just warn and reset the timer.
 		 */
-		struct nbd_sock *nsock = config->socks[cmd->index];
 		cmd->retries++;
 		dev_info(nbd_to_dev(nbd), "Possible stuck request %p: control (%s@%llu,%uB). Runtime %u seconds\n",
 			req, nbdcmd_to_ascii(req_to_nbd_cmd_type(req)),
 			(unsigned long long)blk_rq_pos(req) << 9,
 			blk_rq_bytes(req), (req->timeout / HZ) * cmd->retries);
 
-		mutex_lock(&nsock->tx_lock);
-		if (cmd->cookie != nsock->cookie) {
-			nbd_requeue_cmd(cmd);
+		nsock = xa_load(&config->socks, cmd->index);
+		if (nsock) {
+			mutex_lock(&nsock->tx_lock);
+			if (cmd->cookie != nsock->cookie) {
+				nbd_requeue_cmd(cmd);
+				mutex_unlock(&nsock->tx_lock);
+				mutex_unlock(&cmd->lock);
+				nbd_config_put(nbd);
+				return BLK_EH_DONE;
+			}
 			mutex_unlock(&nsock->tx_lock);
-			mutex_unlock(&cmd->lock);
-			nbd_config_put(nbd);
-			return BLK_EH_DONE;
 		}
-		mutex_unlock(&nsock->tx_lock);
 		mutex_unlock(&cmd->lock);
 		nbd_config_put(nbd);
 		return BLK_EH_RESET_TIMER;
@@ -600,8 +603,16 @@ static int sock_xmit(struct nbd_device *nbd, int index, int send,
 		     struct iov_iter *iter, int msg_flags, int *sent)
 {
 	struct nbd_config *config = nbd->config;
-	struct socket *sock = config->socks[index]->sock;
+	struct nbd_sock *nsock;
+	struct socket *sock;
 
+	nsock = xa_load(&config->socks, index);
+	if (unlikely(!nsock)) {
+		dev_err_ratelimited(disk_to_dev(nbd->disk),
+				    "Attempted xmit on invalid socket\n");
+		return -EINVAL;
+	}
+	sock = nsock->sock;
 	return __sock_xmit(nbd, sock, send, iter, msg_flags, sent);
 }
 
@@ -647,7 +658,7 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 {
 	struct request *req = blk_mq_rq_from_pdu(cmd);
 	struct nbd_config *config = nbd->config;
-	struct nbd_sock *nsock = config->socks[index];
+	struct nbd_sock *nsock;
 	int result;
 	struct nbd_request request = {.magic = htonl(NBD_REQUEST_MAGIC)};
 	struct kvec iov = {.iov_base = &request, .iov_len = sizeof(request)};
@@ -656,7 +667,14 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 	u64 handle;
 	u32 type;
 	u32 nbd_cmd_flags = 0;
-	int sent = nsock->sent, skip = 0;
+	int sent, skip = 0;
+
+	nsock = xa_load(&config->socks, index);
+	if (unlikely(!nsock)) {
+		dev_err_ratelimited(disk_to_dev(nbd->disk),
+				    "Attempted send on invalid socket\n");
+		return BLK_STS_IOERR;
+	}
 
 	lockdep_assert_held(&cmd->lock);
 	lockdep_assert_held(&nsock->tx_lock);
@@ -683,6 +701,7 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
 	 * request struct, so just go and send the rest of the pages in the
 	 * request.
 	 */
+	sent = nsock->sent;
 	if (sent) {
 		if (sent >= sizeof(request)) {
 			skip = sent - sizeof(request);
@@ -1059,9 +1078,10 @@ static int find_fallback(struct nbd_device *nbd, int index)
 {
 	struct nbd_config *config = nbd->config;
 	int new_index = -1;
-	struct nbd_sock *nsock = config->socks[index];
-	int fallback = nsock->fallback_index;
-	int i;
+	struct nbd_sock *nsock;
+	struct nbd_sock *fallback_nsock;
+	unsigned long i;
+	int fallback;
 
 	if (test_bit(NBD_RT_DISCONNECTED, &config->runtime_flags))
 		return new_index;
@@ -1069,12 +1089,19 @@ static int find_fallback(struct nbd_device *nbd, int index)
 	if (config->num_connections <= 1)
 		goto no_fallback;
 
-	if (fallback >= 0 && fallback < config->num_connections &&
-	    !config->socks[fallback]->dead)
-		return fallback;
+	nsock = xa_load(&config->socks, index);
+	if (unlikely(!nsock))
+		goto no_fallback;
+
+	fallback = nsock->fallback_index;
+	if (fallback >= 0 && fallback < config->num_connections) {
+		fallback_nsock = xa_load(&config->socks, fallback);
+		if (fallback_nsock && !fallback_nsock->dead)
+			return fallback;
+	}
 
-	for (i = 0; i < config->num_connections; i++) {
-		if (i != index && !config->socks[i]->dead) {
+	xa_for_each(&config->socks, i, fallback_nsock) {
+		if (i != index && !fallback_nsock->dead) {
 			new_index = i;
 			break;
 		}
@@ -1130,7 +1157,14 @@ static blk_status_t nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	}
 	cmd->status = BLK_STS_OK;
 again:
-	nsock = config->socks[index];
+	nsock = xa_load(&config->socks, index);
+	if (unlikely(!nsock)) {
+		dev_err_ratelimited(disk_to_dev(nbd->disk),
+				    "Attempted send on invalid socket\n");
+		nbd_config_put(nbd);
+		return BLK_STS_IOERR;
+	}
+
 	mutex_lock(&nsock->tx_lock);
 	if (nsock->dead) {
 		int old_index = index;
@@ -1270,9 +1304,9 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 {
 	struct nbd_config *config = nbd->config;
 	struct socket *sock;
-	struct nbd_sock **socks;
 	struct nbd_sock *nsock;
 	unsigned int memflags;
+	unsigned int index;
 	int err;
 
 	/* Arg will be cast to int, check it to avoid overflow */
@@ -1308,16 +1342,6 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 		goto put_socket;
 	}
 
-	socks = krealloc(config->socks, (config->num_connections + 1) *
-			 sizeof(struct nbd_sock *), GFP_KERNEL);
-	if (!socks) {
-		kfree(nsock);
-		err = -ENOMEM;
-		goto put_socket;
-	}
-
-	config->socks = socks;
-
 	nsock->fallback_index = -1;
 	nsock->dead = false;
 	mutex_init(&nsock->tx_lock);
@@ -1326,7 +1350,14 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	nsock->sent = 0;
 	nsock->cookie = 0;
 	INIT_WORK(&nsock->work, nbd_pending_cmd_work);
-	socks[config->num_connections++] = nsock;
+
+	err = xa_alloc(&config->socks, &index, nsock, xa_limit_32b, GFP_KERNEL);
+	if (err < 0) {
+		kfree(nsock);
+		goto put_socket;
+	}
+
+	config->num_connections++;
 	atomic_inc(&config->live_connections);
 	blk_mq_unfreeze_queue(nbd->disk->queue, memflags);
 
@@ -1343,7 +1374,8 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 	struct nbd_config *config = nbd->config;
 	struct socket *sock, *old;
 	struct recv_thread_args *args;
-	int i;
+	struct nbd_sock *nsock;
+	unsigned long i;
 	int err;
 
 	sock = nbd_get_socket(nbd, arg, &err);
@@ -1356,9 +1388,7 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 		return -ENOMEM;
 	}
 
-	for (i = 0; i < config->num_connections; i++) {
-		struct nbd_sock *nsock = config->socks[i];
-
+	xa_for_each(&config->socks, i, nsock) {
 		if (!nsock->dead)
 			continue;
 
@@ -1424,10 +1454,11 @@ static void send_disconnects(struct nbd_device *nbd)
 	};
 	struct kvec iov = {.iov_base = &request, .iov_len = sizeof(request)};
 	struct iov_iter from;
-	int i, ret;
+	struct nbd_sock *nsock;
+	unsigned long i;
+	int ret;
 
-	for (i = 0; i < config->num_connections; i++) {
-		struct nbd_sock *nsock = config->socks[i];
+	xa_for_each(&config->socks, i, nsock) {
 
 		iov_iter_kvec(&from, ITER_SOURCE, &iov, 1, sizeof(request));
 		mutex_lock(&nsock->tx_lock);
@@ -1462,6 +1493,9 @@ static void nbd_config_put(struct nbd_device *nbd)
 	if (refcount_dec_and_mutex_lock(&nbd->config_refs,
 					&nbd->config_lock)) {
 		struct nbd_config *config = nbd->config;
+		struct nbd_sock *nsock;
+		unsigned long i;
+
 		nbd_dev_dbg_close(nbd);
 		invalidate_disk(nbd->disk);
 		if (nbd->config->bytesize)
@@ -1477,14 +1511,15 @@ static void nbd_config_put(struct nbd_device *nbd)
 			nbd->backend = NULL;
 		}
 		nbd_clear_sock(nbd);
+
 		if (config->num_connections) {
-			int i;
-			for (i = 0; i < config->num_connections; i++) {
-				sockfd_put(config->socks[i]->sock);
-				kfree(config->socks[i]);
+			xa_for_each(&config->socks, i, nsock) {
+				sockfd_put(nsock->sock);
+				kfree(nsock);
 			}
-			kfree(config->socks);
 		}
+		xa_destroy(&config->socks);
+
 		kfree(nbd->config);
 		nbd->config = NULL;
 
@@ -1500,11 +1535,13 @@ static int nbd_start_device(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
 	int num_connections = config->num_connections;
-	int error = 0, i;
+	int error = 0;
+	unsigned long i;
+	struct nbd_sock *nsock;
 
 	if (nbd->pid)
 		return -EBUSY;
-	if (!config->socks)
+	if (xa_empty(&config->socks))
 		return -EINVAL;
 	if (num_connections > 1 &&
 	    !(config->flags & NBD_FLAG_CAN_MULTI_CONN)) {
@@ -1535,7 +1572,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 	set_bit(NBD_RT_HAS_PID_FILE, &config->runtime_flags);
 
 	nbd_dev_dbg_init(nbd);
-	for (i = 0; i < num_connections; i++) {
+	xa_for_each(&config->socks, i, nsock) {
 		struct recv_thread_args *args;
 
 		args = kzalloc_obj(*args);
@@ -1553,15 +1590,14 @@ static int nbd_start_device(struct nbd_device *nbd)
 				flush_workqueue(nbd->recv_workq);
 			return -ENOMEM;
 		}
-		sk_set_memalloc(config->socks[i]->sock->sk);
+		sk_set_memalloc(nsock->sock->sk);
 		if (nbd->tag_set.timeout)
-			config->socks[i]->sock->sk->sk_sndtimeo =
-				nbd->tag_set.timeout;
+			nsock->sock->sk->sk_sndtimeo = nbd->tag_set.timeout;
 		atomic_inc(&config->recv_threads);
 		refcount_inc(&nbd->config_refs);
 		INIT_WORK(&args->work, recv_work);
 		args->nbd = nbd;
-		args->nsock = config->socks[i];
+		args->nsock = nsock;
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
@@ -1711,6 +1747,7 @@ static int nbd_alloc_and_init_config(struct nbd_device *nbd)
 		return -ENOMEM;
 	}
 
+	xa_init_flags(&config->socks, XA_FLAGS_ALLOC);
 	atomic_set(&config->recv_threads, 0);
 	init_waitqueue_head(&config->recv_wq);
 	init_waitqueue_head(&config->conn_wait);
-- 
2.52.0

