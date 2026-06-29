Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ysnNB1reQWoEvQkAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 29 Jun 2026 04:54:18 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B96D5932
	for <lists+nbd@lfdr.de>; Mon, 29 Jun 2026 04:54:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=OlYsLYTf;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=reject) header.from=windriver.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 78816208F6; Mon, 29 Jun 2026 02:54:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 29 02:54:17 2026
Old-Return-Path: <prvs=1640bebcec=yun.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5358E208A4
	for <lists-other-nbd@bendel.debian.org>; Mon, 29 Jun 2026 02:37:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 97CuZTSIwIN2 for <lists-other-nbd@bendel.debian.org>;
	Mon, 29 Jun 2026 02:37:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1975 seconds by postgrey-1.36 at bendel; Mon, 29 Jun 2026 02:37:40 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.pphosted.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 54CFA208A3
	for <nbd@other.debian.org>; Mon, 29 Jun 2026 02:37:39 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T1qVfY1596360;
	Mon, 29 Jun 2026 02:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=86st+UaOe
	lvr3o5Z2TtiIVBMH+Kco0YFeCYDlHp1zzE=; b=OlYsLYTfosf05+fS+wytUqda6
	7myXJ0SLLXTexfoH8IJaB66+2Fjp94e9qJy6VPrw7Mas+UWoD7f0VLowG9nqFAR0
	Cz3TVDM+Kf1/LZldub2Oz7FfBf64B4iRnlD2V13zP3GWGWAb74rO7NmRyRvZSt5f
	jLtt8XhLw9vHAl25fXclS15moHejtpwM+Df69DaOYJsUtVNtll68pF0Wh87A7LcY
	SRT4w5mgFgeU06Y8bLqUIjaF58Ykp0pEDr8bnGAPrQVGpathfxmwARNdMP3DE84O
	81JRfUsmi5pPpmPPm+oW9TSLo/jkIWC86wPkkF0ae4yLpBvPqb97sHRq2ZFFw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f25g5hjvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Jun 2026 02:04:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 28 Jun 2026 19:04:37 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 28 Jun 2026 19:04:35 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
        <linux-kernel@vger.kernel.org>, <yun.zhou@windriver.com>
Subject: [PATCH] nbd: fix circular lock dependency between tx_lock and sk_lock
Date: Mon, 29 Jun 2026 10:04:34 +0800
Message-ID: <20260629020434.521046-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNSBTYWx0ZWRfX8acJ/oBOU0GY
 I8MiC3rD4zna2Jbb1lSL2oDtAhbvfk7mRSGuW1NAdnEfGr6+MSuPucnuW8/TT6DK9srCSLfsctw
 ocgfjJmdXe1iCdEhpP+TmErc4MlBeIZ2WOkLFmoEjN9UOC42SItK
X-Proofpoint-ORIG-GUID: F_e0S59F1iEj3x_5rr30DVtTcesc53ND
X-Proofpoint-GUID: F_e0S59F1iEj3x_5rr30DVtTcesc53ND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNSBTYWx0ZWRfX1XnLNE532Pwi
 YBekj4AQwxHO1+706qD8/tyxz8q5kleI5Vq8YZKbNEp2C2q7aT7Am+eAXBLMc9qnCa+A70SLr7r
 +3cw6IGF2q/Ho1wDg1/y7B3FhLW2/rcANNwiCLcvhKar5UopcH+Uqp1/EWej8VIO8Q7LYqDhtIo
 /vOYAR0BeoQmJLDhYuc6a6B8wbxsW6/77wmW5f5KiwgNT2IeYHNLPvTtFvw6gUT7FEZfS8wBRW2
 VQK8e+KN7vF1eMsOTWcO2vb5Jl2rf9C2q8rQnWtDowiqo74R7vyp1x2sOUoKK7EnmwZAYoqBjvn
 r7ub01P3HXSYsFdBzfG8wXhsPZ20Hvh9wCGjzcXrRSYxx2RNPxULaxHWM6KNWgG9A340qpGgXJQ
 9TAh8hdy5eeeXDBAwml/j+kaxoz5uTdF7Faz20TpOXEUgvH2qXCGHvegXwxeZrxBqVP4PdwamyQ
 ibkNUQ+mLOBz2zuKUOA==
X-Authority-Analysis: v=2.4 cv=TvLWQjXh c=1 sm=1 tr=0 ts=6a41d2b6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=QMFAQciz87_R_1q7sloA:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290015
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-W5ElcOaqlH.A.xHaP.Z5dQqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3571
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260629020434.521046-1-yun.zhou@windriver.com
Resent-Date: Mon, 29 Jun 2026 02:54:17 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:yun.zhou@windriver.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,bounce-nbd=lists@other.debian.org];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[windriver.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:dkim,windriver.com:email,windriver.com:mid,windriver.com:from_mime,appspotmail.com:email,syzkaller.appspot.com:url];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A26B96D5932

Move kernel_sock_shutdown() out of the tx_lock critical section to break
the circular lock dependency: tx_lock -> sk_lock (via inet_shutdown) vs
the reverse order in the block I/O submission path.

The lockdep splat shows:
  sk_lock-AF_INET6 --> &cmd->lock --> &nsock->tx_lock

When recv_work() detects a connection failure, it calls
nbd_mark_nsock_dead() under tx_lock, which calls kernel_sock_shutdown()
-> inet_shutdown() -> lock_sock(), creating the tx_lock -> sk_lock
dependency that conflicts with the reverse order in the I/O path.

Fix this by introducing a deferred shutdown mechanism:
nbd_mark_nsock_dead() records the socket needing shutdown in
nsock->shutdown_sock (with an extra file reference to prevent
use-after-free from the reconnect path), and the actual
kernel_sock_shutdown() is performed by nbd_nsock_deferred_shutdown()
after tx_lock is released at each call site. The helper uses xchg()
to guarantee the shutdown is executed exactly once even when multiple
paths race to consume it.

Fixes: f3733247ae7c ("nbd: handle single path failures gracefully")
Reported-by: syzbot+576095eed5658cbd9b63@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=576095eed5658cbd9b63
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 drivers/block/nbd.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8f10762e90ef..497f3bbe5795 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -58,6 +58,7 @@ struct nbd_sock {
 	struct socket *sock;
 	struct mutex tx_lock;
 	struct request *pending;
+	struct socket *shutdown_sock;
 	int sent;
 	bool dead;
 	int fallback_index;
@@ -315,7 +316,14 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 		}
 	}
 	if (!nsock->dead) {
-		kernel_sock_shutdown(nsock->sock, SHUT_RDWR);
+		/*
+		 * Defer shutdown to after tx_lock is released to avoid
+		 * circular lock dependency (tx_lock -> sk_lock).
+		 * Hold an extra file reference so the socket remains
+		 * valid until the deferred shutdown completes.
+		 */
+		nsock->shutdown_sock = nsock->sock;
+		get_file(nsock->sock->file);
 		if (atomic_dec_return(&nbd->config->live_connections) == 0) {
 			if (test_and_clear_bit(NBD_RT_DISCONNECT_REQUESTED,
 					       &nbd->config->runtime_flags)) {
@@ -331,6 +339,20 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 	nsock->sent = 0;
 }
 
+/*
+ * Perform deferred socket shutdown outside of tx_lock.
+ * Uses xchg to guarantee only one caller performs the shutdown.
+ */
+static void nbd_nsock_deferred_shutdown(struct nbd_sock *nsock)
+{
+	struct socket *sock = xchg(&nsock->shutdown_sock, NULL);
+
+	if (sock) {
+		kernel_sock_shutdown(sock, SHUT_RDWR);
+		sockfd_put(sock);
+	}
+}
+
 static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize, loff_t blksize)
 {
 	struct queue_limits lim;
@@ -410,6 +432,7 @@ static void sock_shutdown(struct nbd_device *nbd)
 		mutex_lock(&nsock->tx_lock);
 		nbd_mark_nsock_dead(nbd, nsock, 0);
 		mutex_unlock(&nsock->tx_lock);
+		nbd_nsock_deferred_shutdown(nsock);
 	}
 	dev_warn(disk_to_dev(nbd->disk), "shutting down sockets\n");
 }
@@ -502,6 +525,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 				if (cmd->cookie == nsock->cookie)
 					nbd_mark_nsock_dead(nbd, nsock, 1);
 				mutex_unlock(&nsock->tx_lock);
+				nbd_nsock_deferred_shutdown(nsock);
 			}
 			nbd_requeue_cmd(cmd);
 			mutex_unlock(&cmd->lock);
@@ -836,6 +860,7 @@ static void nbd_pending_cmd_work(struct work_struct *work)
 		wait_ms *= 2;
 	}
 	mutex_unlock(&nsock->tx_lock);
+	nbd_nsock_deferred_shutdown(nsock);
 	clear_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags);
 out:
 	mutex_unlock(&cmd->lock);
@@ -1020,6 +1045,7 @@ static void recv_work(struct work_struct *work)
 	mutex_lock(&nsock->tx_lock);
 	nbd_mark_nsock_dead(nbd, nsock, 1);
 	mutex_unlock(&nsock->tx_lock);
+	nbd_nsock_deferred_shutdown(nsock);
 
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);
@@ -1177,6 +1203,7 @@ static blk_status_t nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	ret = nbd_send_cmd(nbd, cmd, index);
 out:
 	mutex_unlock(&nsock->tx_lock);
+	nbd_nsock_deferred_shutdown(nsock);
 	nbd_config_put(nbd);
 	return ret;
 }
@@ -1391,6 +1418,8 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 		args->nsock = nsock;
 		nsock->cookie++;
 		mutex_unlock(&nsock->tx_lock);
+		/* Complete any pending shutdown of the old socket */
+		nbd_nsock_deferred_shutdown(nsock);
 		sockfd_put(old);
 
 		clear_bit(NBD_RT_DISCONNECTED, &config->runtime_flags);
-- 
2.43.0

