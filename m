Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENxzDgS1BmqKnAIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Fri, 15 May 2026 07:54:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A39549C78
	for <lists+nbd@lfdr.de>; Fri, 15 May 2026 07:54:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 05A36206E3; Fri, 15 May 2026 05:54:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 15 05:54:10 2026
Old-Return-Path: <prvs=588cf4563=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F1A38206D5
	for <lists-other-nbd@bendel.debian.org>; Fri, 15 May 2026 05:38:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9u3lqxE-kISb for <lists-other-nbd@bendel.debian.org>;
	Fri, 15 May 2026 05:38:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 443 seconds by postgrey-1.36 at bendel; Fri, 15 May 2026 05:38:23 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4C587206D4
	for <nbd@other.debian.org>; Fri, 15 May 2026 05:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1778823503; x=1810359503;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v8pNUrpcBdGVPpVECnZ6fIbKfIHozyqVx+b1cP5wYNc=;
  b=VQ/p13STDd2Gp/fwdhlhQ0QWkcnN668Un2L5cY5Xrncmr9Qj026gultB
   pQ0gYFgOu/EMz1ggsLeU/hs6aDRa3FPG0aK8wkFM2dU1mhuQx26swi18m
   4uNENOxtHEhYHloZfRuaLQedJoUHj64tjcYyvgaUnvlabsY3yBFYcxPqL
   FB1e+n8S8+vviXDwOxaOBHcPo1ZEKAPHTn1wwz9/6CayLRv8UWae07k5Y
   oZxyoXYX3z2eLqTCJBPU+O09TFuRMsDHjJKp5ftm49U/xHUiVT0d1giEE
   Ew1CShlFS9qE4Wwjw7/Kdc4IU3I7oobyHQpgTEtreBi9rMk0DxP5Nvqk7
   A==;
X-CSE-ConnectionGUID: 3FO9cHk/R92d3qQHO1b0/g==
X-CSE-MsgGUID: QlpR5kwWQDy73zkVQYvXnA==
X-IronPort-AV: E=Sophos;i="6.23,235,1770566400"; 
   d="scan'208";a="147794527"
Received: from unknown (HELO uls-op-esad2-o.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 May 2026 13:30:55 +0800
X-CSE-ConnectionGUID: oaJSMi6TTMGYR96BfuKHzQ==
X-CSE-MsgGUID: ARqeVazoR62ikIngZHSHjQ==
IronPort-SDR: 6a06af89_oBPJFLRlWgz++9PoyYbXu+k81/bDLSmt5hqvFyyKoPKtXBQ
 AH7vo/2LFUUb8SxOWUOyekTjmDyF6jXbi+oTNxg==
Received: from uls-op-esai1-o.wdc.com ([10.248.3.45])
  by uls-op-esad2-o.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 May 2026 22:30:49 -0700
X-CSE-ConnectionGUID: WIKwhuzVRmCRp2kfenYGCg==
X-CSE-MsgGUID: o0TWEpVETiq7o0jCztdHkw==
WDCIronportException: Internal
Received: from 5cg10868bz.ad.shared (HELO shinmob.iptvf.jp) ([10.224.105.166])
  by uls-op-esai1-o.wdc.com with ESMTP; 14 May 2026 22:30:49 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH blktests] nbd/rc: redirect nbd-server stderr
Date: Fri, 15 May 2026 14:30:47 +0900
Message-ID: <20260515053047.64075-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aSJJ0-D6gxK.A.VVnK.CUrBqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3537
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260515053047.64075-1-shinichiro.kawasaki@wdc.com
Resent-Date: Fri, 15 May 2026 05:54:11 +0000 (UTC)
X-Rspamd-Queue-Id: C8A39549C78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[wdc.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[wdc.com:s=dkim.wdc.com];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:shinichiro.kawasaki@wdc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[shinichiro.kawasaki@wdc.com,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[wdc.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[shinichiro.kawasaki@wdc.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wdc.com:email,wdc.com:mid,wdc.com:dkim,bendel.debian.org:helo,bendel.debian.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Action: no action

Recent nbd commit da5e07c057ab ("Reimplement daemonize() without using
daemon()") changed how nbd-server daemonizes itself. After this commit,
nbd-server prints messages to stderr after daemonization. This caused
nbd test cases to fail due to unexpected stderr output.

nbd/001 (resize a connected nbd device)                      [failed]
    runtime  0.865s  ...  0.883s
    --- tests/nbd/001.out	2025-04-22 13:13:27.727873155 +0900
    +++ /home/shin/Blktests/blktests/results/nodev/nbd/001.out.bad	2026-05-15 11:44:46.269000000 +0900
    @@ -1,4 +1,5 @@
     Running nbd/001
    +Error: Session terminated by client
     Disk /dev/nbd0: 10.7GB
     nbd0 43:0 0 10G 0 disk
     Setting size to 1gib

The commit is in nbd version v3.27, which is included in Fedora 44.

To avoid the failures, redirect nbd-server stderr to .full files.

Link: https://github.com/NetworkBlockDevice/nbd/commit/da5e07c057ab
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 tests/nbd/rc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/nbd/rc b/tests/nbd/rc
index e200ba6..6205c49 100644
--- a/tests/nbd/rc
+++ b/tests/nbd/rc
@@ -72,7 +72,7 @@ allowlist=true
 [export]
 exportname=${TMPDIR}/export
 EOF
-	nbd-server -p "${TMPDIR}/nbd.pid" -C "${TMPDIR}/nbd.conf"
+	nbd-server -p "${TMPDIR}/nbd.pid" -C "${TMPDIR}/nbd.conf" 2> "$FULL"
 
 	# Wait for nbd-server start listening the port
 	for ((i = 0; i < 100; i++)); do
-- 
2.54.0

