Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 467F7289A99
	for <lists+nbd@lfdr.de>; Fri,  9 Oct 2020 23:28:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 26DA2202BA; Fri,  9 Oct 2020 21:28:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct  9 21:28:36 2020
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,SARE_MSGID_LONG40
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8A2722029F
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Oct 2020 21:28:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.243 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, SARE_MSGID_LONG40=0.637]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id R9CSI1aJ7SHM for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Oct 2020 21:28:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4353420268
	for <nbd@other.debian.org>; Fri,  9 Oct 2020 21:28:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 5A56E3AC90B
	for <nbd@other.debian.org>; Fri,  9 Oct 2020 21:19:07 +0000 (UTC)
X-Originating-IP: 67.5.25.97
Received: from localhost (unknown [67.5.25.97])
	(Authenticated sender: josh@joshtriplett.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 45FE1FF804;
	Fri,  9 Oct 2020 21:18:40 +0000 (UTC)
Date: Fri, 9 Oct 2020 14:18:37 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: [PATCH] nbd: Support Kconfig configuration of nbds_max and max_part
Message-ID: <f0a162a4c7073e3ed47d981b86d845d3bb9aa955.1602278122.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xHfoK4hIBMP.A.iJG.EYNgfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1013
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f0a162a4c7073e3ed47d981b86d845d3bb9aa955.1602278122.git.josh@joshtriplett.org
Resent-Date: Fri,  9 Oct 2020 21:28:36 +0000 (UTC)

This allows configuring them at compile time, not just via the kernel
command line or module parameters. This doesn't change the default
defaults, just makes them configurable.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
I'd like to be able to simplify the kernel command line I'm currently
using, by removing the nbd module parameters from it; this change would
make it possible to configure them when building the kernel, instead.

 drivers/block/Kconfig | 28 ++++++++++++++++++++++++++++
 drivers/block/nbd.c   | 10 ++++++----
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index ecceaaa1a66f..7df9a9609aee 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -273,6 +273,34 @@ config BLK_DEV_NBD
 
 	  If unsure, say N.
 
+config BLK_DEV_NBD_DEFAULT_NBDS_MAX
+	int "Default maximum number of NBD devices"
+	depends on BLK_DEV_NBD
+	default 16
+	help
+	  The NBD driver can provide a set of unconfigured NBD devices (nbd0,
+	  nbd1, ...) by default, so that userspace can open and configure these
+	  devices via the ioctl interface. If you know that your userspace uses
+	  exclusively the new netlink interface, you can set this to 0 to
+	  reduce the amount of time needed for the NBD driver to initialize.
+	  You can also set this parameter at runtime using the nbds_max module
+	  parameter.
+
+config BLK_DEV_NBD_DEFAULT_MAX_PART
+	int "Default maximum number of NBD device partitions"
+	depends on BLK_DEV_NBD
+	default 16
+	help
+	  Once an NBD device is set up and opened, the kernel can probe it for
+	  partitions, and set up corresponding devices for each partition
+	  (nbd0p1, nbd0p2, ...). By default, the kernel probes for up to 16
+	  partitions per device. This also adds a bit of time to NBD device
+	  initialization. You can set this to a lower number if you know you'll
+	  never use more than that many partitions on an NBD device. If you
+	  exclusively use unpartitioned NBD devices, you can set this to 0 to
+	  skip partition probing entirely.  You can also set this parameter at
+	  runtime using the max_part module parameter.
+
 config BLK_DEV_SKD
 	tristate "STEC S1120 Block Driver"
 	depends on PCI
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index edf8b632e3d2..42851956c9ce 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -145,8 +145,8 @@ static struct dentry *nbd_dbg_dir;
 
 #define NBD_DEF_BLKSIZE 1024
 
-static unsigned int nbds_max = 16;
-static int max_part = 16;
+static unsigned int nbds_max = CONFIG_BLK_DEV_NBD_DEFAULT_NBDS_MAX;
+static int max_part = CONFIG_BLK_DEV_NBD_DEFAULT_MAX_PART;
 static int part_shift;
 
 static int nbd_dev_dbg_init(struct nbd_device *nbd);
@@ -2456,6 +2456,8 @@ MODULE_DESCRIPTION("Network Block Device");
 MODULE_LICENSE("GPL");
 
 module_param(nbds_max, int, 0444);
-MODULE_PARM_DESC(nbds_max, "number of network block devices to initialize (default: 16)");
+MODULE_PARM_DESC(nbds_max, "number of network block devices to initialize (default: "
+	__stringify(CONFIG_BLK_DEV_NBD_DEFAULT_NBDS_MAX) ")");
 module_param(max_part, int, 0444);
-MODULE_PARM_DESC(max_part, "number of partitions per device (default: 16)");
+MODULE_PARM_DESC(max_part, "number of partitions per device (default: "
+	__stringify(CONFIG_BLK_DEV_NBD_DEFAULT_MAX_PART) ")");
-- 
2.28.0

