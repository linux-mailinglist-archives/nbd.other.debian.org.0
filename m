Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 771CD8A81A4
	for <lists+nbd@lfdr.de>; Wed, 17 Apr 2024 13:06:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 41077207F4; Wed, 17 Apr 2024 11:06:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 17 11:06:13 2024
Old-Return-Path: <prvs=830b8c31b=shinichiro.kawasaki@wdc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BB9BC207DF
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Apr 2024 10:49:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YlGDmfAVQvQV for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Apr 2024 10:49:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 439 seconds by postgrey-1.36 at bendel; Wed, 17 Apr 2024 10:49:34 UTC
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mx1.hgst.iphmx.com", Issuer "HydrantID Server CA O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 34A10207E7
	for <nbd@other.debian.org>; Wed, 17 Apr 2024 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1713350974; x=1744886974;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c9I8MKTorsqgSs+cuc1YuXPtLTUYdZF/snt/sNrGyYE=;
  b=pguq5fixGKRkmnhe21UxOXDhozcu62N+9ua6qnU5JX3/UWHNJGwyvbZP
   Y/EETtIFB6Cq50g2+fcFJtzTB1AH8tVaDt78b5oS2YK1wI8WAktp4FNkC
   5dJ++7+xkcNr4ps7sXE9fhvOsJrA1VoygA4qR87bpm2DccPcoAnl+Po+1
   94iyf/f3v8ITIWg3D2j28A2z8NyjewwPyA4k5lpRngb0TT8g8sOlj10wr
   UgKvNTL/QrgQ3p+6xZVLRI7K2Q3Jj2/u8HEZQfzTxnnDkXnvnukvzrKAw
   gwlyhmwssdpNmpfdquqZUdtHIi2KLCx26V0bsy2zxwXQjc+CoIgr8k0On
   A==;
X-CSE-ConnectionGUID: 49LzYen1RwC4ThAwLsGIiQ==
X-CSE-MsgGUID: HzCFvaK+RaKCOHp1qzbAdw==
X-IronPort-AV: E=Sophos;i="6.07,209,1708358400"; 
   d="scan'208";a="14913457"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2024 18:42:11 +0800
IronPort-SDR: XQCOPzlIUfRuasFa6EPSIaf0QmeNsjKLpMIZeBbnQN2cG4ZqKomGwrIuQWTx0KVU2VoIrNpFI2
 IjLYyvqy2Ygb0QzBr9voqgV/otiX1TnKuYUVID5WrNGG+ONq4gm9fHPvBBjDREoYEjJ/gTZpHT
 GmKPwyc4Q7VR2P1Sc03WkhgNoofafEtiq2IMqKnpxuMA3w7lFLtiArFLDPs2I+d8RSh8vMyrJI
 abKFaQCtD0JPmPCucgHh5SbRrruy516ac0D4Hl5Pa0XLA4unbyYitlLKKwRF46tzxleKLzUWNU
 yV0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Apr 2024 02:44:49 -0700
IronPort-SDR: nhvOm7+mm9Tu8HVUa41b97RB9gTP8gKbsbU2gNAH9ZqYsnPEVz5fpNaOiQE0qgZDhbtp7qIN3X
 zj6uZNCS4dQm1mlia1X3CMNoIdJuxtK1nNU+m/1KLw6DSKl0tUO5+qg03nZtNo9qnxn8ApL+lr
 kyquhx1wmVen0tiswwkkglseDKUAUzjEU1NxahT9KbgELqDCmvKoEqI0KotL0xyh1sMJ5uxrvP
 CWmysnvhax1HoFQTCct243yWUIfErij0iOQnRUA9KF5Q5LMtPnamnPmzuidE0f4nA57L+P6zQj
 +Y4=
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 17 Apr 2024 03:42:10 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: linux-block@vger.kernel.org
Cc: nbd@other.debian.org,
	Josef Bacik <josef@toxicpanda.com>,
	Yi Zhang <yi.zhang@redhat.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH blktests v2 0/2] fix nbd/002
Date: Wed, 17 Apr 2024 19:42:07 +0900
Message-ID: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <P5-OEPw0vUG.A.vmC.l06HmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2792
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240417104209.2898526-1-shinichiro.kawasaki@wdc.com
Resent-Date: Wed, 17 Apr 2024 11:06:13 +0000 (UTC)

Recently, CKI project found blktests nbd/002 failure. The test case sets up the
connection to the nbd device, then checks partition existence in the device to
confirm that the kernel reads the partition table in the device. Usually, this
partition read by kernel is completed before the test script checks the
partition existence. However, the partition read often completes after the
partition existence check, then the test case fails. I think the test script
checks the partition existence too early, and this should be fixed in the test
script.

During this investigation, I noticed that the test case nbd/002 handles the
ioctl interface and the netlink interface opposite. The first patch fixes this
wrong interface handling. The second patch addresses the too early partition
existence check issue.

Link to v1 patch: https://lore.kernel.org/linux-block/20240319085015.3901051-1-shinichiro.kawasaki@wdc.com/

Changes from v1:
* Added another patch to fix ioctl/netlink interface handling mistake
* Avoid the nbd/002 failure by repeating the partition existence check

Shin'ichiro Kawasaki (2):
  nbd/002: fix wrong -L/-nonetlink option usage
  nbd/002: repeat partition existence check for ioctl interface

 tests/nbd/002 | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
2.44.0

