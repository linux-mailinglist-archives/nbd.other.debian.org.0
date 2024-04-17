Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3408A81A8
	for <lists+nbd@lfdr.de>; Wed, 17 Apr 2024 13:06:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 14A53207F5; Wed, 17 Apr 2024 11:06:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 17 11:06:40 2024
Old-Return-Path: <prvs=830b8c31b=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 444BE207E7
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Apr 2024 10:50:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MyvAZaMxs7KG for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Apr 2024 10:50:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2FEC5207DF
	for <nbd@other.debian.org>; Wed, 17 Apr 2024 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1713351050; x=1744887050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3roGAFq0akpy3yja+jCNy+bt+me5vr5KFtx4OdO58SQ=;
  b=aHObhkfyUp+xwvDHoHDwmlyW6dWZ+5KLCCtt4MuyI//jQ0Hh20zH0BlD
   CaZXdPU021BOubB5ltxMyiBj1cyBEl5Qa7uvVxmfUBDGrnYK4f/owYgSD
   LoFGGje7XPX5qNL+Jvk3IliLIr8O2qcHr+twry/Y433SCg0meCiTGc+HT
   RSpgaNyq+znapOuFjzNQhAAr8HfdX4diE76T0BgAEUY/2yuVirAfWlvUa
   4MdDadBvhRirH/RmB1rAvbtLXuKMveArBhEkle6mfs5xJiP/+iiC1+njY
   /gVLr3HFA4+cmT6BpwZkPYUpaoTJR6MfyuTWyXXghosqJgO9s9wORojTJ
   w==;
X-CSE-ConnectionGUID: +8SWbAaCQmWwO8T8gxEMqg==
X-CSE-MsgGUID: y8qzAYjqTiK/TEWPH+meFQ==
X-IronPort-AV: E=Sophos;i="6.07,209,1708358400"; 
   d="scan'208";a="14913465"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2024 18:42:13 +0800
IronPort-SDR: UNpRB+euB0d0UamRgZE3UJJLkLU13V6JY/069FsCpEtSIck9XyjBxPeBhyvO9hY8NsMgplY3av
 OzANOL3r87ZrE5+goRUKpEsaYqgl5cxHLFRi+xHDXvDNVwIN882y4hhG6xE6Zd1ZrRm0wuXVS9
 WQM+OJ53TS6XL1tvK3jOK3AFIW50kN3c5wC6cUixnGxpIW89quomd2QEUYzOI7WfuOy+8laEiG
 QxtgVyLl2paktkWHC4l7suZS0HUTgUiNJlXSRhFPM/XP8bDk4Hch0faXyejhRXFgyEoUteL8Wm
 eGA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Apr 2024 02:44:51 -0700
IronPort-SDR: 2lueZgCJKeUgOK1iCvOdv3rtDN0qEyJDam5qcH2IIBDzHsgoBZvkQdoKLeENNXMTgu+l+hfPLD
 90eiTc2LV5LRzQ+tHnPEQUYCPVxSYD8Ue/3W7bP4oikLs9RdY9DQWxuALWGqecIcCUB3EdlG4/
 l3CSbHV2XVYDC23NGZFeWUZECv4OUGXN5mDRKg0lYF2LQt+6ReOaqaoGsJLFTbmAvaGtyh/G63
 7HrNJV4VSZgWDYhYZKQYGGtsqa60AggHRIGo0SI38EmC/Ex55xTpHJSMkJW9ZJnARtx5LG+iyo
 owA=
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 17 Apr 2024 03:42:13 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org
Cc: nbd@other.debian.org,
	Josef Bacik <josef@toxicpanda.com>,
	Yi Zhang <yi.zhang@redhat.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH blktests v2 2/2] nbd/002: repeat partition existence check for ioctl interface
Date: Wed, 17 Apr 2024 19:42:09 +0900
Message-ID: <20240417104209.2898526-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
References: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NScHyvLN1kO.A.tyC.A16HmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2794
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240417104209.2898526-3-shinichiro.kawasaki@wdc.com
Resent-Date: Wed, 17 Apr 2024 11:06:41 +0000 (UTC)

When nbd-client is set up with the ioctl interface, it takes some time
for the nbd driver and the block layer to complete the partition read.
The test script calls stat command for the /dev/nbd0p1 device to check
the partition exists as expected. However, this stat command is often
called before the partition read completion, then causes the test case
failure.

To avoid the test case failure, repeat the partition check a few times
with one second wait.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 tests/nbd/002 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/nbd/002 b/tests/nbd/002
index 968c9fa..8e4e062 100755
--- a/tests/nbd/002
+++ b/tests/nbd/002
@@ -21,6 +21,8 @@ requires() {
 }
 
 test() {
+	local pass i
+
 	echo "Running ${TEST_NAME}"
 	_start_nbd_server
 	{
@@ -64,7 +66,15 @@ test() {
 
 	udevadm settle
 
-	if ! stat /dev/nbd0p1 >> "$FULL" 2>&1; then
+	pass=false
+	for ((i = 0; i < 3; i++)); do
+		if stat /dev/nbd0p1 >> "$FULL" 2>&1; then
+			pass=true
+			break
+		fi
+		sleep 1
+	done
+	if [[ $pass != true ]]; then
 		echo "Didn't have partition on ioctl path"
 		nbd-client -nonetlink -d /dev/nbd0 >> "$FULL" 2>&1
 		_stop_nbd_server
-- 
2.44.0

