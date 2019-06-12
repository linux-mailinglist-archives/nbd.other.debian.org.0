Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA842C9F
	for <lists+nbd@lfdr.de>; Wed, 12 Jun 2019 18:48:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 732A3203E5; Wed, 12 Jun 2019 16:48:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 12 16:48:19 2019
Old-Return-Path: <roman.stratiienko@globallogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY,WORD_WITHOUT_VOWELS
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C63FC203AE
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Jun 2019 16:32:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id N3AO0Tvk0mqP for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Jun 2019 16:31:59 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .globallogic. - helo: .mail-lf1-x144.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9DBA4203A5
	for <nbd@other.debian.org>; Wed, 12 Jun 2019 16:31:55 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z15so9972410lfh.13
        for <nbd@other.debian.org>; Wed, 12 Jun 2019 09:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uyGy4WWNd2ICdtMeMw4Zv+i9/3GDsNbkiJ11wIkXVHk=;
        b=cM2YdyHPEuHJeH6B4zlWv7cFDZ58r/VLbHAjpEq7LRr4gfQuJgyJVY8V7eqma8hgte
         4zGM0EC3wvKYWvhAAB+wiA89/DLZ7cZ+w+jCKeHn3apaCzmlnKJxVqZTHJiHufE0+9Mz
         QpJ6bZNRmZzIzi5TUNQGP6Cec/IxleJOQAiWNRceu0qYiIiSSpt8Yi03c/qcS3/S/QE2
         HYAXO9oAqV46cS9rpAQUr6ZlNHHpKeA2cQrpJUCCod2ERVIppHZSaIAS6XlgwlBpIZno
         4lZ46FPrXVeSpOx3J1ujNz1AunbzDoe3C9O52LCg25K+JRdropo2buWQjcQl/FesB8Jo
         aONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uyGy4WWNd2ICdtMeMw4Zv+i9/3GDsNbkiJ11wIkXVHk=;
        b=AsJsLHgKR1ihF7Qr42sfGkqe2Rkg62P7X8upmPR0xMiJoA+hWs9bucTOi//Con8KXA
         2Vw0OKY53RS+xMtwOtvefyqDQj7IyM49JCWRbPfwJtg1yoKEJmF4mWBNTwUR/GiDxQyK
         2UOfb4ZqYA/dI7oq4vGVrqSb6R9VyqD7naiZRDyY7kDXhWo2rPPMBlKxHHdEx13jBwBE
         MYcKZhoVKjAE64ftWb2EwaJKHLFFhu4EK16++DSR/HuYuq4Wvfu8o8v9DnUvMGgrg1Nq
         ZZjN5itrhGvQDLHyha45Xj3PJnj1Sl4IkfmiTqwuebkqz3cdAKhqc0gdnswESXQF5RRw
         hQoA==
X-Gm-Message-State: APjAAAXFXXPRRRmpCG5dSV4kBX2afooD7cKowMchrayr8ekWhltPgRLD
	D5+KxdUVmcGG5urOwxJ+zF4bIw==
X-Google-Smtp-Source: APXvYqxXheLkvoces0WjHrstT2gH4vDKkOotaV8dXkmVihwqMr/COQ6Whd22gTXlZGmoX2kwSjz5tQ==
X-Received: by 2002:a19:ae01:: with SMTP id f1mr40901890lfc.29.1560357113198;
        Wed, 12 Jun 2019 09:31:53 -0700 (PDT)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
        by smtp.gmail.com with ESMTPSA id e26sm54358ljl.33.2019.06.12.09.31.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 09:31:52 -0700 (PDT)
From: roman.stratiienko@globallogic.com
To: linux-kernel@vger.kernel.org,
	josef@toxicpanda.com,
	nbd@other.debian.org,
	A.Bulyshchenko@globallogic.com,
	linux-block@vger.kernel.org,
	axboe@kernel.dkn.org
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
Subject: [PATCH 1/2] nbd: make sock_xmit() and nbd_add_socket() more generic
Date: Wed, 12 Jun 2019 19:31:43 +0300
Message-Id: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hhba8-IzSxJ.A.AQH.TzSAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/580
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190612163144.18486-1-roman.stratiienko@globallogic.com
Resent-Date: Wed, 12 Jun 2019 16:48:19 +0000 (UTC)

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Prepare base for the nbd-root patch:
 - allow to reuse sock_xmit without struct nbd_device as an argument.
 - allow to reuse nbd_add_socket with struct socket as an argument.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
Reviewed-by: Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>
---
 drivers/block/nbd.c | 62 +++++++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 3a9bca3aa093..63fcfb38e640 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -404,22 +404,13 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 /*
  *  Send or receive packet.
  */
-static int sock_xmit(struct nbd_device *nbd, int index, int send,
+static int sock_xmit(struct socket *sock, int send,
 		     struct iov_iter *iter, int msg_flags, int *sent)
 {
-	struct nbd_config *config = nbd->config;
-	struct socket *sock = config->socks[index]->sock;
 	int result;
 	struct msghdr msg;
 	unsigned int noreclaim_flag;
 
-	if (unlikely(!sock)) {
-		dev_err_ratelimited(disk_to_dev(nbd->disk),
-			"Attempted %s on closed socket in sock_xmit\n",
-			(send ? "send" : "recv"));
-		return -EINVAL;
-	}
-
 	msg.msg_iter = *iter;
 
 	noreclaim_flag = memalloc_noreclaim_save();
@@ -450,6 +441,22 @@ static int sock_xmit(struct nbd_device *nbd, int index, int send,
 	return result;
 }
 
+static int nbd_xmit(struct nbd_device *nbd, int index, int send,
+		     struct iov_iter *iter, int msg_flags, int *sent)
+{
+	struct nbd_config *config = nbd->config;
+	struct socket *sock = config->socks[index]->sock;
+
+	if (unlikely(!sock)) {
+		dev_err_ratelimited(disk_to_dev(nbd->disk),
+			"Attempted %s on closed socket in %s\n",
+			(send ? "send" : "recv"), __func__);
+		return -EINVAL;
+	}
+
+	return sock_xmit(sock, send, iter, msg_flags, sent);
+}
+
 /*
  * Different settings for sk->sk_sndtimeo can result in different return values
  * if there is a signal pending when we enter sendmsg, because reasons?
@@ -537,7 +544,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 	dev_dbg(nbd_to_dev(nbd), "request %p: sending control (%s@%llu,%uB)\n",
 		req, nbdcmd_to_ascii(type),
 		(unsigned long long)blk_rq_pos(req) << 9, blk_rq_bytes(req));
-	result = sock_xmit(nbd, index, 1, &from,
+	result = nbd_xmit(nbd, index, 1, &from,
 			(type == NBD_CMD_WRITE) ? MSG_MORE : 0, &sent);
 	trace_nbd_header_sent(req, handle);
 	if (result <= 0) {
@@ -583,7 +590,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 				iov_iter_advance(&from, skip);
 				skip = 0;
 			}
-			result = sock_xmit(nbd, index, 1, &from, flags, &sent);
+			result = nbd_xmit(nbd, index, 1, &from, flags, &sent);
 			if (result <= 0) {
 				if (was_interrupted(result)) {
 					/* We've already sent the header, we
@@ -635,7 +642,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 
 	reply.magic = 0;
 	iov_iter_kvec(&to, READ, &iov, 1, sizeof(reply));
-	result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
+	result = nbd_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
 	if (result <= 0) {
 		if (!nbd_disconnected(config))
 			dev_err(disk_to_dev(nbd->disk),
@@ -690,7 +697,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 
 		rq_for_each_segment(bvec, req, iter) {
 			iov_iter_bvec(&to, READ, &bvec, 1, bvec.bv_len);
-			result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
+			result = nbd_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
 			if (result <= 0) {
 				dev_err(disk_to_dev(nbd->disk), "Receive data failed (result %d)\n",
 					result);
@@ -931,18 +938,12 @@ static blk_status_t nbd_queue_rq(struct blk_mq_hw_ctx *hctx,
 	return ret;
 }
 
-static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
+static int nbd_add_socket(struct nbd_device *nbd, struct socket *sock,
 			  bool netlink)
 {
 	struct nbd_config *config = nbd->config;
-	struct socket *sock;
 	struct nbd_sock **socks;
 	struct nbd_sock *nsock;
-	int err;
-
-	sock = sockfd_lookup(arg, &err);
-	if (!sock)
-		return err;
 
 	if (!netlink && !nbd->task_setup &&
 	    !test_bit(NBD_BOUND, &config->runtime_flags))
@@ -984,6 +985,19 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	return 0;
 }
 
+static int nbd_add_socket_fd(struct nbd_device *nbd, unsigned long arg,
+			  bool netlink)
+{
+	struct socket *sock;
+	int err;
+
+	sock = sockfd_lookup(arg, &err);
+	if (!sock)
+		return err;
+
+	return nbd_add_socket(nbd, sock, netlink);
+}
+
 static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 {
 	struct nbd_config *config = nbd->config;
@@ -1087,7 +1101,7 @@ static void send_disconnects(struct nbd_device *nbd)
 
 		iov_iter_kvec(&from, WRITE, &iov, 1, sizeof(request));
 		mutex_lock(&nsock->tx_lock);
-		ret = sock_xmit(nbd, i, 1, &from, 0, NULL);
+		ret = nbd_xmit(nbd, i, 1, &from, 0, NULL);
 		if (ret <= 0)
 			dev_err(disk_to_dev(nbd->disk),
 				"Send disconnect failed %d\n", ret);
@@ -1249,7 +1263,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 		nbd_clear_sock_ioctl(nbd, bdev);
 		return 0;
 	case NBD_SET_SOCK:
-		return nbd_add_socket(nbd, arg, false);
+		return nbd_add_socket_fd(nbd, arg, false);
 	case NBD_SET_BLKSIZE:
 		if (!arg || !is_power_of_2(arg) || arg < 512 ||
 		    arg > PAGE_SIZE)
@@ -1821,7 +1835,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 			if (!socks[NBD_SOCK_FD])
 				continue;
 			fd = (int)nla_get_u32(socks[NBD_SOCK_FD]);
-			ret = nbd_add_socket(nbd, fd, true);
+			ret = nbd_add_socket_fd(nbd, fd, true);
 			if (ret)
 				goto out;
 		}
-- 
2.17.1

