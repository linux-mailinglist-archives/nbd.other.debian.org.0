Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A15934CA6
	for <lists+nbd@lfdr.de>; Thu, 18 Jul 2024 13:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7B5C620CE4; Thu, 18 Jul 2024 11:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 18 11:36:10 2024
Old-Return-Path: <prvs=9221086d1=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DA2F120BDE
	for <lists-other-nbd@bendel.debian.org>; Thu, 18 Jul 2024 11:19:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D0OoJt0iHHrH for <lists-other-nbd@bendel.debian.org>;
	Thu, 18 Jul 2024 11:19:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 439 seconds by postgrey-1.36 at bendel; Thu, 18 Jul 2024 11:19:31 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 20F0D20BB8
	for <nbd@other.debian.org>; Thu, 18 Jul 2024 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1721301571; x=1752837571;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DTmS+6O7O1eZq3aJCgHyvagxmYMDIEkYQB8dqTNt8j8=;
  b=EHS0Qh5itA2WIAj+jpYx91yoalfsrN1dR06DBxeXdbfP5cqoQ0Iqab2u
   MhKsZ/XFXNOc3rDqA7RlNQtFL9Ivm1AotN5Zex2iBdf6HnDaJmgGKce02
   MySrHto6nM4SFpP96L7fFzyEuvUNm2zxZo7A5RPLgH4zGgg+0RqjfnLra
   tpKeKSdD6Fr1Uzgq34s6ZhMb22vu9Ns3TrPatCvQ/qLOUjzP9u5GJfAti
   nBbU26u9Ei5ATwOVyj/d+q9GSqahnYYA3nAe0eIaRgQIia5mFS/2JhOMO
   F3POMyyPYaegko0g3vR2GFoAR75omEXNc3FmBNzclibWcLKtaOMn5rT1j
   w==;
X-CSE-ConnectionGUID: l60zuUL1Sam5535zuc2w+g==
X-CSE-MsgGUID: PtntvVVLQ8ukRWI6s4DRyQ==
X-IronPort-AV: E=Sophos;i="6.09,217,1716220800"; 
   d="scan'208";a="22183266"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 18 Jul 2024 19:12:08 +0800
IronPort-SDR: 6698eaa6_WK4yzG3ptrR/yYXg0nBEaEBAeGoL/lbGUtQwSHbVXnvDnnh
 zwqip5I4AtKP1J2ONMrBHXgejIg5GFLqIAQyswQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jul 2024 03:12:54 -0700
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 18 Jul 2024 04:12:07 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: Yi Zhang <yi.zhang@redhat.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH blktests] nbd/rc: check nbd-server port readiness in _start_nbd_server()
Date: Thu, 18 Jul 2024 20:12:07 +0900
Message-ID: <20240718111207.257567-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gAWGUrFb45D.A.W51D.q4PmmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3095
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240718111207.257567-1-shinichiro.kawasaki@wdc.com
Resent-Date: Thu, 18 Jul 2024 11:36:10 +0000 (UTC)

Recently, CKI project reported nbd/001 and nbd/002 failure with the
error message "Socket failed: Connection refused". It is suspected nbd-
server is not yet ready when nbd-client connects for the first time.

To avoid the failure, wait for the nbd-server start listening to the
port at the end of _start_nbd_server(). For that purpose, use
"nbd-client -l" command, which connects to the server and asks to list
available exports.

Reported-by: Yi Zhang <yi.zhang@redhat.com>
Link: https://github.com/osandov/blktests/issues/142
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 tests/nbd/rc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/nbd/rc b/tests/nbd/rc
index e96dc61..a56bae5 100644
--- a/tests/nbd/rc
+++ b/tests/nbd/rc
@@ -63,13 +63,24 @@ _wait_for_nbd_disconnect() {
 }
 
 _start_nbd_server() {
+	local i
+
 	truncate -s 10G "${TMPDIR}/export"
 	cat > "${TMPDIR}/nbd.conf" << EOF
 [generic]
+allowlist=true
 [export]
 exportname=${TMPDIR}/export
 EOF
 	nbd-server -p "${TMPDIR}/nbd.pid" -C "${TMPDIR}/nbd.conf"
+
+	# Wait for nbd-server start listening the port
+	for ((i = 0; i < 10; i++)); do
+		if nbd-client -l localhost &> "$FULL"; then
+			break
+		fi
+		sleep 1
+	done
 }
 
 _stop_nbd_server() {
-- 
2.45.2

