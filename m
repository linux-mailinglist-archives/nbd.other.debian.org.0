Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E229369C
	for <lists+nbd@lfdr.de>; Tue, 20 Oct 2020 10:16:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CC210205E9; Tue, 20 Oct 2020 08:16:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 20 08:16:51 2020
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8758F205DD
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Oct 2020 08:16:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.079 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0BXzindyVQ99 for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Oct 2020 08:16:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 8B642205E2
	for <nbd@other.debian.org>; Tue, 20 Oct 2020 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603181794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
	bh=baGYhwVH7iVs3xKtBJMV3q5cpBS0iMBTLWqbMpArqI4=;
	b=XzI3liLCGONUeEYDlck1QZQINwQFcMauAPfFxubObbOnmRTwFotMtDfq4Da6M2ZkaizZWT
	WO/VvBKu78Tx/Lheo+8187MLNvyYrW7RSyiUtReBN6XUmm4ELXyUSd8fPCUv+0LhIwtGqL
	L7cW8JzfUcmCop3XMRAqIyhnKD5alJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-KBGc1kEtN3y8uvCuR6iecQ-1; Tue, 20 Oct 2020 04:16:32 -0400
X-MC-Unique: KBGc1kEtN3y8uvCuR6iecQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 535D68030BD;
	Tue, 20 Oct 2020 08:16:31 +0000 (UTC)
Received: from lxbceph1.gsslab.pek2.redhat.com (vm37-120.gsslab.pek2.redhat.com [10.72.37.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9C2B5D9D2;
	Tue, 20 Oct 2020 08:16:28 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: nbd@other.debian.org,
	linux-block@vger.kernel.org,
	jdillama@redhat.com,
	mgolub@suse.de,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH 1/2] nbd: fix use-after-freed crash for nbd->recv_workq
Date: Tue, 20 Oct 2020 04:16:14 -0400
Message-Id: <20201020081615.240305-2-xiubli@redhat.com>
In-Reply-To: <20201020081615.240305-1-xiubli@redhat.com>
References: <20201020081615.240305-1-xiubli@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wbhZid76OMN.A.mmC.zzpjfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1018
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201020081615.240305-2-xiubli@redhat.com
Resent-Date: Tue, 20 Oct 2020 08:16:51 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

The crash call trace:

<6>[ 1012.319386] block nbd1: NBD_DISCONNECT
<1>[ 1012.319437] BUG: kernel NULL pointer dereference, address: 0000000000000020
<1>[ 1012.319439] #PF: supervisor write access in kernel mode
<1>[ 1012.319441] #PF: error_code(0x0002) - not-present page
<6>[ 1012.319442] PGD 0 P4D 0
<4>[ 1012.319448] Oops: 0002 [#1] SMP NOPTI
<4>[ 1012.319454] CPU: 9 PID: 25111 Comm: rbd-nbd Tainted: G            E     5.9.0+ #6
   [...]
<4>[ 1012.319505] PKRU: 55555554
<4>[ 1012.319506] Call Trace:
<4>[ 1012.319560]  flush_workqueue+0x81/0x440
<4>[ 1012.319598]  nbd_disconnect_and_put+0x50/0x70 [nbd]
<4>[ 1012.319607]  nbd_genl_disconnect+0xc7/0x170 [nbd]
<4>[ 1012.319627]  genl_rcv_msg+0x1dd/0x2f9
<4>[ 1012.319642]  ? genl_start+0x140/0x140
<4>[ 1012.319644]  netlink_rcv_skb+0x49/0x110
<4>[ 1012.319649]  genl_rcv+0x24/0x40
<4>[ 1012.319651]  netlink_unicast+0x1a5/0x280
<4>[ 1012.319653]  netlink_sendmsg+0x23d/0x470
<4>[ 1012.319667]  sock_sendmsg+0x5b/0x60
<4>[ 1012.319676]  ____sys_sendmsg+0x1ef/0x260
<4>[ 1012.319679]  ? copy_msghdr_from_user+0x5c/0x90
<4>[ 1012.319680]  ? ____sys_recvmsg+0xa5/0x180
<4>[ 1012.319682]  ___sys_sendmsg+0x7c/0xc0
<4>[ 1012.319683]  ? copy_msghdr_from_user+0x5c/0x90
<4>[ 1012.319685]  ? ___sys_recvmsg+0x89/0xc0
<4>[ 1012.319692]  ? __wake_up_common_lock+0x87/0xc0
<4>[ 1012.319715]  ? __check_object_size+0x46/0x173
<4>[ 1012.319727]  ? _copy_to_user+0x22/0x30
<4>[ 1012.319729]  ? move_addr_to_user+0xc3/0x100
<4>[ 1012.319731]  __sys_sendmsg+0x57/0xa0
<4>[ 1012.319744]  do_syscall_64+0x33/0x40
<4>[ 1012.319760]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
<4>[ 1012.319780] RIP: 0033:0x7f5baa8e3ad5

In case the reference of nbd->config reached zero and trying to
free the related resource, including the nbd->recv_workq, if another
process send one DISCONENCT cmd by using the netlink, it will be
potentially crash like this.

This will the nbd->recv_workq under the nbd->config_lock.

Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 drivers/block/nbd.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index edf8b632e3d2..3d3f4255e495 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1327,9 +1327,10 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 					 atomic_read(&config->recv_threads) == 0);
 	if (ret)
 		sock_shutdown(nbd);
-	flush_workqueue(nbd->recv_workq);
 
 	mutex_lock(&nbd->config_lock);
+	flush_workqueue(nbd->recv_workq);
+
 	nbd_bdev_reset(bdev);
 	/* user requested, ignore socket errors */
 	if (test_bit(NBD_RT_DISCONNECT_REQUESTED, &config->runtime_flags))
@@ -1339,6 +1340,18 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 	return ret;
 }
 
+static void nbd_config_clear_rt_ref_and_put(struct nbd_device *nbd)
+{
+	lockdep_assert_held(&nbd->config_lock);
+
+	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
+			       &nbd->config->runtime_flags)) {
+		mutex_unlock(&nbd->config_lock);
+		nbd_config_put(nbd);
+		mutex_lock(&nbd->config_lock);
+	}
+}
+
 static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 				 struct block_device *bdev)
 {
@@ -2006,16 +2019,15 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
 	mutex_lock(&nbd->config_lock);
 	nbd_disconnect(nbd);
 	nbd_clear_sock(nbd);
-	mutex_unlock(&nbd->config_lock);
+
 	/*
 	 * Make sure recv thread has finished, so it does not drop the last
 	 * config ref and try to destroy the workqueue from inside the work
 	 * queue.
 	 */
 	flush_workqueue(nbd->recv_workq);
-	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
-			       &nbd->config->runtime_flags))
-		nbd_config_put(nbd);
+	nbd_config_clear_rt_ref_and_put(nbd);
+	mutex_unlock(&nbd->config_lock);
 }
 
 static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
-- 
2.18.4

