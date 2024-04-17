Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE68A81A5
	for <lists+nbd@lfdr.de>; Wed, 17 Apr 2024 13:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 75E20207F1; Wed, 17 Apr 2024 11:06:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 17 11:06:27 2024
Old-Return-Path: <prvs=830b8c31b=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 35A04207E6
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Apr 2024 10:49:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IPG9w28AE4D0 for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Apr 2024 10:49:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 108DD207E8
	for <nbd@other.debian.org>; Wed, 17 Apr 2024 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1713350975; x=1744886975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g3fx1ZTkHRAoDOZOkdg+UOQMZLU5smY4eolMVN8yWPg=;
  b=oTHTZBSu8Jgy3KJ60XsbBeAS20L29DIndFKUsTzpjo0ezU7lBRcbnE7T
   MUOJPHvpHtst2oUzr6MrQI7couTeSSX5/jyAafoP+1aET2Kza74bJZqXJ
   kfBpnkzvRZ6ujXNRgGblq+mOG1Y3jvO6pmxAHb91VstFsSUl/CNtwT/PL
   hnqU1IojEGADIMaCW4I0aa0Rg0W+FA52/VCtni9k3HK8magqz9T7Juj89
   fj/GL/9Qe6BaAFZs8plvpTMDDmO071W7EImBzhO2DUlmECCCJf1JLUGfY
   CWib2dgfkHTVcGGmFmGu3kdz/40vp9/wNP11mt/+bhjJ4a8GX0dsQB1t1
   g==;
X-CSE-ConnectionGUID: vimMs+jaTRKYx55ezkBCSw==
X-CSE-MsgGUID: y4WdNi+qRaGriA/f8XfkRA==
X-IronPort-AV: E=Sophos;i="6.07,209,1708358400"; 
   d="scan'208";a="14913461"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2024 18:42:12 +0800
IronPort-SDR: USNnPTmJfklaWApEWglkWpOeS5cVuFtX2eLDbDhcEJBVBB105yzs0sPWFtlvn40WYY6DJepjtx
 1+CkLN/agiN1S7JXqsFIK3h+QOkj2Tev/yGNagAcGEAOhBtQCSiG/BJLEh2Jjmhg36TA+Wd+Zg
 oHALgJTrsmU5vzX8DRNcXl5DBavKwC1suAYQDQ3Xh6oIYWgMb4EMQ7HNeM7mP9aafK7cUgMmG2
 gmDnZI/nc55k27ocIIP8Z9th4WLdMA2MdH0wGVtn/rnMrSju9JOBBMxGcm/Uk0Q/U09LbzAQqs
 sIo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Apr 2024 02:44:50 -0700
IronPort-SDR: TgN2iPQSnxWxnpydXPHereC4u1YXV0HsheYkj204Wsc1vXCoUPopvgdAkz/ZYWifaxsk3Ui0UC
 u+BhJIfslqPozNamHXM3+uFE+6w1nLrR3mmsdu3qBf6e9u4RK/LNqS/m7oojriPRh/QmcD2fCU
 RxCrYjLIiLD4NtbYu15OU+GA1MVGtpjppTzZ0jf+BgJmYJotTsH+j1fhJh6jcfmyNgeAocLIq+
 c/UIvwLREBZQatUW4vsadPXm+3/TtegnCwucqFUdCEtq0GEs7BEHG8mrL/6ZBF3H9cSn3AEBMW
 vnQ=
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 17 Apr 2024 03:42:11 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org
Cc: nbd@other.debian.org,
	Josef Bacik <josef@toxicpanda.com>,
	Yi Zhang <yi.zhang@redhat.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH blktests v2 1/2] nbd/002: fix wrong -L/-nonetlink option usage
Date: Wed, 17 Apr 2024 19:42:08 +0900
Message-ID: <20240417104209.2898526-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
References: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Vgh49A6KioL.A.YsC.z06HmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2793
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240417104209.2898526-2-shinichiro.kawasaki@wdc.com
Resent-Date: Wed, 17 Apr 2024 11:06:27 +0000 (UTC)

As the commit 3c014acd5171 ("nbd/001: use -L for nbd-client") explains,
the nbd-client command uses the netlink interface instead of the ioctl
interface. The default interface changed at nbd version 3.17 in March
2018. Before that, the default was ioctl. After the change, the
nbd-client command requires -L or -nonetlink option to use the ioctl
interface.

The commit 3c014acd5171 adjusted nbd/001 test script to the default
interface change. However, it is not reflected to nbd/002. This caused
mismatch between the comments in the test case and the actual test. The
comments describe the first half as "Do it with ioctls", and the last
half as "Do it with netlink". However, the test script does opposite. It
specifies no option for the first half, then tests with netlink
interface. It specifies -L option for the last half, then tests with the
ioctl interface.

This makes it difficult to debug the failure of the test case. Fix the
nbd-client command option to match the comments. Also, use the long
option -nonetlink instead of -L for easier reading.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 tests/nbd/002 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/nbd/002 b/tests/nbd/002
index fd992a0..968c9fa 100755
--- a/tests/nbd/002
+++ b/tests/nbd/002
@@ -53,11 +53,11 @@ test() {
 
 	echo "Testing IOCTL path"
 
-	nbd-client -N export localhost /dev/nbd0 >> "$FULL" 2>&1
+	nbd-client -nonetlink -N export localhost /dev/nbd0 >> "$FULL" 2>&1
 
 	if ! _wait_for_nbd_connect; then
 		echo "Connect didn't happen?"
-		nbd-client -d /dev/nbd0 >> "$FULL" 2>&1
+		nbd-client -nonetlink -d /dev/nbd0 >> "$FULL" 2>&1
 		_stop_nbd_server
 		return 1
 	fi
@@ -66,12 +66,12 @@ test() {
 
 	if ! stat /dev/nbd0p1 >> "$FULL" 2>&1; then
 		echo "Didn't have partition on ioctl path"
-		nbd-client -d /dev/nbd0 >> "$FULL" 2>&1
+		nbd-client -nonetlink -d /dev/nbd0 >> "$FULL" 2>&1
 		_stop_nbd_server
 		return 1
 	fi
 
-	nbd-client -d /dev/nbd0 >> "$FULL" 2>&1
+	nbd-client -nonetlink -d /dev/nbd0 >> "$FULL" 2>&1
 
 	udevadm settle
 
@@ -83,7 +83,7 @@ test() {
 
 	# Do it with netlink
 	echo "Testing the netlink path"
-	nbd-client -L -N export localhost /dev/nbd0 >> "$FULL" 2>&1
+	nbd-client -N export localhost /dev/nbd0 >> "$FULL" 2>&1
 
 	if ! _wait_for_nbd_connect; then
 		echo "Connect didn't happen?"
@@ -96,12 +96,12 @@ test() {
 
 	if  ! stat /dev/nbd0p1 >/dev/null 2>&1; then
 		echo "Didn't have partition on the netlink path"
-		nbd-client -L -d /dev/nbd0 >> "$FULL" 2>&1
+		nbd-client -d /dev/nbd0 >> "$FULL" 2>&1
 		_stop_nbd_server
 		return 1
 	fi
 
-	nbd-client -L -d /dev/nbd0 >> "$FULL" 2>&1
+	nbd-client -d /dev/nbd0 >> "$FULL" 2>&1
 
 	if ! _wait_for_nbd_disconnect; then
 		echo "Disconnect didn't happen?"
-- 
2.44.0

