Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QeAWMzGSVGpRngMAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 13 Jul 2026 09:22:25 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC7748065
	for <lists+nbd@lfdr.de>; Mon, 13 Jul 2026 09:22:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=huawei.com (policy=quarantine);
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 59C692067F; Mon, 13 Jul 2026 07:22:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 13 07:22:25 2026
Old-Return-Path: <yangerkun@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=4.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 895C020404
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Jul 2026 07:05:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YnGBIosVfJH2 for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Jul 2026 07:05:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A705B2066A
	for <nbd@other.debian.org>; Mon, 13 Jul 2026 07:05:02 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gzD2N3TN6zKHMPT
	for <nbd@other.debian.org>; Mon, 13 Jul 2026 15:04:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 317F54056D
	for <nbd@other.debian.org>; Mon, 13 Jul 2026 15:04:57 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgD3B3QQjlRq9dc7BA--.38720S9;
	Mon, 13 Jul 2026 15:04:57 +0800 (CST)
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
Subject: [PATCH v3 5/6] nbd: skip queue freeze when setting size at device startup
Date: Mon, 13 Jul 2026 14:56:43 +0800
Message-ID: <20260713065644.1637594-6-yangerkun@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260713065644.1637594-1-yangerkun@huawei.com>
References: <20260713065644.1637594-1-yangerkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgD3B3QQjlRq9dc7BA--.38720S9
X-Coremail-Antispam: 1UD129KBjvJXoWxGF4xXw18XFy3ZFy5ury5CFg_yoW5CFyxpF
	4UAa95GrW8KF4xur4vvFs5Xw45twnrC3sFg347G34F9F1qy392yry0yryaqw10qryDWFs8
	Ga98KF4Iya4UJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmKb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7Cj
	xVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262
	kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvEw4C26cxK6c8Ij28IcwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFPETDUUUU
Sender: yangerkun@huaweicloud.com
X-CM-SenderInfo: 51dqwvhunx0q5kxd4v5lfo033gof0z/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6WRl3l6lwSN.A.337B.xIJVqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3590
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260713065644.1637594-6-yangerkun@huawei.com
Resent-Date: Mon, 13 Jul 2026 07:22:25 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : No valid SPF, No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:hch@lst.de,m:yukuai@kernel.org,m:yi.zhang@huawei.com,m:chengzhihao1@huawei.com,m:echo.chenlin@huawei.com,m:leo.lilong@huaweicloud.com,m:wangkefeng.wang@huawei.com,m:yangerkun@huawei.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:from_mime,huawei.com:email,huawei.com:mid,bendel.debian.org:helo,bendel.debian.org:rdns,other.debian.org:from_smtp];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74AC7748065

Commit 242a49e5c878 ("nbd: freeze the queue for queue limits updates")
introduce queue freeze/unfreeze in nbd_set_size to avoid inflight
commands see this inconsistent limits. However, this cannot be happened
when device setup since the capacity is still 0.

time nbd-client --name myexport --connections 96 127.0.0.1 1234

Before this patchset:
real    0m2.195s
user    0m0.005s
sys     0m0.022s

After this patchset:
real    0m0.090s
user    0m0.004s
sys     0m0.018s

Signed-off-by: Yang Erkun <yangerkun@huawei.com>
---
 drivers/block/nbd.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 400f638e832e..2c7b09c70da2 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -331,7 +331,8 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 	nsock->sent = 0;
 }
 
-static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize, loff_t blksize)
+static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize, loff_t blksize,
+			bool freeze)
 {
 	struct queue_limits lim;
 	int error;
@@ -371,7 +372,13 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize, loff_t blksize)
 
 	lim.logical_block_size = blksize;
 	lim.physical_block_size = blksize;
-	error = queue_limits_commit_update_frozen(nbd->disk->queue, &lim);
+
+	if (freeze)
+		error = queue_limits_commit_update_frozen(nbd->disk->queue,
+				&lim);
+	else
+		error = queue_limits_commit_update(nbd->disk->queue, &lim);
+
 	if (error)
 		return error;
 
@@ -1563,7 +1570,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	return nbd_set_size(nbd, config->bytesize, nbd_blksize(config));
+	return nbd_set_size(nbd, config->bytesize, nbd_blksize(config), false);
 }
 
 static int nbd_start_device_ioctl(struct nbd_device *nbd)
@@ -1631,13 +1638,13 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_SET_SOCK:
 		return nbd_add_socket(nbd, arg, false);
 	case NBD_SET_BLKSIZE:
-		return nbd_set_size(nbd, config->bytesize, arg);
+		return nbd_set_size(nbd, config->bytesize, arg, true);
 	case NBD_SET_SIZE:
-		return nbd_set_size(nbd, arg, nbd_blksize(config));
+		return nbd_set_size(nbd, arg, nbd_blksize(config), true);
 	case NBD_SET_SIZE_BLOCKS:
 		if (check_shl_overflow(arg, config->blksize_bits, &bytesize))
 			return -EINVAL;
-		return nbd_set_size(nbd, bytesize, nbd_blksize(config));
+		return nbd_set_size(nbd, bytesize, nbd_blksize(config), true);
 	case NBD_SET_TIMEOUT:
 		nbd_set_cmd_timeout(nbd, arg);
 		return 0;
@@ -2122,7 +2129,7 @@ static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 		bsize = nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
 
 	if (bytes != config->bytesize || bsize != nbd_blksize(config))
-		return nbd_set_size(nbd, bytes, bsize);
+		return nbd_set_size(nbd, bytes, bsize, true);
 	return 0;
 }
 
-- 
2.52.0

