Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OFOcGkTwPGrFuggAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 25 Jun 2026 11:09:24 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 040416C416A
	for <lists+nbd@lfdr.de>; Thu, 25 Jun 2026 11:09:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=huawei.com (policy=quarantine);
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E37FC2046F; Thu, 25 Jun 2026 09:09:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 25 09:09:23 2026
Old-Return-Path: <yangerkun@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CDFE920630
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jun 2026 08:52:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fKvpR5l6f6A9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jun 2026 08:52:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huaweicloud. - helo: .dggsgout11.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CF11320633
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 08:52:11 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gmCG21m5bzYQtgd
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 16:51:22 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 299814058C
	for <nbd@other.debian.org>; Thu, 25 Jun 2026 16:52:06 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP2 (Coremail) with SMTP id Syh0CgA3rYIw7DxqlmUxDA--.39891S4;
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
Subject: [PATCH v2 0/5] nbd: eliminate queue freeze/unfreeze overhead in connection setup
Date: Thu, 25 Jun 2026 16:44:53 +0800
Message-ID: <20260625084458.4171890-1-yangerkun@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgA3rYIw7DxqlmUxDA--.39891S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyxWF45Cr13XF1fArW7XFb_yoW8Kr1UpF
	WfGa9xCw1vqr4xW39xAa1xG343Jrs5Ca4agw1xGr1UZw15uF1vqrySkF42kFy5AFZ7ua1j
	v3WUtr4kCFWY9F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY64kExVAvwVAq07x20xyl4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUOmiiUUUUU
Sender: yangerkun@huaweicloud.com
X-CM-SenderInfo: 51dqwvhunx0q5kxd4v5lfo033gof0z/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <St0eaVPR24P.A.c1XI.DBPPqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3564
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260625084458.4171890-1-yangerkun@huawei.com
Resent-Date: Thu, 25 Jun 2026 09:09:23 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : No valid SPF, No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:hch@lst.de,m:yukuai@kernel.org,m:yi.zhang@huawei.com,m:chengzhihao1@huawei.com,m:echo.chenlin@huawei.com,m:leo.lilong@huaweicloud.com,m:wangkefeng.wang@huawei.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:from_mime,other.debian.org:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 040416C416A

This series eliminates the blk_mq_freeze_queue()/unfreeze_queue()
overhead that currently occurs during nbd connection setup.  On
multi-core systems, each freeze cycle involves waiting for percpu_ref
to drain, and blk_mq_update_nr_hw_queues() further adds RCU grace
period waits (synchronize_rcu/srcu for elevator switch, kfree_rcu on
the old hctx array).  These delays are significant when nbd devices
must come online quickly.

The series proceeds in three stages:

1. Cleanups that simplify the sock management code and remove dead
   logic (patches 1-3).

2. A structural change that replaces the krealloc-based socks pointer
   array with an xarray (patch 2), which is the key prerequisite for
   removing the queue freeze from nbd_add_socket().  With xarray,
   concurrent readers via xa_load() never observe a partially
   initialized socket, and xa_store() is safe under RCU without
   freezing the queue.

3. Two patches that target the remaining freeze/unfreeze points:
   - Patch 4 removes the freeze from nbd_add_socket(), since the
     xarray no longer requires it.  This alone reduces connection
     setup time from ~4.5s to ~0.26s with 256 connections (-C 256).
   - Patch 5 (new) targets nbd_start_device(), which still calls
     blk_mq_update_nr_hw_queues() when nr_hw_queues differs from
     num_connections.  For devices created via the netlink connect
     path, the connection count is known upfront from NBD_ATTR_SOCKETS,
     so we can set nr_hw_queues correctly at device creation time and
     skip the runtime update entirely.

The ioctl path (NBD_SET_SOCK + NBD_DO_IT) remains fully functional:
pre-created devices with nbds_max>0 default to nr_hw_queues=1, and
nbd_start_device() still calls blk_mq_update_nr_hw_queues() when the
hardware queue count needs adjustment.

v1->v2:
1. rewrite cover letter
2. add patch 5

Long Li (4):
  nbd: simplify find_fallback() by removing redundant logic
  nbd: replace socks pointer array with xarray
  nbd: remove redundant num_connections boundary checks
  nbd: remove queue freeze in nbd_add_socket

Yang Erkun (1):
  nbd: set nr_hw_queues at device creation to skip queue freeze

 drivers/block/nbd.c | 236 ++++++++++++++++++++++++++------------------
 1 file changed, 139 insertions(+), 97 deletions(-)

-- 
2.52.0

