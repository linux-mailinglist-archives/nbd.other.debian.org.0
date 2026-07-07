Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MScBIg7fTGpsrQEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 07 Jul 2026 13:12:14 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA271AD45
	for <lists+nbd@lfdr.de>; Tue, 07 Jul 2026 13:12:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=HUYpN43x;
	dmarc=pass (policy=reject) header.from=windriver.com;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1CDAB2057E; Tue,  7 Jul 2026 11:12:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  7 11:12:11 2026
Old-Return-Path: <prvs=16481e4b5d=yun.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 55DF620564
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jul 2026 10:54:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.899 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2Ex9N48_sMBU for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jul 2026 10:53:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1582 seconds by postgrey-1.36 at bendel; Tue, 07 Jul 2026 10:53:58 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.pphosted.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0F451204D9
	for <nbd@other.debian.org>; Tue,  7 Jul 2026 10:53:57 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678GlHC1173721;
	Tue, 7 Jul 2026 03:27:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pYhbLT4PfFAwIweFzAjP0tRW9vm8wKWLPiQXEilVNkI=; b=
	HUYpN43xTprL33ZX5bGmIQ2Iw2u0ncdz8PvbaFdU/KzB345Xvqd1dZ1xQYXqbaiV
	xQ2m5A/fI6dayoWnJodNPzRm8RJF3yQseFS8bBu/64lqg40qyRn/CAOSOcOja3kU
	tLs32zkl4vpJQKGlP2/K98f8A9Ra3KtglYSCVK/omBnyj9Cg4eqzntHK9LLzT2qp
	dAK1uryPxBd43whkrTNiyWIsfMCNaQoJV+w1Ilut0lm8lvHUmx9wLvIIAgpyBFbk
	yhH2Q6a/6AQAVVxqk4nvG1+JHGNnlgmHuTNwA07OI2pRfTAZnd6VFXQQvRbPWwCA
	DkDxqOoApMPsT+Cbvqyp4A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe3mfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 07 Jul 2026 03:27:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 7 Jul 2026 03:27:29 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 7 Jul 2026 03:27:27 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
        <linux-kernel@vger.kernel.org>, <yun.zhou@windriver.com>
Subject: [PATCH 2/2] nbd: detect management process exit via netlink notifier
Date: Tue, 7 Jul 2026 18:27:24 +0800
Message-ID: <20260707102724.3838638-2-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707102724.3838638-1-yun.zhou@windriver.com>
References: <20260707102724.3838638-1-yun.zhou@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qSkQ9cP_KG4l5hbxPkBAtz_wvXRbHjgE
X-Proofpoint-ORIG-GUID: qSkQ9cP_KG4l5hbxPkBAtz_wvXRbHjgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMSBTYWx0ZWRfX2yviIXIJJtI7
 GoFuaeQgmzMNXc/aqP1bV0tjH7elLEXeupL3lW5lF31aNFmh0MOSukBAxBpox+f9KGC6Y6trM+8
 yj4FqPZFEkh8e+3xIDNAPj0JjgLJGvUR5oruSEbZPKU+HeAR1PZhdUIPnabEj2vYfIDrRZkGy4u
 VY7agg+a6CZiGgCByJHT6mLNOyGnGlM+5bXioSeRhw7GsS5gEMzautLFQ6czzWeWd3x0T8K2F/q
 nVfyje/jZ/7msHmowGXIYXMUOBfWdFiZwd7j1+UenG6079Ol0M8uBE5YvOdNAxaZqdFSQdqHlRx
 N/NiKopb1RcXFGOY354Oet+OFw5dupci16gCE+JSIe0pfTJnkHKrv63K2CcCTQ3BcrbvnitnsVo
 8e7vFtKvr/+fzVRzCX3STFgRdojIAGIbAS21WmYus3AOSCX64qb1baAQKMbeUErJeIuPs3+m1h2
 2Qw5ooHYx9+5LAo+JTw==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4cd492 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=Lt-lTd8dryHg_DWUlXYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMSBTYWx0ZWRfX+Pfij7GPSHuJ
 ZYhHSVsSPL08bYjA5mHhfx8M0B1Rdfd3bOOxdIQghUQOYZyi4lDBdSoAMBQEO9PXA9zceGzWxe4
 dygSk0xdVYbkS+WNvwCzLeyCD0ME6ab2xkP2uUkvHGtU6WMkMEN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070101
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tjTkLdQVSnB.A.y9ZN.L8NTqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3583
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260707102724.3838638-2-yun.zhou@windriver.com
Resent-Date: Tue,  7 Jul 2026 11:12:11 +0000 (UTC)
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:from_mime,windriver.com:email,windriver.com:mid,windriver.com:dkim,bendel.debian.org:helo,bendel.debian.org:rdns,other.debian.org:from_smtp];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36BA271AD45

Register a netlink notifier to detect when the NBD management process
closes its netlink socket (on exit or crash).

Without this, in-flight I/O waits for socket timeout while udevd holds
disk->open_mutex for partition scanning, blocking poweroff's
sync_bdevs() and causing a hung task during shutdown.

Fix this by tracking the management process's netlink portid and, on
NETLINK_URELEASE, calling sock_shutdown() on all devices it owns.
This fails in-flight I/O immediately so shutdown can proceed.

Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 drivers/block/nbd.c | 59 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43aa4121f0c5..3bf88f7b3535 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -45,6 +45,7 @@
 #include <linux/nbd.h>
 #include <linux/nbd-netlink.h>
 #include <net/genetlink.h>
+#include <linux/netlink.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nbd.h>
@@ -131,6 +132,7 @@ struct nbd_device {
 
 	unsigned long flags;
 	pid_t pid; /* pid of nbd-client, if attached */
+	u32 owner_portid; /* netlink portid of management process */
 
 	char *backend;
 };
@@ -2331,12 +2333,19 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	}
 	set_bit(NBD_RT_HAS_BACKEND_FILE, &config->runtime_flags);
 
+	/*
+	 * Set owner before starting device so that the netlink notifier
+	 * can clean up if the management process exits during setup.
+	 */
+	nbd->owner_portid = info->snd_portid;
 	ret = nbd_start_device(nbd);
 out:
 	if (!ret) {
 		set_bit(NBD_RT_HAS_CONFIG_REF, &config->runtime_flags);
 		refcount_inc(&nbd->config_refs);
 		nbd_connect_reply(info, nbd->index);
+	} else {
+		nbd->owner_portid = 0;
 	}
 	mutex_unlock(&nbd->config_lock);
 
@@ -2541,6 +2550,12 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 		}
 	}
 out:
+	/*
+	 * Update owner to the reconfiguring process so the notifier
+	 * tracks the correct management process.
+	 */
+	if (!ret)
+		nbd->owner_portid = info->snd_portid;
 	mutex_unlock(&nbd->config_lock);
 	nbd_config_put(nbd);
 	nbd_put(nbd);
@@ -2743,6 +2758,48 @@ static void nbd_dead_link_work(struct work_struct *work)
 	kfree(args);
 }
 
+/*
+ * Detect when the management process (the one that issued NBD_CMD_CONNECT)
+ * closes its netlink socket (e.g., exit or crash).  When this happens,
+ * no one can reconnect, so mark all its devices as disconnected to stop
+ * waiting for reconnect and fail pending I/O promptly.
+ */
+static int nbd_netlink_event(struct notifier_block *this,
+			     unsigned long event, void *ptr)
+{
+	struct netlink_notify *n = ptr;
+	struct nbd_device *nbd;
+	int id;
+
+	if (event != NETLINK_URELEASE || n->protocol != NETLINK_GENERIC)
+		return NOTIFY_DONE;
+
+	mutex_lock(&nbd_index_mutex);
+	idr_for_each_entry(&nbd_index_idr, nbd, id) {
+		if (nbd->owner_portid != n->portid)
+			continue;
+
+		nbd->owner_portid = 0;
+		if (refcount_inc_not_zero(&nbd->config_refs)) {
+			/*
+			 * Shut down all sockets.  sock_shutdown() holds
+			 * tx_lock for each socket, preventing races with
+			 * reconnect, and sets NBD_RT_DISCONNECTED so that
+			 * nbd_reconnect_possible() fails immediately.
+			 */
+			sock_shutdown(nbd);
+			nbd_config_put(nbd);
+		}
+	}
+	mutex_unlock(&nbd_index_mutex);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block nbd_netlink_notifier = {
+	.notifier_call = nbd_netlink_event,
+};
+
 static int __init nbd_init(void)
 {
 	int i;
@@ -2789,6 +2846,7 @@ static int __init nbd_init(void)
 		unregister_blkdev(NBD_MAJOR, "nbd");
 		return -EINVAL;
 	}
+	netlink_register_notifier(&nbd_netlink_notifier);
 	nbd_dbg_init();
 
 	for (i = 0; i < nbds_max; i++)
@@ -2818,6 +2876,7 @@ static void __exit nbd_cleanup(void)
 	 * for the completion of netlink commands.
 	 */
 	genl_unregister_family(&nbd_genl_family);
+	netlink_unregister_notifier(&nbd_netlink_notifier);
 
 	nbd_dbg_close();
 
-- 
2.43.0

