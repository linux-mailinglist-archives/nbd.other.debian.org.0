Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VBCVD5DUS2ogbAEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 06 Jul 2026 18:15:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D19713180
	for <lists+nbd@lfdr.de>; Mon, 06 Jul 2026 18:15:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=SSg0x9ie;
	dmarc=pass (policy=reject) header.from=windriver.com;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 62F0E20439; Mon,  6 Jul 2026 16:15:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul  6 16:15:11 2026
Old-Return-Path: <prvs=16474ce729=yun.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1DDE620676
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jul 2026 15:58:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.879 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ugaEvh_asWw4 for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jul 2026 15:57:55 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.pphosted.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6B10220671
	for <nbd@other.debian.org>; Mon,  6 Jul 2026 15:57:51 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FHMXk3568838;
	Mon, 6 Jul 2026 15:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0BKF1C3IE
	6jZi/U5HMWjXUgvONmjodZpKBdFhgoirb0=; b=SSg0x9ieVu1o//DTUkc4CM/e5
	TOFhiQSP/jJOAN+JZVs5tC8r7dKKIYnCcAyJPe/k04PB3ugjBuQkU7YGE92hdDdO
	3nKvj6WKyJS75GbgaZHiV7vN/2TRD8u4olJSqPLDcRC9LNwjiX7q0nzkioxiWhgU
	O3ca76Py22/AU9LYy0uydh+O3YKsPpIYBj+1hd10og4tIm6gUutpEw5cR5fkW6Iy
	/klxuAym/H8fqpBdY8QY2vR9KzAIUKWJH8iYhTfeQDBs8KlaHMVSdt9CO9VmYJnb
	DM9Npfxkwx2MY8uzEKN8GeMrqam4U6nx3wncUoc67OF89ljMVcJULMl9I34yA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6qcwam73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 06 Jul 2026 15:57:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 6 Jul 2026 08:57:46 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 6 Jul 2026 08:57:44 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
        <linux-kernel@vger.kernel.org>, <yun.zhou@windriver.com>
Subject: [PATCH] nbd: reclassify socket lock in nbd_reconnect_socket
Date: Mon, 6 Jul 2026 23:57:44 +0800
Message-ID: <20260706155744.1399153-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=D4537PRj c=1 sm=1 tr=0 ts=6a4bd07b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=U_4kNCBNHIan1B1hxH8A:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ytdGydgsP-qHm6EvRQjibrzSZJg3lsvw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfXxhcZ9QQhNVV5
 WmZJECatQbxlK5KVszuduIjKveeZfyhLwfDsHUVIkD5vZlUiLr8vQrPCbtB3DV5jQsh5ncI3U15
 YuMhqWjfNaIootDiGvJBJXI3mJAW/m0Vj+jbfcRTSsAb8R/SX/UJ
X-Proofpoint-GUID: ytdGydgsP-qHm6EvRQjibrzSZJg3lsvw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX5TJkzUMiRPOW
 9PNt0sXCSkTpkuJ5smjbIu9oObIhSEYKyEL4iEmN135Z7QCcRyoQby9WkCS6/f6kTnmoKR/3aor
 Qv+zC+cq9uwowbTHyIA2rJ6ni7rAY47z0M1ffvV11l5rD+RyCkA8zIvW7f+3MoNMUPhKTUrhy6E
 sEAKzDDx4MAwrcenMoMYni07lUYG2Ec1smAtctfUqZm9fwfsU/1FPzV8aGLlXrY1NuBSax76UOP
 7cm4SI4R6vmkD29tPQfesagX5ByjyeTkCuzWXTM69IDm8piNztvso5ir3K9H9RynZ92qu0PQ7gI
 w59J8VoywI5TmqrDDe92y9JPrVw1bxpbSqV6GPKb1+7tVR0eVLMLi4hOZJnjre3+E3QuF0WtaUT
 yKVRJI9tpEmqsmz6kqycbSQzNEVc/qBr2IBTtRPPBRE0ixYXFvcUaJO9G5zcEuh52nL5mOG3cya
 r09unRsg66cozY93V7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060162
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Mo_lQUV3jdG.A.hE-L.PS9SqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3581
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260706155744.1399153-1-yun.zhou@windriver.com
Resent-Date: Mon,  6 Jul 2026 16:15:11 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,bendel.debian.org:helo,bendel.debian.org:rdns,other.debian.org:from_smtp,syzkaller.appspot.com:url];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4D19713180

nbd_reconnect_socket() obtains a new socket via nbd_get_socket() but
does not call nbd_reclassify_socket(), leaving the socket's sk_lock in
the default AF_INET6 lockdep class.  This causes false circular lock
dependency warnings because lockdep merges the NBD socket's sk_lock
with unrelated sockets (e.g., rawv6_sendmsg) that establish a
sk_lock -> fs_reclaim dependency in normal operation.

nbd_add_socket() already reclassifies correctly on the initial connect
path, but the reconnect path was missed.

Add the missing nbd_reclassify_socket() call after nbd_get_socket() in
nbd_reconnect_socket().

Reported-by: syzbot+576095eed5658cbd9b63@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=576095eed5658cbd9b63
Fixes: d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular dependency")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8c6028e71e83..70a04d541ea4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1386,6 +1386,8 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 	if (!sock)
 		return err;
 
+	nbd_reclassify_socket(sock);
+
 	args = kzalloc_obj(*args);
 	if (!args) {
 		sockfd_put(sock);
-- 
2.43.0

