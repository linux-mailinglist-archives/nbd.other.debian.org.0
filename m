Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gk9rKxiSVGpCngMAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 13 Jul 2026 09:22:00 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5861E748041
	for <lists+nbd@lfdr.de>; Mon, 13 Jul 2026 09:22:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=huawei.com (policy=quarantine);
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4585E2067F; Mon, 13 Jul 2026 07:22:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 13 07:22:00 2026
Old-Return-Path: <yangerkun@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=4.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 018B3204F1
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Jul 2026 07:05:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Vc1qsJRgXQJg for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Jul 2026 07:05:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9605B20558
	for <nbd@other.debian.org>; Mon, 13 Jul 2026 07:05:02 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gzD2N2YSfzKHMP7
	for <nbd@other.debian.org>; Mon, 13 Jul 2026 15:04:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 0D2034058F
	for <nbd@other.debian.org>; Mon, 13 Jul 2026 15:04:57 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgD3B3QQjlRq9dc7BA--.38720S7;
	Mon, 13 Jul 2026 15:04:56 +0800 (CST)
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
	yangerkun@huawei.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH v3 3/6] nbd: remove queue freeze in nbd_add_socket
Date: Mon, 13 Jul 2026 14:56:41 +0800
Message-ID: <20260713065644.1637594-4-yangerkun@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260713065644.1637594-1-yangerkun@huawei.com>
References: <20260713065644.1637594-1-yangerkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgD3B3QQjlRq9dc7BA--.38720S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw43XrW8CF13CF18KFy5XFb_yoW8Cw15pF
	43Ka9rCr4UKF4Uuan8AFWDXFyft3Z7K347KrWxX34FvrZxCFySva4Iya18Wa4UAryDXF47
	ZFW5KFs2kw1UWrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26r1q6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVAKzI0EY4vE52x082I5MxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU14CJPUUUUU==
Sender: yangerkun@huaweicloud.com
X-CM-SenderInfo: 51dqwvhunx0q5kxd4v5lfo033gof0z/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Mcw2NuCVKnL.A.Jz7B.YIJVqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3588
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260713065644.1637594-4-yangerkun@huawei.com
Resent-Date: Mon, 13 Jul 2026 07:22:00 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.69 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : No valid SPF, No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:hch@lst.de,m:yukuai@kernel.org,m:yi.zhang@huawei.com,m:chengzhihao1@huawei.com,m:echo.chenlin@huawei.com,m:leo.lilong@huaweicloud.com,m:wangkefeng.wang@huawei.com,m:yangerkun@huawei.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[other.debian.org:from_smtp,bendel.debian.org:helo,bendel.debian.org:rdns,huawei.com:from_mime,huawei.com:email,huawei.com:mid];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5861E748041

nbd_add_socket can never run concurrently with inflight I/O:

 - netlink path: nbd_genl_connect calls nbd_add_socket before
   nbd_start_device, so no I/O can happened when invoking nbd_add_socket,
   nbd_genl_reconfigure cannot too since it won't call nbd_add_socket

 - ioctl path: NBD_SET_SOCK cannot be called after NBD_DO_IT with
   the previous commit, so capability of nbd will keep 0 while
   invoking NBD_SET_SOCK

Removing the freeze in nbd_add_socket to speed up nbd device startup.

Signed-off-by: Yang Erkun <yangerkun@huawei.com>
---
 drivers/block/nbd.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a15553ab4b97..0755b7046ed4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1272,7 +1272,6 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	struct socket *sock;
 	struct nbd_sock **socks;
 	struct nbd_sock *nsock;
-	unsigned int memflags;
 	int err;
 
 	/* Arg will be cast to int, check it to avoid overflow */
@@ -1283,12 +1282,6 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 		return err;
 	nbd_reclassify_socket(sock);
 
-	/*
-	 * We need to make sure we don't get any errant requests while we're
-	 * reallocating the ->socks array.
-	 */
-	memflags = blk_mq_freeze_queue(nbd->disk->queue);
-
 	if (!netlink && !nbd->task_setup &&
 	    !test_bit(NBD_RT_BOUND, &config->runtime_flags))
 		nbd->task_setup = current;
@@ -1335,12 +1328,10 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	INIT_WORK(&nsock->work, nbd_pending_cmd_work);
 	socks[config->num_connections++] = nsock;
 	atomic_inc(&config->live_connections);
-	blk_mq_unfreeze_queue(nbd->disk->queue, memflags);
 
 	return 0;
 
 put_socket:
-	blk_mq_unfreeze_queue(nbd->disk->queue, memflags);
 	sockfd_put(sock);
 	return err;
 }
-- 
2.52.0

