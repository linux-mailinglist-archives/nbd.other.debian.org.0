Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HWl8FlzwPGrQuggAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 25 Jun 2026 11:09:48 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C86C4177
	for <lists+nbd@lfdr.de>; Thu, 25 Jun 2026 11:09:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=huawei.com (policy=quarantine);
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D1AAE2044E; Thu, 25 Jun 2026 09:09:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 25 09:09:47 2026
Old-Return-Path: <yangerkun@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 90DF120635
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jun 2026 08:52:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gSU8paFQMFOs for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jun 2026 08:52:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huaweicloud. - helo: .dggsgout12.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 252E22063A
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 08:52:11 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gmCFj4BnwzKHMMm
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 16:51:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 907BD40539
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 16:52:06 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP2 (Coremail) with SMTP id Syh0CgA3rYIw7DxqlmUxDA--.39891S9;
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
Subject: [PATCH v2 5/5] nbd: set nr_hw_queues at device creation to skip queue freeze
Date: Thu, 25 Jun 2026 16:44:58 +0800
Message-ID: <20260625084458.4171890-6-yangerkun@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260625084458.4171890-1-yangerkun@huawei.com>
References: <20260625084458.4171890-1-yangerkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgA3rYIw7DxqlmUxDA--.39891S9
X-Coremail-Antispam: 1UD129KBjvJXoWxAF13Aw1fWryxJF1xCFyxAFb_yoWruw17pF
	Wrta95GrWktr42ga95Aw4DuF9xtF18Aa43Ww17t3yFkFn0v3s3u3y8KF1rCr48JF95Ar4a
	v3Z8Zr409a1UZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmGb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY64kExVAvwVAq07x20xyl4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbWxR3UUUUU==
Sender: yangerkun@huaweicloud.com
X-CM-SenderInfo: 51dqwvhunx0q5kxd4v5lfo033gof0z/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SfQzhqrgKBJ.A.G-XI.bBPPqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3566
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260625084458.4171890-6-yangerkun@huawei.com
Resent-Date: Thu, 25 Jun 2026 09:09:47 +0000 (UTC)
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:mid,huawei.com:from_mime,other.debian.org:from_smtp,bendel.debian.org:rdns,bendel.debian.org:helo];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED3C86C4177

The preceding patches in this series removed the blk_mq_freeze_queue()
call from nbd_add_socket(), eliminating the freeze/unfreeze overhead
during socket insertion.  However, nbd_start_device() still calls
blk_mq_update_nr_hw_queues() when the hardware queue count differs
from the actual number of connections, which introduce freeze too.

There are two reasons nr_hw_queues may not match num_connections:

1. Reusing an existing nbd device (e.g. one pre-created at module
   load which nr_hw_queues always set as 1) that was originally
   configured with a different connection count.  This case genuinely
   requires blk_mq_update_nr_hw_queues() to adjust the hardware
   queue count.

2. Creating a new nbd device via the netlink connect path
   (nbd_genl_connect), where we know the exact number of connections
   upfront from the NBD_ATTR_SOCKETS attribute.  In this case, there
   is no need to default to nr_hw_queues=1 and then update.

This patch optimizes case 2 by setting nr_hw_queues correctly at
device creation time, so that nbd_start_device() can skip
blk_mq_update_nr_hw_queues() entirely when the count already matches.
Two changes are made:

1. Add a nr_hw_queues parameter to nbd_dev_add() so callers can
   specify the desired queue count instead of the hardcoded 1.

2. Add nbd_genl_count_sockets() to count socket FDs from the netlink
   NBD_ATTR_SOCKETS attribute before the device is created, and pass
   the count as nr_hw_queues when creating a new nbd device via
   netlink.

The ioctl path (NBD_SET_SOCK + NBD_DO_IT) remains fully functional:
pre-created devices with nbds_max>0 default to nr_hw_queues=1, and
nbd_start_device() still calls blk_mq_update_nr_hw_queues() when
needed.

Signed-off-by: Yang Erkun <yangerkun@huawei.com>
---
 drivers/block/nbd.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 953146c85f17..2b6f896037ad 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1952,7 +1952,8 @@ static const struct blk_mq_ops nbd_mq_ops = {
 	.timeout	= nbd_xmit_timeout,
 };
 
-static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
+static struct nbd_device *nbd_dev_add(int index, unsigned int refs,
+				       int nr_hw_queues)
 {
 	struct queue_limits lim = {
 		.max_hw_sectors		= 65536,
@@ -1969,7 +1970,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 		goto out;
 
 	nbd->tag_set.ops = &nbd_mq_ops;
-	nbd->tag_set.nr_hw_queues = 1;
+	nbd->tag_set.nr_hw_queues = nr_hw_queues;
 	nbd->tag_set.queue_depth = 128;
 	nbd->tag_set.numa_node = NUMA_NO_NODE;
 	nbd->tag_set.cmd_size = sizeof(struct nbd_cmd);
@@ -2092,6 +2093,35 @@ static const struct nla_policy nbd_sock_policy[NBD_SOCK_MAX + 1] = {
 	[NBD_SOCK_FD]			=	{ .type = NLA_U32 },
 };
 
+/*
+ * Count the number of socket FDs in the NBD_ATTR_SOCKETS netlink attribute.
+ * This is used to determine the correct nr_hw_queues before creating the
+ * nbd device, so that blk_mq_update_nr_hw_queues (and its RCU grace period
+ * overhead) can be avoided entirely.
+ */
+static int nbd_genl_count_sockets(struct genl_info *info)
+{
+	struct nlattr *attr;
+	int rem, count = 0;
+
+	if (!info->attrs[NBD_ATTR_SOCKETS])
+		return 0;
+
+	nla_for_each_nested(attr, info->attrs[NBD_ATTR_SOCKETS], rem) {
+		struct nlattr *socks[NBD_SOCK_MAX + 1];
+
+		if (nla_type(attr) != NBD_SOCK_ITEM)
+			continue;
+		if (nla_parse_nested_deprecated(socks, NBD_SOCK_MAX,
+						  attr, nbd_sock_policy,
+						  info->extack) != 0)
+			continue;
+		if (socks[NBD_SOCK_FD])
+			count++;
+	}
+	return count;
+}
+
 /* We don't use this right now since we don't parse the incoming list, but we
  * still want it here so userspace knows what to expect.
  */
@@ -2123,6 +2153,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	struct nbd_device *nbd;
 	struct nbd_config *config;
 	int index = -1;
+	int num_connections = nbd_genl_count_sockets(info);
 	int ret;
 	bool put_dev = false;
 
@@ -2170,7 +2201,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	mutex_unlock(&nbd_index_mutex);
 
 	if (!nbd) {
-		nbd = nbd_dev_add(index, 2);
+		nbd = nbd_dev_add(index, 2, num_connections);
 		if (IS_ERR(nbd)) {
 			pr_err("failed to add new device\n");
 			return PTR_ERR(nbd);
@@ -2737,7 +2768,7 @@ static int __init nbd_init(void)
 	nbd_dbg_init();
 
 	for (i = 0; i < nbds_max; i++)
-		nbd_dev_add(i, 1);
+		nbd_dev_add(i, 1, 1);
 	return 0;
 }
 
-- 
2.52.0

