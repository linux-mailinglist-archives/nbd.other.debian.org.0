Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EAF937342
	for <lists+nbd@lfdr.de>; Fri, 19 Jul 2024 07:30:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F410421044; Fri, 19 Jul 2024 05:30:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jul 19 05:30:21 2024
Old-Return-Path: <prvs=923ffa9e3=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EF07F21016
	for <lists-other-nbd@bendel.debian.org>; Fri, 19 Jul 2024 05:14:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p6LWsFW_s0lt for <lists-other-nbd@bendel.debian.org>;
	Fri, 19 Jul 2024 05:14:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 435 seconds by postgrey-1.36 at bendel; Fri, 19 Jul 2024 05:14:46 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 78D8621011
	for <nbd@other.debian.org>; Fri, 19 Jul 2024 05:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1721366086; x=1752902086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VV8Xy8zYZ0AbYsdY0Gz82RWxPJbZvsfroLpE0IFRuwI=;
  b=Nstk9o1EEN98WsSs6hTxCy06nAb8kg/UTmuNjda3guy5hWiirhwL8T1W
   0TwrsJ/I7x/bqeOYsIYLqOop0ioH7W86cNtwVlnsBQInnWHTLSz/7f5xz
   OiLK2SjCPb+H3d34n2Acle0QmgJsURY54XxM4O9mCcbwIVOxHOS5dXvs8
   oivK8AEPS3zRA/r37B2aB3Ph7SmWoa6EqN6bVHSkOjy6BSeBiyP3+v8AT
   0BwXguKZgXojYXDy2IzKAYpKLYMRQdH9+veZxS3jpiHg6yplYBvNtwK5j
   ZpSYhr/j6niBUlP0K3f7UWWcIST80eCcaM8wgIZV9YqLd06IMlRKTaolA
   Q==;
X-CSE-ConnectionGUID: cYOrTk/nSImZmnTWLDhGZg==
X-CSE-MsgGUID: X6YCwthHRvyFzBesnec1Yg==
X-IronPort-AV: E=Sophos;i="6.09,219,1716220800"; 
   d="scan'208";a="22245609"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 19 Jul 2024 13:07:27 +0800
IronPort-SDR: 6699e801_/AEesXsC1kdeXStirjT8pZyHFqrRgmjH7u8Do1WK1nmmD9o
 WZhIJhIQGQKDIr4WPa1sa3bN0hwhJM0ngaojG3Q==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jul 2024 21:13:53 -0700
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 18 Jul 2024 22:07:28 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Yi Zhang <yi.zhang@redhat.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH blktests v2] nbd/rc: check nbd-server port readiness in _start_nbd_server()
Date: Fri, 19 Jul 2024 14:07:26 +0900
Message-ID: <20240719050726.265769-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_0pQCxNnv6E.A.0_t.tnfmmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3098
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240719050726.265769-1-shinichiro.kawasaki@wdc.com
Resent-Date: Fri, 19 Jul 2024 05:30:21 +0000 (UTC)

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
Change from v1:
* Reduced sleep time from 1 second to 0.1 second

 tests/nbd/rc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/nbd/rc b/tests/nbd/rc
index e96dc61..e200ba6 100644
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
+	for ((i = 0; i < 100; i++)); do
+		if nbd-client -l localhost &> "$FULL"; then
+			break
+		fi
+		sleep .1
+	done
 }
 
 _stop_nbd_server() {
-- 
2.45.2

