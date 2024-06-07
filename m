Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEB18FFB72
	for <lists+nbd@lfdr.de>; Fri,  7 Jun 2024 07:51:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0E8D7205B0; Fri,  7 Jun 2024 05:51:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  7 05:51:13 2024
Old-Return-Path: <prvs=881dfa554=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2443F205B0
	for <lists-other-nbd@bendel.debian.org>; Fri,  7 Jun 2024 05:35:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.51 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BXb7ATo2CHK8 for <lists-other-nbd@bendel.debian.org>;
	Fri,  7 Jun 2024 05:35:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 438 seconds by postgrey-1.36 at bendel; Fri, 07 Jun 2024 05:35:49 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EEE312052D
	for <nbd@other.debian.org>; Fri,  7 Jun 2024 05:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1717738550; x=1749274550;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NveE7PPjdZ01AdU+QaASlmnBOhAaQEOvYc0b9IrC3sY=;
  b=WNRDVrNtPB/7bLtkhcIyUYOIaHZQvkhf7aDbVEb7o9uBUxqSpT2kIHPU
   2EazSiPHqArw2V9oKudgRDQZDi0ZHl4Q7xer7wa7+lFdW9i0KeKqdnQcu
   WYuQqFc7ia6U2vhe7joUOYFFndfZA1Uo1SK+hC8LmDagg0s5IBOKzcZHG
   jw5vJkStAGIg0IsQ9FCRej2d4TwbANL6G3FMIsHPEEJco7Fm7UA5QcqyN
   GBsUUD1onwTMW/Mwys1iveNg9lOsXhKBdea01BgNaOzsTw18UjXu3OWK7
   5//DFZDU0auPSE5WmdskMaqLAcHq3u2GtNrlaQX2P4owqwqYuMV5VbVYq
   A==;
X-CSE-ConnectionGUID: xpRl3rgVSLScvexyoAmEMQ==
X-CSE-MsgGUID: S7lQ8Vw3Rh+xxUzZainEsg==
X-IronPort-AV: E=Sophos;i="6.08,220,1712592000"; 
   d="scan'208";a="18454443"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 07 Jun 2024 13:28:27 +0800
IronPort-SDR: 66628e20_udaBH1r3sWeHGADjkFefXQUwy/qruM7PkvSRWXEtJGoW+ms
 ZKOhZPkSWHeoRDsmAiM+ln+zJGNB2XTZA608VbA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Jun 2024 21:35:44 -0700
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 06 Jun 2024 22:28:26 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: Sun Ke <sunke32@huawei.com>,
	Yi Zhang <yi.zhang@redhat.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH blktests] nbd/004: drop the check for "couldn't allocate config" message
Date: Fri,  7 Jun 2024 14:28:26 +0900
Message-ID: <20240607052826.249014-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <x8iyXcDO2WC.A.POHI.R_pYmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2891
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240607052826.249014-1-shinichiro.kawasaki@wdc.com
Resent-Date: Fri,  7 Jun 2024 05:51:14 +0000 (UTC)

The test case nbd/004 was created to confirm the fix by the kernel
commit 06c4da89c24e ("nbd: call genl_unregister_family() first in
nbd_cleanup()"). Originally, the test case was created to check that the
kernel commit avoided a BUG. But the BUG was not recreated on my system
even without the kernel commit, so I was not able to confirm that the
test case was working as expected. On the other hand, I found that the
kernel commit avoided the two other kernel messages "couldn't allocate
config" and "cannot create duplicate filename" on my test system. Then I
suggested adding the checks for those messages to the test case, and the
checks were added [1].

However, it turned out that the kernel commit did not totally avoid the
message "couldn't allocate config". The test case still makes the kernel
report the message with a low ratio. The failure is recreated when the
test case is repeated around 30 times. The CKI project reported that
nbd/004 fails due to the message [2].

When the failure happens, try_module_get() fails in nbd_genl_context():

nbd_genl_connect()
 nbd_alloc_and_init_config()
  try_module_get()            ... fails

This try_module_get() call checks that the module is not unloaded during
the connect operation. The test case does "module load/unload
concurrently with connect/disconnect" then the try_module_get() failure
is expected. It means the failure is false-positive.

Drop the wrong check for "couldn't allocate config" message. Still keep
the check for "cannot create duplicate filename".

[1] https://lore.kernel.org/linux-block/20220707124945.c2rd677hjwkd7mim@shindev/
[2] https://github.com/osandov/blktests/issues/140

Fixes: 349eb683fd06 ("nbd: add a module load and device connect test")
Reported-by: Yi Zhang <yi.zhang@redhat.com>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 tests/nbd/004 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/nbd/004 b/tests/nbd/004
index 1758859..a866ea5 100755
--- a/tests/nbd/004
+++ b/tests/nbd/004
@@ -50,8 +50,8 @@ test() {
 
 	_stop_nbd_server_netlink
 
-	if _dmesg_since_test_start | grep -q -e "couldn't allocate config" \
-		-e "cannot create duplicate filename"; then
+	if _dmesg_since_test_start | \
+			grep --quiet "cannot create duplicate filename"; then
 			echo "Fail"
 	fi
 
-- 
2.45.0

