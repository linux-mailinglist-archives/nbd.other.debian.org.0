Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B402B39B4
	for <lists+nbd@lfdr.de>; Sun, 15 Nov 2020 22:42:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4A95F20394; Sun, 15 Nov 2020 21:42:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Nov 15 21:42:14 2020
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_MSPIKE_H2,
	SARE_MSGID_LONG40 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 927862032E
	for <lists-other-nbd@bendel.debian.org>; Sun, 15 Nov 2020 21:42:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.244 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_MSPIKE_H2=-0.001,
	SARE_MSGID_LONG40=0.637] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IG6LBddPvFAf for <lists-other-nbd@bendel.debian.org>;
	Sun, 15 Nov 2020 21:42:01 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .joshtriplett. - helo: .relay5-d.mail.gandi. - helo-domain: .gandi.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DB4FC202C6
	for <nbd@other.debian.org>; Sun, 15 Nov 2020 21:42:01 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
	(Authenticated sender: josh@joshtriplett.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1F1B71C0004;
	Sun, 15 Nov 2020 21:41:56 +0000 (UTC)
Date: Sun, 15 Nov 2020 13:41:53 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: [PATCH RESEND] nbd: Support Kconfig configuration of nbds_max and
 max_part
Message-ID: <f0a162a4c7073e3ed47d981b86d845d3bb9aa955.1605476443.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PfAPcdkab7K.A.3ED.2CasfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1067
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f0a162a4c7073e3ed47d981b86d845d3bb9aa955.1605476443.git.josh@joshtriplett.org
Resent-Date: Sun, 15 Nov 2020 21:42:14 +0000 (UTC)

This allows configuring them at compile time, rather than via the kernel
command line or module parameters. This doesn't change the default
defaults, just makes them configurable.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
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
2.29.2

